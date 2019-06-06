package com.example.stc.domain;

import javax.persistence.*;

@Entity
@Table(name = "TBL_SYS_ENTRUST")
public class Entrust extends ProcessEntity {

    /**
     * 项目Id
     */
    private String pid;

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    /**
     * 存储测试文档整体
     */
    private String entrustEntity;

    public String getEntrustEntity() {
        return entrustEntity;
    }

    public void setEntrustEntity(String entrustEntity) {
        this.entrustEntity = entrustEntity;
    }

    /**
     * 测试类型（多选）
     */
    private String testType;

    public String getTestType() {
        return testType;
    }

    public void setTestType(String testType) {
        this.testType = testType;
    }

    /**
     * 软件名称
     */
    private String softwareName;

    public String getSoftwareName() {
        return softwareName;
    }

    public void setSoftwareName(String softwareName) {
        this.softwareName = softwareName;
    }

    /**
     * 版本号
     */
    private String version;

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    /**
     * 委托单位(英文)
     */
    private String companyEn;

    public String getCompanyEn() {
        return companyEn;
    }

    public void setCompanyEn(String companyEn) {
        this.companyEn = companyEn;
    }

    /**
     * 委托单位(中文)
     */
    private String companyCh;

    public String getCompanyCh() {
        return companyCh;
    }

    public void setCompanyCh(String companyCh) {
        this.companyCh = companyCh;
    }

    /**
     * 开发单位
     */
    private String developer;

    public String getDeveloper() {
        return developer;
    }

    public void setDeveloper(String developer) {
        this.developer = developer;
    }

    /**
     * 单位性质（单选）
     */
    private String unitProperty;

    public String getUnitProperty() {
        return unitProperty;
    }

    public void setUnitProperty(String unitProperty) {
        this.unitProperty = unitProperty;
    }

    /**
     * 软件用户对象
     */
    private String userDescription;

    public String getUserDescription() {
        return userDescription;
    }

    public void setUserDescription(String userDescription) {
        this.userDescription = userDescription;
    }

    /**
     * 主要功能及用途简介
     */
    private String funcDescription;

    public String getFuncDescription() {
        return funcDescription;
    }

    public void setFuncDescription(String funcDescription) {
        this.funcDescription = funcDescription;
    }

    /**
     * 测试依据（多选）
     */
    private String testBasis;

    public String getTestBasis() {
        return testBasis;
    }

    public void setTestBasis(String testBasis) {
        this.testBasis = testBasis;
    }

    /**
     * 需要测试的技术指标（多选）
     */
    private String testSpecification;

    public String getTestSpecification() {
        return testSpecification;
    }

    public void setTestSpecification(String testSpecification) {
        this.testSpecification = testSpecification;
    }

    /**
     * 软件规模 - 功能数
     */
    private String funcNum;

    public String getFuncNum() {
        return funcNum;
    }

    public void setFuncNum(String funcNum) {
        this.funcNum = funcNum;
    }

    /**
     * 软件规模 - 功能点数
     */
    private String fpNum;

    public String getFpNum() {
        return fpNum;
    }

    public void setFpNum(String fpNum) {
        this.fpNum = fpNum;
    }

    /**
     * 软件规模 - 代码行数
     */
    private String codeLine;

    public String getCodeLine() {
        return codeLine;
    }

    public void setCodeLine(String codeLine) {
        this.codeLine = codeLine;
    }

    /**
     * 软件类型（单选）
     */
    private String softwareType;

    public String getSoftwareType() {
        return softwareType;
    }

    public void setSoftwareType(String softwareType) {
        this.softwareType = softwareType;
    }

    /**
     * 运行环境 - 客户端 - 操作系统（多选）
     */
    private String clientSystem;

    public String getClientSystem() {
        return clientSystem;
    }

    public void setClientSystem(String clientSystem) {
        this.clientSystem = clientSystem;
    }

    /**
     * 运行环境 - 客户端 - 内存要求
     */
    private String clientInStorage;

    public String getClientInStorage() {
        return clientInStorage;
    }

    public void setClientInStorage(String clientInStorage) {
        this.clientInStorage = clientInStorage;
    }

