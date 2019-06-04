package com.example.stc.domain;

import com.example.stc.activiti.ProcessState;

public class ProcessEntity extends BaseEntity{
    private String processInstanceID;

    private ProcessState processState;

    public String getProcessInstanceID() {
        return processInstanceID;
    }

    public void setProcessInstanceID(String processInstanceID) {
        this.processInstanceID = processInstanceID;
    }

    public ProcessState getProcessState() {
        return processState;
    }

    public void setProcessState(ProcessState processState) {
        this.processState = processState;
    }
}
