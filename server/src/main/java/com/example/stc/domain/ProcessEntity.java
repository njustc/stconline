package com.example.stc.domain;

import com.example.stc.activiti.ProcessState;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;
import java.util.List;

@MappedSuperclass
public class ProcessEntity extends BaseEntity{

    @Column
    private String processInstanceId;

    @Column
    private ProcessState processState;

    @Column
    private String pid;

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

    public void setProcessState(String state) {
        ProcessState states[] = ProcessState.values();
        for (ProcessState processState: states) {
            if (state.equals(processState.getName())) {
                this.processState = processState;
                return;
            }
        }
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }
}
