package com.example.stc.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "TBL_SYS_ENTRUST")
public class Entrust extends BaseEntity {

    /**
     * 项目Id
     */
    private String pid;

    /**
     * 存储测试文档整体
     */
    private String entrustEntity;

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

    /**
     * 确认意见（单选）
     */
    private String opinions;

    /**
     * 受理意见（单选）
     */
    private String acceptOpinions;

    /**
     * 用户信息
     */
    //private User user;

    /**
     * 委托所在的项目
     */
    //private Project project;

	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
}
