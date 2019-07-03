package com.example.stc.activiti;

import com.alibaba.fastjson.JSONObject;
import com.example.stc.domain.ProcessEntity;
import com.example.stc.service.BaseService;

public interface ProcessService extends BaseService<ProcessEntity> {

    void createProcessInstance(ProcessEntity entity);

    boolean deleteProcessInstance(ProcessEntity entity);

    JSONObject queryProcessState(ProcessEntity entity);

    ProcessEntity updateProcessInstance(ProcessEntity entity);

}
