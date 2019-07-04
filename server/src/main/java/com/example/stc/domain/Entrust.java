package com.example.stc.domain;

import javax.persistence.*;

@Entity
@Table(name = "TBL_SYS_ENTRUST")
public class Entrust extends ProcessEntity {

    /**
     * 测试类型（多选）
     */
    private String testType;

    /**
     * 软件名称
     */
    private String softwareName;

    /**
     * 版本号
     */
    private String version;

    /**
     * 委托单位(英文)
     */
    private String companyEn;

    /**
     * 委托单位(中文)
     */
    private String companyCh;

    /**
     * 开发单位
     */
    private String developer;

    /**
     * 单位性质（单选）
     */
    private String unitProperty;

    /**
     * 软件用户对象
     */
    private String userDescription;

    /**
     * 主要功能及用途简介
     */
    private String funcDescription;

    /**
     * 测试依据（多选）
     */
    private String testBasis;

    /**
     * 需要测试的技术指标（多选）
     */
    private String testSpecification;

    /**
     * 软件规模 - 功能数
     */
    private String funcNum;

    /**
     * 软件规模 - 功能点数
     */
    private String fpNum;

    /**
     * 软件规模 - 代码行数
     */
    private String codeLine;

    /**
     * 软件类型（单选）
     */
    private String softwareType;

    /**
     * 运行环境 - 客户端 - 操作系统（多选）
     */
    private String clientSystem;

    /**
     * 运行环境 - 客户端 - 内存要求
     */
    private String clientInStorage;

    /**
     * 运行环境 - 客户端 - 硬盘要求
     */
    private String clientExStorage;

    /**
     * 运行环境 - 客户端 - 其它要求
     */
    private String clientOther;

    /**
     * 运行环境 - 服务器端 - 硬件 - 架构（多选）
     */
    private String serverHardFrame;

    /**
     * 运行环境 - 服务器端 - 硬件 - 内存要求
     */
    private String serverInStorage;

    /**
     * 运行环境 - 服务器端 - 硬件 - 硬盘要求
     */
    private String serverExStorage;

    /**
     * 运行环境 - 服务器端 - 硬件 - 其它要求
     */
    private String serverHardOther;

    /**
     * 运行环境 - 服务器端 - 软件 - 操作系统
     */
    private String serverSystem;

    /**
     * 运行环境 - 服务器端 - 软件 - 版本
     */
    private String serverSoftVersion;

    /**
     * 运行环境 - 服务器端 - 软件 - 编程语言
     */
    private String serverLanguage;

    /**
     * 运行环境 - 服务器端 - 软件 - 构架（多选）
     */
    private String serverSoftFrame;

    /**
     * 运行环境 - 服务器端 - 软件 - 数据库
     */
    private String serverDataBase;

    /**
     * 运行环境 - 服务器端 - 软件 - 中间件
     */
    private String serverSoftMidW;

    /**
     * 运行环境 - 服务器端 - 软件 - 其它支撑软件
     */
    private String serverSupport;

    /**
     * 运行环境 - 网络环境
     */
    private String webEnvironment;

    /**
     * 样品和数量 - 软件介质
     */
    private String sampleType;

    /**
     * 样品和数量 - 文档资料
     */
    private String sampleFile;

    /**
     * 提交的样品五年保存期满：由本实验室销毁还是退还（单选）
     */
    private String sampleChoice;

    /**
     * 希望测试完成时间
     */
    private String expectedDeadline;

    /**
     * 委托单位信息 - 电话
     */
    private String infoTEL;

    /**
     * 委托单位信息 - 传真
     */
    private String infoFAX;

    /**
     * 委托单位信息 - 地址
     */
    private String infoAddr;

    /**
     * 委托单位信息 - 邮编
     */
    private String infoPostcode;

    /**
     * 委托单位信息 - 联系人
     */
    private String infoName;

    /**
     * 委托单位信息 - 手机
     */
    private String infoPhone;

    /**
     * 委托单位信息 - E-mail
     */
    private String infoEmail;

    /**
     * 委托单位信息 - 网址
     */
    private String infoURL;

    /**
     * 密级（单选）
     */
    private String encryptionLev;

    /**
     * 查杀病毒（单选）
     */
    private String antiVirus;

    /**
     * 材料检查（多选）
     */
    private String checkSample;

    public String getTestType() {
        return testType;
    }

    public void setTestType(String testType) {
        this.testType = testType;
    }

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

    public String getCompanyEn() {
        return companyEn;
    }

    public void setCompanyEn(String companyEn) {
        this.companyEn = companyEn;
    }

    public String getCompanyCh() {
        return companyCh;
    }

    public void setCompanyCh(String companyCh) {
        this.companyCh = companyCh;
    }

    public String getDeveloper() {
        return developer;
    }

    public void setDeveloper(String developer) {
        this.developer = developer;
    }

    public String getUnitProperty() {
        return unitProperty;
    }

    public void setUnitProperty(String unitProperty) {
        this.unitProperty = unitProperty;
    }

    public String getUserDescription() {
        return userDescription;
    }

    public void setUserDescription(String userDescription) {
        this.userDescription = userDescription;
    }

    public String getFuncDescription() {
        return funcDescription;
    }

    public void setFuncDescription(String funcDescription) {
        this.funcDescription = funcDescription;
    }

    public String getTestBasis() {
        return testBasis;
    }

    public void setTestBasis(String testBasis) {
        this.testBasis = testBasis;
    }

    public String getTestSpecification() {
        return testSpecification;
    }

    public void setTestSpecification(String testSpecification) {
        this.testSpecification = testSpecification;
    }

    public String getFuncNum() {
        return funcNum;
    }

