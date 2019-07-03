package com.example.stc.activiti;

import com.alibaba.fastjson.JSONObject;
import com.example.stc.domain.*;
import com.example.stc.framework.util.AuthorityUtils;
import com.example.stc.framework.util.ProcessUtils;
import com.example.stc.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class ProcessServiceImpl implements ProcessService {

    @Autowired
    private STCProcessEngine stcProcessEngine;

    @Autowired
    private AuthorityUtils authorityUtils;

    @Autowired
    private EntrustService entrustService;

    @Override
    public void createProcessInstance(String pid, String type) {
        switch (type) {
            case "Entrust": createEntrustProcess(pid); break;
            case "Contract": createContractProcess(pid); break;
            default: break;
        }
    }

    /**
     * 创建委托流程
     * @param pid
     */
    @Override
    public void createEntrustProcess(String pid) {
        Entrust entrust = entrustService.findEntrustByPid(pid);
        User user = authorityUtils.getLoginUser();
        Map<String, Object> variable = new HashMap<String, Object>();
        variable.put("EntrustID", pid);
        variable.put("ClientID", user.getUserID());
        entrust.setProcessInstanceID(stcProcessEngine.createProcess("Entrust", variable));
        entrustService.updateEntrust(pid, entrust);
        queryProcessState(entrust);
    }

    @Override
    public void createContractProcess(String pid) {

    }

    @Override
    public void deleteProcessInstance(ProcessEntity entity) {
        if (!entity.getProcessInstanceID().equals("")) {
            stcProcessEngine.deleteProcessInstance(entity.getProcessInstanceID());
        }
    }

    @Override
    public void queryProcessState(ProcessEntity entity) {
        entity.setProcessState(stcProcessEngine.getProcessState(entity.getProcessInstanceID()));
    }

    @Override
    public void updateProcessInstance(ProcessEntity entity) {
        stcProcessEngine.updateProcess(entity);
    }

}
