package com.example.stc.domain;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 测试方案
 */
@Entity
@Table(name = "TBL_SYS_TESTPLAN")
public class TestPlan extends ProcessEntity {

    /** 测试方案文档整体 */
    private String body;

    /** 编制人 */
    private String author;

    /** 审核人 */
    private String auditor;

    /** 批准人 */
    private String approver;

    /** 测试环境--硬件 */
    private String hardware;

    /** 测试环境--软件 */
    private String software;

    /** 测试环境--人员 */
    private String staff;

    /** 测试进度表 */
    private String progressTable;

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getAuditor() {
        return auditor;
    }

    public void setAuditor(String auditor) {
        this.auditor = auditor;
    }

    public String getApprover() {
        return approver;
    }

    public void setApprover(String approver) {
        this.approver = approver;
    }

    public String getHardware() {
        return hardware;
    }

    public void setHardware(String hardware) {
        this.hardware = hardware;
    }

    public String getSoftware() {
        return software;
    }

    public void setSoftware(String software) {
        this.software = software;
    }

    public String getStaff() {
        return staff;
    }

    public void setStaff(String staff) {
        this.staff = staff;
    }

    public String getProgressTable() {
        return progressTable;
    }

    public void setProgressTable(String progressTable) {
        this.progressTable = progressTable;
    }
}
