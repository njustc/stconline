package com.example.stc.activiti;

import org.activiti.engine.FormService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.runtime.ProcessInstance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.stc.domain.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 根据BaseOperation中的状态分类定义了两类Operation
 * 定义了创建具体流程实例的接口
 */
@Service
public class TCProcessEngine {
    @Autowired
    RuntimeService runtimeService;

    @Autowired
    TaskService taskService;

    @Autowired
    HistoryService historyService;

    @Autowired
    FormService formService;

    @Autowired
    private BaseOperation baseOperation;

    enum noGateOperation {
        Submit, Write, Implement, Send, Done, Fil, Satisfact
    }
    enum GateOperation{
        Review, Confirm, Approve
    }

    //TODO:添加用户组，用法与BaseOperation中类似

    /**
     * 新建委托实例
     * @param entrustId 委托ID
     * @param clientId 客户ID
     * @return 以String形式返回流程实例的ID
     * @throws Exception 新建委托实例失败
     */
    public String createEntrustProcess(String entrustId, String clientId) throws Exception {
        Map<String, Object> variables = new HashMap<String, Object>();
        variables.put("EntrustID", entrustId);
        variables.put("ClientID", clientId);
        List<String> userids = this.getWorkersList();
        if (!userids.isEmpty()) {
            for (String userid : userids) {
                variables.put("WorkerIDs", userid);
            }
        } else
            throw new Exception("EMPTY");
        ProcessInstance pi = runtimeService.startProcessInstanceByKey("Entrust", variables);
        return pi.getProcessInstanceId();
    }

    /**
     * 获取工作人员列表
     * @return 以字符串形式返回工作人员ID
     */
    public List<String> getWorkersList() {
        //TODO:添加获得工作人员列表的方法
        return null;
    }
}
