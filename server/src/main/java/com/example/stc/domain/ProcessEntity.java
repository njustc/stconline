package com.example.stc.domain;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

/**
 * 作为参与流程引擎的实体类的父类
 */
@MappedSuperclass
public class ProcessEntity extends BaseEntity {
    @Column(name = "PROCESS_INSTANCE_ID")
    private String processInstanceID;

    public String getProcessInstanceID() {
        return processInstanceID;
    }

    public void setProcessInstanceID(String processInstanceID) {
        this.processInstanceID = processInstanceID;
    }
}
