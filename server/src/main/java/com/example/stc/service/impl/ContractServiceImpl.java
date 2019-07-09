package com.example.stc.service.impl;

import com.example.stc.activiti.ProcessService;
import com.example.stc.activiti.ProcessState;
import com.example.stc.activiti.STCProcessEngine;
import com.example.stc.domain.Contract;
import com.example.stc.domain.Entrust;
import com.example.stc.domain.Role;
import com.example.stc.domain.User;
import com.example.stc.framework.exception.ContractNotFoundException;
import com.example.stc.framework.exception.UserNotFoundException;
import com.example.stc.framework.util.AuthorityUtils;
import com.example.stc.framework.util.DateUtils;
import com.example.stc.framework.util.FileUtils;
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
    private EntrustRepository entrustRepository;

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

    @Override
    public List<Contract> findAllContracts() {
        logger.info("findAllContracts: ");
        return contractRepository.findAll();
    }

    @Override
    public List<Contract> findContractsByAuthority() {
        User curUser = authorityUtils.getLoginUser();
        logger.info("findContractsByAuthority: 当前登录者id = " + curUser.getUserID() +
                ", name = " + curUser.getUsername() + ", roles = " + curUser.getRoles());
        List<Contract> allContracts = this.findAllContracts();
        allContracts.removeIf(contract -> !processUtils.isVisible(contract, "Contract"));
        return allContracts;
    }

    @Override
    public List<Contract> findToDoContractsByAuthority() {
        User curUser = authorityUtils.getLoginUser();
        logger.info("findToDoContractsByAuthority: 当前登录者id = " + curUser.getUserID() +
                ", name = " + curUser.getUsername() + ", roles = " + curUser.getRoles());
        List<Contract> allContracts = this.findAllContracts();
        allContracts.removeIf(contract -> !processUtils.isTodo(contract, "Contract"));
        return allContracts;
    }

    @Override
    public List<Contract> findContractByUser(String uid) {
        logger.info("findContractsByUser:");
        List<Contract> allContracts = this.findAllContracts();
        allContracts.removeIf(contract -> !contract.getUserId().equals(uid));
        return allContracts;
    }

    @Override
    public Contract findContractByPid(String pid) {
        logger.info("findContractByPid: ");
        Contract contract = contractRepository.findByPid(pid);
        if (contract == null)
            throw new ContractNotFoundException(pid);
        return contract;
    }

    @Override
    public void deleteContractByPid(String pid) {
        logger.info("deleteContractByPid: ");
        Contract contract = this.findContractByPid(pid);
        contractRepository.deleteByPid(pid);
        // 同时删除对应的委托，文件，测试方案，测试记录，测试报告
        entrustRepository.deleteByPid(pid);
        FileUtils.deleteAllFiles(pid);
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
        contract.setProcessInstanceId("");
        contract.setProcessState(ProcessState.Submit); // 待提交（未进入流程）
        // 设置软件名和委托单位
        Entrust entrust = entrustRepository.findByPid(contract.getPid());
        if (entrust != null) {
            contract.setSoftwareName(entrust.getSoftwareName());
            contract.setClient(entrust.getCompanyCh());
        }
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
