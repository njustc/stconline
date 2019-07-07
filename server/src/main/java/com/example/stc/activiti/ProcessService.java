package com.example.stc.activiti;

import com.alibaba.fastjson.JSONObject;
import com.example.stc.domain.Contract;
import com.example.stc.domain.Entrust;
import com.example.stc.domain.ProcessEntity;
import com.example.stc.service.BaseService;

public interface ProcessService extends BaseService<ProcessEntity> {

    void createProcessInstance(String pid, String type);

    void createEntrustProcess(String pid);

    void createContractProcess(String pid);

    void createTestPlanProcess(String pid);

    void createTestReportProcess(String pid);

    void createTestRecordProcess(String testId);

    void deleteProcessInstance(ProcessEntity entity);

    String queryProcessState(JSONObject entity);

    String queryProcessState(ProcessEntity entity);

    void updateProcessInstance(JSONObject object, String type);

    String getProcessComment(String processInstanceId);

    int queryProjectState(String pid);

}
