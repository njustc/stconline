package com.example.stc.service.impl;

import com.example.stc.activiti.ProcessService;
import com.example.stc.activiti.ProcessState;
import com.example.stc.activiti.STCProcessEngine;
import com.example.stc.domain.Contract;
import com.example.stc.domain.Role;
import com.example.stc.domain.User;
import com.example.stc.framework.exception.ContractNotFoundException;
import com.example.stc.framework.exception.UserNotFoundException;
import com.example.stc.framework.util.AuthorityUtils;
import com.example.stc.framework.util.DateUtils;
import com.example.stc.framework.util.ProcessUtils;
import com.example.stc.repository.*;
import com.example.stc.service.ContractService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ContractServiceImpl implements ContractService{

    Logger logger = LoggerFactory.getLogger(ContractServiceImpl.class);

    @Autowired
    private ContractRepository contractRepository;

    @Autowired
    private TestPlanRepository testPlanRepository;

    @Autowired
    private TestRecordRepository testRecordRepository;

    @Autowired
    private TestReportRepository testReportRepository;

    @Autowired
    private AuthorityUtils authorityUtils;

    @Autowired
    private ProcessUtils processUtils;
    
    @Autowired
    private ProcessService processService;

    @Override
    public List<Contract> findAllContracts() {
        logger.info("findAllContracts: 查看全部合同");
        return contractRepository.findAll();
    }

    @Override
    public List<Contract> findContractsByAuthority() {
        User curUser = authorityUtils.getLoginUser();
        logger.info("findContractsByAuthority: 当前登录者id = " + curUser.getUserID() +
                ", name = " + curUser.getUsername() + ", roles = " + curUser.getRoles());
//        // 若为用户，返回该用户全部合同
//        if (authorityUtils.hasAuthority(Role.Customer)) {
//            return findContractByUser(curUser.getUserID());
//        }
//        // 若为工作人员，返回全部合同
//        return findAllContracts();
        List<Contract> allContracts = this.findAllContracts();
        allContracts.removeIf(contract -> !processUtils.isVisible(contract, "Contract"));
        return allContracts;
    }

    @Override
    public List<Contract> findContractByUser(String uid) {
        logger.info("findContractsByUser: 查看某用户全部合同");
        List<Contract> allContracts = this.findAllContracts();
        allContracts.removeIf(contract -> !contract.getUserId().equals(uid));
        return allContracts;
    }

    /**
     * 对于客户，检查访问的是否是本人的合同；若不是，权限异常
     */
    private void customerAccessCheck(Contract contract) {
        if (authorityUtils.hasAuthority(Role.Customer)) {
            User curUser = authorityUtils.getLoginUser();
            if (!contract.getUserId().equals(curUser.getUserID())) {
                logger.info("customerAccessCheck: 没有查看权限，客户只能查看自己的合同");
                throw new AccessDeniedException("没有查看权限，客户只能查看自己的合同");
            }
        }
    }

    @Override
    public Contract findContractById(Long id) {
        Contract contract = contractRepository.findById(id)
                .orElseThrow(() -> new ContractNotFoundException(id));
        logger.info("findContractById: ");

        this.customerAccessCheck(contract); // 若为客户，只能访问本人的合同

        return contract;
    }

    @Override
    public Contract findContractByPid(String pid) {
        Contract contract = contractRepository.findByPid(pid);
        if (contract == null)
            throw new ContractNotFoundException(pid);
        logger.info("findContractByPid: ");

        this.customerAccessCheck(contract); // 若为客户，只能访问本人的合同

        return contract;
    }

    @Override
    public void deleteContractById(Long id) {
        logger.info("deleteContractById: ");
        Contract contract = this.findContractById(id);
        contractRepository.deleteById(id);
    }

    @Override
    public void deleteContractByPid(String pid) {
        logger.info("deleteContractByPid: ");
        Contract contract = this.findContractByPid(pid);
        contractRepository.deleteByPid(pid);
        // 同时删除对应的委托，测试方案，测试记录，测试报告
        contractRepository.deleteByPid(pid);
        testPlanRepository.deleteByPid(pid);
        testReportRepository.deleteByPid(pid);
        testRecordRepository.deleteByPid(pid);
    }

    @Override
    public Contract newContract(Contract contract) {
        logger.info("newContract: ");
        contract.setUserId(authorityUtils.getLoginUser().getUserID());
        contract.setProcessState(ProcessState.Submit); // 待提交（未进入流程）
        return contractRepository.save(contract);
    }

    @Override
    public Contract newContract(String pid, String uid) {
        logger.info("newContractAuto: ");
        Contract contract = new Contract();
        contract.setPid(pid);
        contract.setUserId(uid);
        contract.setProcessState(ProcessState.Submit); // 待提交（未进入流程）
        // DEBUG：若数据库中该项目已存在，则覆盖原项目
        contractRepository.deleteByPid(pid);
        return contractRepository.save(contract);
    }

    @Override
    public Contract updateContract(String pid, Contract record) {
        logger.info("updateContract: ");
        /**
         * TODO: 增加更新逻辑
         */
        Contract contract = contractRepository.findByPid(pid);
        record.setId(contract.getId());
        record.setPid(pid);
        record.setUserId(contract.getUserId());
        if (record.getProcessInstanceId() == null || record.getProcessInstanceId().equals("")) {
            record.setProcessState(contract.getProcessState());
            record.setProcessInstanceId(contract.getProcessInstanceId());
        }
        return contractRepository.save(record);
    }

    @Override
    public Contract updateProcessState(String pid, String processState, String comment) {
        Contract contract = this.findContractByPid(pid);
        contract.setProcessState(processState);
        contract.setComment(comment);
        return this.updateContract(pid, contract);
    }
}
