package com.example.stc.domain;

import com.example.stc.activiti.ProcessState;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class ProcessEntity extends BaseEntity{

    @Column
    private String processInstanceId;

    @Column
    private ProcessState processState;

    public String getProcessInstanceID() {
        return processInstanceId;
    }

    public void setProcessInstanceID(String processInstanceID) {
        this.processInstanceId = processInstanceID;
    }

    public ProcessState getProcessState() {
        return processState;
    }

    public void setProcessState(ProcessState processState) {
        this.processState = processState;
    }
}
