package com.example.stc.service.impl;

import com.example.stc.activiti.ContractAction;
import com.example.stc.domain.Contract;
import com.example.stc.domain.Role;
import com.example.stc.framework.exception.ContractNotFoundException;
import com.example.stc.framework.util.AuthorityUtils;
import com.example.stc.framework.util.DateUtils;
import com.example.stc.repository.ContractRepository;
import com.example.stc.repository.ProjectRepository;
import com.example.stc.service.ContractService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@Service
public class ContractServiceImpl implements ContractService{
    Logger logger = LoggerFactory.getLogger(ContractServiceImpl.class);

    @Autowired
    private ContractRepository contractRepository;

    @Autowired
    private ProjectRepository projectRepository;

    @Autowired
    private DateUtils dateUtils;

    @Autowired
    private AuthorityUtils authorityUtils;

    @Autowired
    private ContractAction contractAction;

    @Override
    public List<Contract> findAllContracts() {
        logger.info("findAllContracts: 查看全部合同");
        return contractRepository.findAll();
    }

    @Override
    public List<Contract> findContractsByAuthority() {
        List<Contract> allContracts = this.findAllContracts();
        if (authorityUtils.hasAuthority(Role.Customer)) {
            logger.info("findContractByAuthority: 仅查看当前客户合同");
            Iterator<Contract> it = allContracts.iterator();
            while (it.hasNext()) {
                Contract contract = it.next();
                if (!contract.getUser().getUsername().equals(authorityUtils.getLoginUser().getUsername()))
                    it.remove();
            }
        } else logger.info("findContractsByAuthority: 查看全部合同");
        return allContracts;
    }

    @Override
    public List<Contract> findContractByUser(String uid) {
        logger.info("findContractsByUser: 查看某用户全部合同");
        List<Contract> allContracts = this.findAllContracts();
        Iterator<Contract> it = allContracts.iterator();
        while (it.hasNext()) {
            Contract contract = it.next();
            if (!contract.getUser().getUsername().equals(uid))
                it.remove();
        }
        return allContracts;
    }

    /**
     * 对于客户，检查访问的是否是本人的合同；若不是，权限异常
     */
    @Override
    public Contract findContractById(Long id) {
        Contract contract = contractRepository.findById(id)
                .orElseThrow(() -> new ContractNotFoundException(id));
        logger.info("findContractById: ");
        return contract;
    }

    @Override
    public Contract findContractByPid(String pid) {
        Contract contract = contractRepository.findByPid(pid);
        if (contract == null)
            throw new ContractNotFoundException(pid);
        logger.info("findContractByPid: ");
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
        //contractAction.deleteContractProcess(contract);

        int n = contractRepository.deleteByPid(pid);
        if (0 == n) {
            throw new ContractNotFoundException("record not found");
        }
    }

    @Override
    public Contract newContract(Contract contract) {
        logger.info("newContract: ");
        //contract.setPid("p" + dateUtils.dateToStr(new Date(), "yyyyMMddHHmmss"));
        contract.setProcessState("ToSubmit");
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
        record.setUser(contract.getUser());
        record.setProcessState(contract.getProcessState());
        record.setProcessInstanceID(contract.getProcessInstanceID());
        return contractRepository.save(record);
    }
}
