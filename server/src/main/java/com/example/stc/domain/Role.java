package com.example.stc.domain;

/**
 * 定义用户角色：客户、市场部普通人员、市场部主任、测试部普通人员、测试部主任、质量部主任和超级管理员
 */
public enum Role {

    USER("USER"),
    Customer("CUS"),
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
