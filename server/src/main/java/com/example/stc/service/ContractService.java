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
    List<Contract> findContractsByAuthority();

    /**
     * 获取待办合同
     */
    List<Contract> findToDoContractsByAuthority();

    /**
     * 获取某用户全部合同
     */
    List<Contract> findContractByUser(String uid);

    /**
     * 通过PID查看单个合同
     */
    Contract findContractByPid(String pid);

    /**
     * 通过PID删除单个合同
     */
    void deleteContractByPid(String pid);

    /**
     * 插入单个合同
     */
    Contract newContract(Contract contract);

    /**
     * 自动创建单个合同
     */
    Contract newContract(String pid, String uid);

    /**
     * 通过合同ID修改单个合同记录
     */
    Contract updateContract(String pid, Contract record);

    /**
     * 修改流程状态, 添加评审意见
     * @param pid
     * @param processState
     * @param comment
     * @return
     */
    Contract updateProcessState(String pid, String processState, String comment);
}
