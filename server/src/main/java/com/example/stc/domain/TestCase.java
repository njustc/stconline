package com.example.stc.domain;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 测试用例
 */
@Entity
@Table(name = "TBL_SYS_TESTCASE")
public class TestCase extends ProcessEntity {

    /** 测试分类 */
    private String testClass;

    /** ID */
    private String testId;

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

    public String getTestClass() {
        return testClass;
    }

    public void setTestClass(String testClass) {
        this.testClass = testClass;
    }

    public String getTestId() {
        return testId;
    }

    public void setTestId(String testId) {
        this.testId = testId;
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
}
