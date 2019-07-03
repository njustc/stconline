package com.example.stc.activiti;

import com.alibaba.fastjson.JSONObject;
import com.example.stc.domain.Contract;
import com.example.stc.domain.Entrust;
import com.example.stc.domain.ProcessEntity;
import com.example.stc.domain.User;
import com.example.stc.framework.util.AuthorityUtils;
import com.example.stc.framework.util.ProcessUtils;
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
    private ProcessUtils processUtils;

    /**
     * 创建委托流程
     * @param entrust
     */
    @Override
    public void createEntrustProcess(Entrust entrust) {
        User user = authorityUtils.getLoginUser();
        Map<String, Object> variable = new HashMap<String, Object>();
        variable.put("EntrustID", entrust.getPid());
        variable.put("ClientID", user.getUserID());
        entrust.setProcessInstanceID(stcProcessEngine.createProcess("Entrust", variable));
    }

    @Override
    public void createContractProcess(Contract contract) {

    }

    @Override
    public void deleteProcessInstance(ProcessEntity entity) {
        if (!entity.getProcessInstanceID().equals("")) {
            stcProcessEngine.deleteProcessInstance(entity.getProcessInstanceID());
        }
    }

    @Override
    public void queryProcessState(ProcessEntity entity) {
        entity.setProcessState(processUtils.getEntrustProcessState(entity.getProcessInstanceID()));
    }

    @Override
    public void updateProcessInstance(ProcessEntity entity) {

    }

}
