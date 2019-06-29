package com.example.stc.domain;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * 测试报告
 */
@Entity
@Table(name = "TBL_SYS_TESTREPORT")
public class TestReport extends ProcessEntity {

    /** 软件名称 */
    private String softwareName;

    /** 版本号 */
    private String version;

    /** 委托单位 */
    private String clientCompany;

    /** 测试类别 */
    private String testType;

    /** 报告日期 */
    private String reportData;

    /** 项目编号 */
    private String codeId;

    /** 样品名称 */
    private String sampleName;

    /** 来样日期 */
    private String sampleData;

    /** 测试日期 */
    private String testData;

    /** 样品状态 */
    private String sampleState;

    /** 测试依据 */
    private String testBasis;

    /** 样品清单 */
    private String sampleMenu;

    /** 测试结论 */
    private String testConclusion;

    /** 主测人 */
    private String tester;

    /** 主测人日期 */
    private String testerTime;

    /** 审核人 */
    private String auditor;

    /** 审核人日期 */
    private String auditorData;

    /** 批准人 */
    private String approver;

    /** 批准人日期 */
    private String approverData;

    /** 委托单位电话 */
    private String clientTel;

    /** 委托单位传真 */
    private String clientFax;

    /** 委托单位地址 */
    private String clientAddr;

    /** 委托单位邮编 */
    private String clientPostCode;

    /** 委托单位联系人 */
    private String clientContact;

    /** 委托单位Email */
    private String clientEmail;

    /** 测试环境 - 硬件 */
    private String hardwareEnvironment;

    /** 测试环境 - 软件 */
    private String softwareEnvironment;

    /** 参考资料 */
    private String reference;

    /** 测试内容 */
    private String testContent;

    /** 测试执行记录 */
    private String testExeRecord;

    public String getSoftwareName() {
        return softwareName;
    }

    public void setSoftwareName(String softwareName) {
        this.softwareName = softwareName;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getClientCompany() {
        return clientCompany;
    }

    public void setClientCompany(String clientCompany) {
        this.clientCompany = clientCompany;
    }

    public String getTestType() {
        return testType;
    }

    public void setTestType(String testType) {
        this.testType = testType;
    }

    public String getReportData() {
        return reportData;
    }

    public void setReportData(String reportData) {
        this.reportData = reportData;
    }

    public String getCodeId() {
        return codeId;
    }

    public void setCodeId(String codeId) {
        this.codeId = codeId;
    }

    public String getSampleName() {
        return sampleName;
    }

    public void setSampleName(String sampleName) {
        this.sampleName = sampleName;
    }

    public String getSampleData() {
        return sampleData;
    }

    public void setSampleData(String sampleData) {
        this.sampleData = sampleData;
    }

    public String getTestData() {
        return testData;
    }

    public void setTestData(String testData) {
        this.testData = testData;
    }

    public String getSampleState() {
        return sampleState;
    }

    public void setSampleState(String sampleState) {
        this.sampleState = sampleState;
    }

    public String getTestBasis() {
        return testBasis;
    }

    public void setTestBasis(String testBasis) {
        this.testBasis = testBasis;
    }

    public String getSampleMenu() {
        return sampleMenu;
    }

    public void setSampleMenu(String sampleMenu) {
        this.sampleMenu = sampleMenu;
    }

    public String getTestConclusion() {
        return testConclusion;
    }

    public void setTestConclusion(String testConclusion) {
        this.testConclusion = testConclusion;
    }

    public String getTester() {
        return tester;
    }

    public void setTester(String tester) {
        this.tester = tester;
    }

    public String getTesterTime() {
        return testerTime;
    }

    public void setTesterTime(String testerTime) {
        this.testerTime = testerTime;
    }

    public String getAuditor() {
        return auditor;
    }

    public void setAuditor(String auditor) {
        this.auditor = auditor;
    }

    public String getAuditorData() {
        return auditorData;
    }

    public void setAuditorData(String auditorData) {
        this.auditorData = auditorData;
    }

    public String getApprover() {
        return approver;
    }

    public void setApprover(String approver) {
        this.approver = approver;
    }

    public String getApproverData() {
        return approverData;
    }

    public void setApproverData(String approverData) {
        this.approverData = approverData;
    }

    public String getClientTel() {
        return clientTel;
    }

    public void setClientTel(String clientTel) {
        this.clientTel = clientTel;
    }

    public String getClientFax() {
        return clientFax;
    }

    public void setClientFax(String clientFax) {
        this.clientFax = clientFax;
    }

    public String getClientAddr() {
        return clientAddr;
    }

    public void setClientAddr(String clientAddr) {
        this.clientAddr = clientAddr;
    }

    public String getClientPostCode() {
        return clientPostCode;
    }

    public void setClientPostCode(String clientPostCode) {
        this.clientPostCode = clientPostCode;
    }

    public String getClientContact() {
        return clientContact;
    }

    public void setClientContact(String clientContact) {
        this.clientContact = clientContact;
    }

    public String getClientEmail() {
        return clientEmail;
    }

    public void setClientEmail(String clientEmail) {
        this.clientEmail = clientEmail;
    }

    public String getHardwareEnvironment() {
        return hardwareEnvironment;
    }

    public void setHardwareEnvironment(String hardwareEnvironment) {
        this.hardwareEnvironment = hardwareEnvironment;
    }

    public String getSoftwareEnvironment() {
        return softwareEnvironment;
    }

    public void setSoftwareEnvironment(String softwareEnvironment) {
        this.softwareEnvironment = softwareEnvironment;
    }

    public String getReference() {
        return reference;
    }

    public void setReference(String reference) {
        this.reference = reference;
    }

    public String getTestContent() {
        return testContent;
    }

    public void setTestContent(String testContent) {
        this.testContent = testContent;
    }

    public String getTestExeRecord() {
        return testExeRecord;
    }

    public void setTestExeRecord(String testExeRecord) {
        this.testExeRecord = testExeRecord;
    }
}