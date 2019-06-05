package com.example.stc.domain;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class ProcessEntity extends BaseEntity{

    @Column
    private String processInstanceId;

    @Column
    private String processState;

    public String getProcessInstanceID() {
        return processInstanceId;
    }

    public void setProcessInstanceID(String processInstanceID) {
        this.processInstanceId = processInstanceID;
    }

    public String getProcessState() {
        return processState;
    }

    public void setProcessState(String processState) {
        this.processState = processState;
    }
}