    /**
     * 运行环境 - 客户端 - 硬盘要求
     */
    private String clientExStorage;

    public String getClientExStorage() {
        return clientExStorage;
    }

    public void setClientExStorage(String clientExStorage) {
        this.clientExStorage = clientExStorage;
    }

    /**
     * 运行环境 - 客户端 - 其它要求
     */
    private String clientOther;

    public String getClientOther() {
        return clientOther;
    }

    public void setClientOther(String clientOther) {
        this.clientOther = clientOther;
    }

    /**
     * 运行环境 - 服务器端 - 硬件 - 架构（多选）
     */
    private String serverHardFrame;

    public String getServerHardFrame() {
        return serverHardFrame;
    }

    public void setServerHardFrame(String serverHardFrame) {
        this.serverHardFrame = serverHardFrame;
    }

    /**
     * 运行环境 - 服务器端 - 硬件 - 内存要求
     */
    private String serverInStorage;

    public String getServerInStorage() {
        return serverInStorage;
    }

    public void setServerInStorage(String serverInStorage) {
        this.serverInStorage = serverInStorage;
    }

    /**
     * 运行环境 - 服务器端 - 硬件 - 硬盘要求
     */
    private String serverExStorage;

    public String getServerExStorage() {
        return serverExStorage;
    }

    public void setServerExStorage(String serverExStorage) {
        this.serverExStorage = serverExStorage;
    }

    /**
     * 运行环境 - 服务器端 - 硬件 - 其它要求
     */
    private String serverHardOther;

    public String getServerHardOther() {
        return serverHardOther;
    }

    public void setServerHardOther(String serverHardOther) {
        this.serverHardOther = serverHardOther;
    }

    /**
     * 运行环境 - 服务器端 - 软件 - 操作系统
     */
    private String serverSystem;

    public String getServerSystem() {
        return serverSystem;
    }

    public void setServerSystem(String serverSystem) {
        this.serverSystem = serverSystem;
    }

    /**
     * 运行环境 - 服务器端 - 软件 - 版本
     */
    private String serverSoftVersion;

    public String getServerSoftVersion() {
        return serverSoftVersion;
    }

    public void setServerSoftVersion(String serverSoftVersion) {
        this.serverSoftVersion = serverSoftVersion;
    }

    /**
     * 运行环境 - 服务器端 - 软件 - 编程语言
     */
    private String serverLanguage;

    public String getServerLanguage() {
        return serverLanguage;
    }

    public void setServerLanguage(String serverLanguage) {
        this.serverLanguage = serverLanguage;
    }

    /**
     * 运行环境 - 服务器端 - 软件 - 构架（多选）
     */
    private String serverSoftFrame;

    public String getServerSoftFrame() {
        return serverSoftFrame;
    }

    public void setServerSoftFrame(String serverSoftFrame) {
        this.serverSoftFrame = serverSoftFrame;
    }

    /**
     * 运行环境 - 服务器端 - 软件 - 数据库
     */
    private String serverDataBase;

    public String getServerDataBase() {
        return serverDataBase;
    }

    public void setServerDataBase(String serverDataBase) {
        this.serverDataBase = serverDataBase;
    }

    /**
     * 运行环境 - 服务器端 - 软件 - 中间件
     */
    private String serverSoftMidW;

    public String getServerSoftMidW() {
        return serverSoftMidW;
    }

    public void setServerSoftMidW(String serverSoftMidW) {
        this.serverSoftMidW = serverSoftMidW;
    }

    /**
     * 运行环境 - 服务器端 - 软件 - 其它支撑软件
     */
    private String serverSupport;

    public String getServerSupport() {
        return serverSupport;
    }

    public void setServerSupport(String serverSupport) {
        this.serverSupport = serverSupport;
    }

    /**
     * 运行环境 - 网络环境
     */
    private String webEnvironment;

    public String getWebEnvironment() {
        return webEnvironment;
    }

    public void setWebEnvironment(String webEnvironment) {
        this.webEnvironment = webEnvironment;
    }

    /**
     * 样品和数量 - 软件介质
     */
    private String sampleType;

    public String getSampleType() {
        return sampleType;
    }

