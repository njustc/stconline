package com.example.stc.domain;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Column;

/**
 * 合同
 */
@Entity
@Table(name = "TBL_SYS_CONTRACT")
public class Contract extends ProcessEntity {

    /**
     * 项目名称
     */
    @Column(name = "PROJECT_NAME")
    private String projectName;

    /**
     * 软件名称
     */
    @Column(name = "SOFTWARE_NAME")
    private String softwareName;

    /**
     * 整改次数限制
     */
    @Column(name = "MODIFY_NUM")
    private String modifyNum;

    /**
     * 整改时间限制
     */
    @Column(name = "MODIFY_TIME")
    private String modifyTime;

    /**
     * 委托方(甲方)
     */
    @Column(name = "CLIENT")
    private String client;

    /**
     * 委托方 （乙方）
     */
    @Column(name = "ASSIGNEE")
    private String assignee;

    /**
     * 签订地点
     */
    @Column(name = "SIGNPLACE")
    private String signPlace;

    /**
     * 签订日期
     */
    @Column(name = "SIGNDATE")
    private String signDate;

    /**
     * 质量特性
     */
    @Column (name = "QUALITY" )
    private String quality;

    /**
     * 合同价款
     */
    @Column (name = "PRICE")
    private String price;

    /**
     * 履行期限
     */
    @Column (name = "FINISHTIME")
    private String finishTime;

    /**
     * 委托方--单位全称
     */
    @Column (name = "CLIENTCOMPANYNAME")
    private String clientCompanyName;

    /**
     * 委托方--授权代表
     */
    @Column (name = "CLIENTAUTHPEPRE")
    private String clientAuthRepre;

    /**
     * 委托方--签章日期
     */
    @Column (name = "CLIENTSIGNDATE")
    private String clientSignDate;

    /**
     * 委托方--联系人
     */
    @Column (name = "CLIENTCONTACT")
    private String clientContact;

    /**
     * 委托方--通讯地址
     */
    @Column (name = "CLIENTADDR")
    private String clientAddr;

    /**
     * 委托方--电话
     */
    @Column (name = "CLIENTTEL")
    private String clientTel;


    /**
     * 委托方--传真
     */
    @Column (name = "CLIENTFAX")
    private String clientFax;

    /**
     * 委托方--开户银行
     */
    @Column (name = "CLIENTBANK")
    private String clientBank;

    /**
     * 委托方--账号
     */
    @Column (name = "CLIENTUSERNAME")
    private String clientUserName;

    /**
     * 委托方--邮编
     */
    @Column (name = "CLIENTPOSTCODE")
    private String clientPostCode;

    /**
     * 受托方--单位全称
     */
    @Column (name = "ASSIGNEECOMPANYNAME")
    private String assigneeCompanyName;

    /**
     * 受托方--授权代表
     */
    @Column (name = "ASSGINEEAUTHREPRE")
    private String assigneeAuthRepre;

    /**
     * 受托方--签章日期
     */
    @Column (name = "ASSIGNEESIGNDATE")
    private String assigneeSignDate;

    /**
     * 受托方--联系人
     */
    @Column (name = "ASSIGNEECONTACT")
    private String assigneeContact;

    /**
     * 受托方--通讯地址
     */
    @Column (name = "ASSIGNEEADDR")
    private String assigneeAddr;

    /**
     * 受托方--电话
     */
    @Column (name = "ASSIGNEETEL")
    private String assigneeTel;


    /**
     * 受托方--传真
     */
    @Column (name = "ASSIGNEEFAX")
    private String assigneeFax;

    /**
     * 受托方--开户银行
     */
    @Column (name = "ASSIGNEEBANK")
    private String assigneeBank;

    /**
     * 受托方--户名
     */
    @Column (name = "ASSIGNEEBANKNAME")
    private String assigneeBankName;

    /**
     * 受托方--账号
     */
    @Column (name = "ASSIGNEEUSERNAME")
    private String assigneeUserName;

    /**
     * 受托方--邮编
     */
    @Column (name = "ASSIGNEEPOSTCODE")
    private String assigneePostCode;

    /**
     * 用来存储合同文档整体
     */
    @Column(name = "CONTRACTBODY")
    private String contractBody;

    public String getClient() {
        return client;
    }

    public void setClient(String client) {
        this.client = client;
    }

    public String getAssignee() {
        return assignee;
    }

    public void setAssignee(String assignee) {
        this.assignee = assignee;
    }

    public String getSignPlace() {
        return signPlace;
    }

