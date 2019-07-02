package com.example.stc.domain;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 测试记录
 */
@Entity
@Table(name = "TBL_SYS_TESTRECORD")
public class TestRecord extends ProcessEntity {

    /** ID */
    private String testId;

    /** 测试分类 */
    private String testClass;

    /** 测试用例设计说明 */
    private String designNotes;

    /** 相关规约说明 */
    private String reguNotes;

    /** 预期结果 */
    private String expectedResult;

    /** 设计人 */
    private String designer;

    /** 测试时间 */
    private String testTime;

    /** 前提条件 */
    private String preCondition;

    /** 测试用例执行过程 */
    private String exeProcess;

    /** 实际结果 */
    private String realResult;

    /** 是否与预期结果一致 */
    private boolean isConsistent;

    /** 相关bug编号 */
    private String bugId;

    /** 用例执行者 */
    private String executor;

    /** 确认人 */
    private String approver;

    public String getTestId() {
        return testId;
    }

    public void setTestId(String testId) {
        this.testId = testId;
    }

    public String getTestClass() {
        return testClass;
    }

    public void setTestClass(String testClass) {
        this.testClass = testClass;
    }

    public String getDesignNotes() {
        return designNotes;
    }

    public void setDesignNotes(String designNotes) {
        this.designNotes = designNotes;
    }

    public String getReguNotes() {
        return reguNotes;
    }

    public void setReguNotes(String reguNotes) {
        this.reguNotes = reguNotes;
    }

    public String getExpectedResult() {
        return expectedResult;
    }

    public void setExpectedResult(String expectedResult) {
        this.expectedResult = expectedResult;
    }

    public String getDesigner() {
        return designer;
    }

    public void setDesigner(String designer) {
        this.designer = designer;
    }

    public String getTestTime() {
        return testTime;
    }

    public void setTestTime(String testTime) {
        this.testTime = testTime;
    }

    public String getPreCondition() {
        return preCondition;
    }

    public void setPreCondition(String preCondition) {
        this.preCondition = preCondition;
    }

    public String getExeProcess() {
        return exeProcess;
    }

    public void setExeProcess(String exeProcess) {
        this.exeProcess = exeProcess;
    }

    public String getRealResult() {
        return realResult;
    }

    public void setRealResult(String realResult) {
        this.realResult = realResult;
    }

    public boolean isConsistent() {
        return isConsistent;
    }

    public void setConsistent(boolean consistent) {
        isConsistent = consistent;
    }

    public String getBugId() {
        return bugId;
    }

    public void setBugId(String bugId) {
        this.bugId = bugId;
    }

    public String getExecutor() {
        return executor;
    }

    public void setExecutor(String executor) {
        this.executor = executor;
    }

    public String getApprover() {
        return approver;
    }

    public void setApprover(String approver) {
        this.approver = approver;
    }
}