    public void setFuncNum(String funcNum) {
        this.funcNum = funcNum;
    }

    public String getFpNum() { return fpNum; }

    public void setFpNum(String fpNum) { this.fpNum = fpNum; }

    public String getCodeLine() {
        return codeLine;
    }

    public void setCodeLine(String codeLine) {
        this.codeLine = codeLine;
    }

    public String getSoftwareType() {
        return softwareType;
    }

    public void setSoftwareType(String softwareType) {
        this.softwareType = softwareType;
    }

    public String getClientSystem() {
        return clientSystem;
    }

    public void setClientSystem(String clientSystem) {
        this.clientSystem = clientSystem;
    }

    public String getClientInStorage() {
        return clientInStorage;
    }

    public void setClientInStorage(String clientInStorage) {
        this.clientInStorage = clientInStorage;
    }

    public String getClientExStorage() {
        return clientExStorage;
    }

    public void setClientExStorage(String clientExStorage) {
        this.clientExStorage = clientExStorage;
    }

    public String getClientOther() {
        return clientOther;
    }

    public void setClientOther(String clientOther) {
        this.clientOther = clientOther;
    }

    public String getServerHardFrame() {
        return serverHardFrame;
    }

    public void setServerHardFrame(String serverHardFrame) {
        this.serverHardFrame = serverHardFrame;
    }

    public String getServerInStorage() {
        return serverInStorage;
    }

    public void setServerInStorage(String serverInStorage) {
        this.serverInStorage = serverInStorage;
    }

    public String getServerExStorage() {
        return serverExStorage;
    }

    public void setServerExStorage(String serverExStorage) {
        this.serverExStorage = serverExStorage;
    }

    public String getServerHardOther() {
        return serverHardOther;
    }

    public void setServerHardOther(String serverHardOther) {
        this.serverHardOther = serverHardOther;
    }

    public String getServerSystem() {
        return serverSystem;
    }

    public void setServerSystem(String serverSystem) {
        this.serverSystem = serverSystem;
    }

    public String getServerSoftVersion() {
        return serverSoftVersion;
    }

    public void setServerSoftVersion(String serverSoftVersion) {
        this.serverSoftVersion = serverSoftVersion;
    }

    public String getServerLanguage() {
        return serverLanguage;
    }

    public void setServerLanguage(String serverLanguage) {
        this.serverLanguage = serverLanguage;
    }

    public String getServerSoftFrame() {
        return serverSoftFrame;
    }

    public void setServerSoftFrame(String serverSoftFrame) {
        this.serverSoftFrame = serverSoftFrame;
    }

    public String getServerDataBase() {
        return serverDataBase;
    }

    public void setServerDataBase(String serverDataBase) {
        this.serverDataBase = serverDataBase;
    }

    public String getServerSoftMidW() {
        return serverSoftMidW;
    }

    public void setServerSoftMidW(String serverSoftMidW) {
        this.serverSoftMidW = serverSoftMidW;
    }

    public String getServerSupport() {
        return serverSupport;
    }

    public void setServerSupport(String serverSupport) {
        this.serverSupport = serverSupport;
    }

    public String getWebEnvironment() {
        return webEnvironment;
    }

    public void setWebEnvironment(String webEnvironment) {
        this.webEnvironment = webEnvironment;
    }

    public String getSampleType() {
        return sampleType;
    }

    public void setSampleType(String sampleType) {
        this.sampleType = sampleType;
    }

    public String getSampleFile() {
        return sampleFile;
    }

    public void setSampleFile(String sampleFile) {
        this.sampleFile = sampleFile;
    }

    public String getSampleChoice() {
        return sampleChoice;
    }

    public void setSampleChoice(String sampleChoice) {
        this.sampleChoice = sampleChoice;
    }

    public String getExpectedDeadline() {
        return expectedDeadline;
    }

    public void setExpectedDeadline(String expectedDeadline) {
        this.expectedDeadline = expectedDeadline;
    }

    public String getInfoTEL() {
        return infoTEL;
    }

    public void setInfoTEL(String infoTEL) {
        this.infoTEL = infoTEL;
    }

    public String getInfoFAX() {
        return infoFAX;
    }

    public void setInfoFAX(String infoFAX) {
        this.infoFAX = infoFAX;
    }

    public String getInfoAddr() {
        return infoAddr;
    }

    public void setInfoAddr(String infoAddr) {
        this.infoAddr = infoAddr;
    }

    public String getInfoPostcode() {
        return infoPostcode;
    }

    public void setInfoPostcode(String infoPostcode) {
        this.infoPostcode = infoPostcode;
    }

    public String getInfoName() {
        return infoName;
    }

    public void setInfoName(String infoName) {
        this.infoName = infoName;
    }

    public String getInfoPhone() {
        return infoPhone;
    }

    public void setInfoPhone(String infoPhone) {
        this.infoPhone = infoPhone;
    }

    public String getInfoEmail() {
        return infoEmail;
    }

    public void setInfoEmail(String infoEmail) {
        this.infoEmail = infoEmail;
    }

    public String getInfoURL() {
        return infoURL;
    }

    public void setInfoURL(String infoURL) {
        this.infoURL = infoURL;
    }

    public String getEncryptionLev() {
        return encryptionLev;
    }

    public void setEncryptionLev(String encryptionLev) {
        this.encryptionLev = encryptionLev;
    }

    public String getAntiVirus() {
        return antiVirus;
    }

    public void setAntiVirus(String antiVirus) {
        this.antiVirus = antiVirus;
    }

    public String getCheckSample() {
        return checkSample;
    }

    public void setCheckSample(String checkSample) {
        this.checkSample = checkSample;
    }

}
