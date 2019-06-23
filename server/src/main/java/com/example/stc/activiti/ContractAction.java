package com.example.stc.activiti;

import com.alibaba.fastjson.JSONObject;
import com.example.stc.domain.Contract;
import com.example.stc.domain.User;
import com.example.stc.framework.util.AuthorityUtils;
import org.activiti.engine.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class ContractAction {

    @Autowired
    private STCProcessEngine stcProcessEngine;

    @Autowired
    private TaskService taskService;

    @Autowired
    private AuthorityUtils authorityUtils;

    /**
     * 根据JSON数据创建Process
     * @param param
     * @param user
     */
    public void createContractProcess(JSONObject param, User user) {
        Contract contract = JSONObject.toJavaObject(param, Contract.class);
        createContractProcess(contract, user);
    }

    /**
     * 根据Contract实体创建Process
     * @param contract
     * @param user
     */
    public String createContractProcess(Contract contract, User user) {
        Map<String, Object> variable = new HashMap<String, Object>();
        variable.put("ContractID", contract.getPid());
        variable.put("ClientID", user.getUserID());

        contract.setProcessInstanceID(stcProcessEngine.createProcess("Contract", variable));
        // contract.setProcessState(ProcessState.ToReview);
        return contract.getProcessInstanceID();
    }

    public void deleteContractProcess(Contract contract) {
        String processInstanceId = contract.getProcessInstanceID();
        if (!processInstanceId.equals(""))
            stcProcessEngine.deleteProcessInstance(processInstanceId);
    }

}