    public void setSignPlace(String signPlace) {
        this.signPlace = signPlace;
    }

    public String getSignDate() {
        return signDate;
    }

    public void setSignDate(String signDate) {
        this.signDate = signDate;
    }

    public String getQuality() {
        return quality;
    }

    public void setQuality(String quality) {
        this.quality = quality;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getFinishTime() {
        return finishTime;
    }

    public void setFinishTime(String finishTime) {
        this.finishTime = finishTime;
    }

    public String getClientCompanyName() {
        return clientCompanyName;
    }

    public void setClientCompanyName(String clientCompanyName) {
        this.clientCompanyName = clientCompanyName;
    }

    public String getClientAuthRepre() {
        return clientAuthRepre;
    }

    public void setClientAuthRepre(String clientAuthRepre) {
        this.clientAuthRepre = clientAuthRepre;
    }

    public String getClientSignDate() {
        return clientSignDate;
    }

    public void setClientSignDate(String clientSignDate) {
        this.clientSignDate = clientSignDate;
    }

    public String getClientContact() {
        return clientContact;
    }

    public void setClientContact(String clientContact) {
        this.clientContact = clientContact;
    }

    public String getClientAddr() {
        return clientAddr;
    }

    public void setClientAddr(String clientAddr) {
        this.clientAddr = clientAddr;
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

    public String getClientBank() {
        return clientBank;
    }

    public void setClientBank(String clientBank) {
        this.clientBank = clientBank;
    }

    public String getClientUserName() {
        return clientUserName;
    }

    public void setClientUserName(String clientUserName) {
        this.clientUserName = clientUserName;
    }

    public String getClientPostCode() {
        return clientPostCode;
    }

    public void setClientPostCode(String clientPostCode) {
        this.clientPostCode = clientPostCode;
    }

    public String getAssigneeCompanyName() {
        return assigneeCompanyName;
    }

    public void setAssigneeCompanyName(String assigneeCompanyName) {
        this.assigneeCompanyName = assigneeCompanyName;
    }

    public String getAssigneeAuthRepre() {
        return assigneeAuthRepre;
    }

    public void setAssigneeAuthRepre(String assigneeAuthRepre) {
        this.assigneeAuthRepre = assigneeAuthRepre;
    }

    public String getAssigneeSignDate() {
        return assigneeSignDate;
    }

    public void setAssigneeSignDate(String assigneeSignDate) {
        this.assigneeSignDate = assigneeSignDate;
    }

    public String getAssigneeContact() {
        return assigneeContact;
    }

    public void setAssigneeContact(String assigneeContact) {
        this.assigneeContact = assigneeContact;
    }

    public String getAssigneeAddr() {
        return assigneeAddr;
    }

    public void setAssigneeAddr(String assigneeAddr) {
        this.assigneeAddr = assigneeAddr;
    }

    public String getAssigneeTel() {
        return assigneeTel;
    }

    public void setAssigneeTel(String assigneeTel) {
        this.assigneeTel = assigneeTel;
    }

    public String getAssigneeFax() {
        return assigneeFax;
    }

    public void setAssigneeFax(String assigneeFax) {
        this.assigneeFax = assigneeFax;
    }

    public String getAssigneeBank() {
        return assigneeBank;
    }

    public void setAssigneeBank(String assigneeBank) {
        this.assigneeBank = assigneeBank;
    }

    public String getAssigneeBankName() {
        return assigneeBankName;
    }

    public void setAssigneeBankName(String assigneeBankName) {
        this.assigneeBankName = assigneeBankName;
    }

    public String getAssigneeUserName() {
        return assigneeUserName;
    }

    public void setAssigneeUserName(String assigneeUserName) {
        this.assigneeUserName = assigneeUserName;
    }

    public String getAssigneePostCode() {
        return assigneePostCode;
    }

    public void setAssigneePostCode(String assigneePostCode) {
        this.assigneePostCode = assigneePostCode;
    }

    public String getContractBody() {
        return contractBody;
    }

    public void setContractBody(String contractBody) {
        this.contractBody = contractBody;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getSoftwareName() {
        return softwareName;
    }

    public void setSoftwareName(String softwareName) {
        this.softwareName = softwareName;
    }

    public String getModifyNum() {
        return modifyNum;
    }

    public void setModifyNum(String modifyNum) {
        this.modifyNum = modifyNum;
    }

    public String getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(String modifyTime) {
        this.modifyTime = modifyTime;
    }
}
