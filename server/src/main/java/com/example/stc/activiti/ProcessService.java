package com.example.stc.activiti;

import com.alibaba.fastjson.JSONObject;
import com.example.stc.domain.Contract;
import com.example.stc.domain.Entrust;
import com.example.stc.domain.ProcessEntity;
import com.example.stc.service.BaseService;

public interface ProcessService extends BaseService<ProcessEntity> {

    void createEntrustProcess(Entrust entrust);

    void createContractProcess(Contract contract);

    void deleteProcessInstance(ProcessEntity entity);

    void queryProcessState(ProcessEntity entity);

    ProcessEntity updateProcessInstance(ProcessEntity entity);

}