    public void setSampleType(String sampleType) {
        this.sampleType = sampleType;
    }

    /**
     * 样品和数量 - 文档资料
     */
    private String sampleFile;

    public String getSampleFile() {
        return sampleFile;
    }

    public void setSampleFile(String sampleFile) {
        this.sampleFile = sampleFile;
    }

    /**
     * 提交的样品五年保存期满：由本实验室销毁还是退还（单选）
     */
    private String sampleChoice;

    public String getSampleChoice() {
        return sampleChoice;
    }

    public void setSampleChoice(String sampleChoice) {
        this.sampleChoice = sampleChoice;
    }

    /**
     * 希望测试完成时间
     */
    private String expectedDeadline;

    public String getExpectedDeadline() {
        return expectedDeadline;
    }

    public void setExpectedDeadline(String expectedDeadline) {
        this.expectedDeadline = expectedDeadline;
    }

    /**
     * 委托单位信息 - 电话
     */
    private String infoTEL;

    public String getInfoTEL() {
        return infoTEL;
    }

    public void setInfoTEL(String infoTEL) {
        this.infoTEL = infoTEL;
    }

    /**
     * 委托单位信息 - 传真
     */
    private String infoFAX;

    public String getInfoFAX() {
        return infoFAX;
    }

    public void setInfoFAX(String infoFAX) {
        this.infoFAX = infoFAX;
    }

    /**
     * 委托单位信息 - 地址
     */
    private String infoAddr;

    public String getInfoAddr() {
        return infoAddr;
    }

    public void setInfoAddr(String infoAddr) {
        this.infoAddr = infoAddr;
    }

    /**
     * 委托单位信息 - 邮编
     */
    private String infoPostcode;

    public String getInfoPostcode() {
        return infoPostcode;
    }

    public void setInfoPostcode(String infoPostcode) {
        this.infoPostcode = infoPostcode;
    }

    /**
     * 委托单位信息 - 联系人
     */
    private String infoName;

    public String getInfoName() {
        return infoName;
    }

    public void setInfoName(String infoName) {
        this.infoName = infoName;
    }

    /**
     * 委托单位信息 - 手机
     */
    private String infoPhone;

    public String getInfoPhone() {
        return infoPhone;
    }

    public void setInfoPhone(String infoPhone) {
        this.infoPhone = infoPhone;
    }

    /**
     * 委托单位信息 - E-mail
     */
    private String infoEmail;

    public String getInfoEmail() {
        return infoEmail;
    }

    public void setInfoEmail(String infoEmail) {
        this.infoEmail = infoEmail;
    }

    /**
     * 委托单位信息 - 网址
     */
    private String infoURL;

    public String getInfoURL() {
        return infoURL;
    }

    public void setInfoURL(String infoURL) {
        this.infoURL = infoURL;
    }

    /**
     * 密级（单选）
     */
    private String encryptionLev;

    public String getEncryptionLev() {
        return encryptionLev;
    }

    public void setEncryptionLev(String encryptionLev) {
        this.encryptionLev = encryptionLev;
    }

    /**
     * 查杀病毒（单选）
     */
    private String antiVirus;

    public String getAntiVirus() {
        return antiVirus;
    }

    public void setAntiVirus(String antiVirus) {
        this.antiVirus = antiVirus;
    }

    /**
     * 材料检查（多选）
     */
    private String checkSample;

    public String getCheckSample() {
        return checkSample;
    }

    public void setCheckSample(String checkSample) {
        this.checkSample = checkSample;
    }

    /**
     * 确认意见（单选）
     */
    private String opinions;

    public String getOpinions() {
        return opinions;
    }

    public void setOpinions(String opinions) {
        this.opinions = opinions;
    }

    /**
     * 受理意见（单选）
     */
    private String acceptOpinions;

    public String getAcceptOpinions() {
        return acceptOpinions;
    }

    public void setAcceptOpinions(String acceptOpinions) {
        this.acceptOpinions = acceptOpinions;
    }

    /**
     * 用户信息
     */
    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.REFRESH)
    @JoinColumn(name = "USER_ID", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    //@JSONField(serialize = false)
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
    /**
     * 委托所在的项目
     */
    //private Project project;
}
