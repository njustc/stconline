package com.example.stc.service;

import com.example.stc.domain.Contract;
import org.springframework.security.access.annotation.Secured;

import java.util.List;

/**
 * 合同管理业务逻辑
 */
public interface ContractService extends BaseService<Contract>{
    /**
     * 获取全部合同
     */
    List<Contract> findAllContracts();

    /**
     * 依据权限获取合同
     */
    @Secured("ROLE_USER")
    List<Contract> findContractsByAuthority();

    /**
     * 获取某用户全部合同
     */
    @Secured({"ROLE_USER", "ROLE_STAFF"})
    List<Contract> findContractByUser(String uid);

    /**
     * 通过主键ID查看单个合同记录
     */
    @Secured("ROLE_USER")
    Contract findContractById(Long id);

    /**
     * 通过PID查看单个合同
     */
    @Secured("ROLE_USER")
    Contract findContractByPid(String pid);

    /**
     * 通过合同ID删除单个合同
     */
    @Secured({"ROLE_USER", "ROLE_CUS"})
    void deleteContractById(Long id);

    /**
     * 通过PID删除单个合同
     */
    @Secured({"ROLE_USER", "ROLE_CUS"})
    void deleteContractByPid(String pid);

    /**
     * 插入单个合同
     */
    @Secured({"ROLE_USER", "ROLE_CUS"})
    Contract newContract(Contract contract);

    /**
     * 自动创建单个合同
     */
    Contract newContract(String pid, String uid);

    /**
     * 通过合同ID修改单个合同记录
     */
    @Secured({"ROLE_USER", "ROLE_CUS"})
    Contract updateContract(String pid, Contract record);

    /**
     * 修改评审意见
     * @param pid
     * @param comment
     */
    void saveComment(String pid, String comment);
}
