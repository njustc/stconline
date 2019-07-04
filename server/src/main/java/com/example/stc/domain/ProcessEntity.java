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

    @Column
    private String userId;

    @Column(name = "OPERATION")
    private String operation;

    @Column(name = "COMMENT")
    private String comment;

    public String getProcessInstanceId() {
        return processInstanceId;
    }

    public void setProcessInstanceId(String processInstanceId) {
        this.processInstanceId = processInstanceId;
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

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getOperation() {
        return operation;
    }

    public void setOperation(String operation) {
        this.operation = operation;
    }
}
