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

    /** 对应的测试用例 */
    private TestCase testCase;

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

    public TestCase getTestCase() {
        return testCase;
    }

    public void setTestCase(TestCase testCase) {
        this.testCase = testCase;
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
