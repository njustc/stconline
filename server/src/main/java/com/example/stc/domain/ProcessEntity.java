package com.example.stc.domain;

public class ProcessEntity extends BaseEntity{
    private String processInstanceID;

    public String getProcessInstanceID() {
        return processInstanceID;
    }

    public void setProcessInstanceID(String processInstanceID) {
        this.processInstanceID = processInstanceID;
    }
}
