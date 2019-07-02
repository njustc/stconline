package com.example.stc.domain;

/**
 * 定义用户角色：客户、市场部普通人员、市场部主任、测试部普通人员、测试部主任、质量部主任和超级管理员<br>
 * 所有角色都包含"USER";
 * 所有顾客都为"USER,CUS";
 * 所有工作人员都包含"STAFF";
 * 超级管理员为"ADMIN"
 */
public enum Role {

    USER("USER"),
    Customer("CUS"),
    STAFF("STAFF"),
    SalesStaff("SS"), SalesManager("SM"),
    TestStaff("TS"), TestManager("TM"),
    QualityManager("QM"),
    Admin("ADMIN");

    private String name;
    private Role(String name) {
        this.name = name;
    }

    public String str() {
        return name;
    }

}
