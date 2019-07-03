package com.example.stc.activiti;

import com.alibaba.fastjson.JSONObject;
import com.example.stc.domain.ProcessEntity;
import org.springframework.stereotype.Service;

@Service
public class ProcessServiceImpl implements ProcessService {

    @Override
    public void createProcessInstance(ProcessEntity entity) {

    }

    @Override
    public boolean deleteProcessInstance(ProcessEntity entity) {
        return false;
    }

    @Override
    public JSONObject queryProcessState(ProcessEntity entity) {
        return null;
    }

    @Override
    public ProcessEntity updateProcessInstance(ProcessEntity entity) {
        return null;
    }

}
