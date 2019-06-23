package com.example.stc.domain;

import javax.persistence.*;

/**
 * 合同
 */
@Entity
@Table(name = "TBL_SYS_CONTRACT")
public class Contract extends ProcessEntity {

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
     *签订日期
     */
    @Column(name = "SIGNDATA")
    private String signData;

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
    @Column (name = "CLIENTSIGNDATA")
    private String clientSignData;

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
    @Column (name = "ASSIGNEESIGNDATA")
    private String assigneeSignData;

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
    private String assigneeDataBank;

    /**
     * 受托方--户名
     */
    @Column (name = "ASSIGNEEBANKNAME")
    private String assigneeDataBankName;

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

    /**
     * 用户信息
     */
    @ManyToOne(cascade = CascadeType.REFRESH)
    @JoinColumn(name = "USER_ID", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    //@JSONField(serialize = false)
    private User user;

}
