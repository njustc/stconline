package com.example.stc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TBL_SYS_ENTRUST")
public class Entrust {

    /**
     * 项目Id
     * 2019512
     */
    @Id
    @Column(name = "pid")
    private String pid;

    /**
     * 存储测试文档整体
     */
    @Column(name = "consignation")
    private String consignation;

    /**
     * 测试类型
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
    private String company_En;

    /**
     * 委托单位(中文)
     */
    private String company_Ch;

    /**
     * 开发单位
     */
    private String developer;

    /**
     * 单位性质
     */
    private String unitProperty;

    /**
     * 软件用户对象
     */
    private String user_Description;

    /**
     * 主要功能及用途简介
     */
    private String func_Description;

    /**
     * 测试依据 多选
     */
    private String test_Basis;

    /**
     * 需要测试的技术指标 多选
     */
    private String test_Specification;

    /**
     * 软件规模-功能数
     */
    private String func_num;

    /**
     * 软件规模 - 功能点数
     */
    private String fp_num;

    /**
     * 软件规模 - 代码行数
     */
    private String codeLine;

    /**
     * 软件类型 - 系统软件
     */
    private String softSys;

    /**
     * 软件类型 - 支持软件
     */
    private String softSupport;

    /**
     * 软件类型 - 应用软件
     */
    private String softApp;

    /**
     * 软件类型 - 其他
     */
    private String softOther;

    /**
     * 运行环境 - 客户端 - 操作系统
     */
    private String client_Sys;

    /**
     * 运行环境 - 客户端 - 内存要求
     */
    private String client_inStorage;

    /**
     * 运行环境 - 客户端 - 硬盘要求
     */
    private String client_exStorage;

    /**
     * 运行环境 - 客户端 - 其它要求
     */
    private String client_other;

    /**
     * 运行环境 - 服务器端 - 硬件 - 架构
     */
    private String server_Frame;

    /**
     * 运行环境 - 服务器端 - 硬件 - 内存要求
     */
    private String server_inStorage;

    /**
     * 运行环境 - 服务器端 - 硬件 - 硬盘要求
     */
    private String server_exStorage;

    /**
     * 运行环境 - 服务器端 - 硬件 - 其它要求
     */
    private String server_other;

    /**
     * 运行环境 - 服务器端 - 软件 - 操作系统
     */
    private String server_Sys;

    /**
     * 运行环境 - 服务器端 - 软件 - 编程语言
     */
    private String server_lan;

    /**
     * 运行环境 - 服务器端 - 软件 - 数据库
     */
    private String server_Data;

    /**
     * 运行环境 - 服务器端 - 软件 - 其它支撑软件
     */
    private String server_support;

    /**
     * 运行环境 - 服务器端 - 软件 - 版本
     */
    private String server_soft_version;

    /**
     * 运行环境 - 服务器端 - 软件 - 构架
     */
    private String server_soft_Frame;

    /**
     * 运行环境 - 服务器端 - 软件 - 中间件
     */
    private String server_soft_MidW;

    /**
     * 运行环境 - 网络环境
     */
    private String webEnv;

    /**
     * 样品和数量 - 软件介质
     */
    private String sampleType;

    /**
     * 样品和数量 - 文档资料
     */
    private String sampleFile;

    /**
     * 提交的样品（硬拷贝资料、硬件）五年保存期满：由本实验室销毁还是退还
     */
    private String sampleChoice;

    /**
     * 希望测试完成时间
     */
    private String sampleTime;

    /**
     * 委托单位信息 - 电话
     */
    private String consignTEL;

    /**
     * 委托单位信息 - 传真
     */
    private String consignFAX;

    /**
     * 委托单位信息 - 地址
     */
    private String consignAddr;

    /**
     * 委托单位信息 - 邮编
     */
    private String consignCODE;

    /**
     * 委托单位信息 - 联系人
     */
    private String consignName;

    /**
     * 委托单位信息 - 手机
     */
    private String consignPhone;

    /**
     * 委托单位信息 - E-mail
     */
    private String consignEmail;

    /**
     * 委托单位信息 - 网址
     */
    private String consignWEB;

    /**
     * 密级
     */
    private String otherEncrypt;

    /**
     * 查杀病毒
     */
    private String otherVirus;

    /**
     * 材料检查 - 测试样品
     */
    private String otherSample;

    /**
     * 材料检查 - 需求文档
     */
    private String othererREDOC;

    /**
     * 材料检查 - 用户文档
     */
    private String otherUSERDOC;

    /**
     * 材料检查 - 操作文档
     */
    private String otherOPDOC;

    /**
     * 材料检查 - 其它
     */
    private String otherOther;

    /**
     * 确认意见
     */
    private String otherCheck;

    /**
     * 受理意见
     */
    private String otherDeal;

    /**
     * 测试项目编号
     */
    private String otherProjectId;

    /**
     * 用户信息
     */
    //private User user;

    /**
     * 委托所在的项目
     */
    //private Project project;

}
