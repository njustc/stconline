package com.example.stc.domain;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Column;

/**
 * 用户账号类
 */
@Entity
@Table(name = "TBL_SYS_USER")
public class User extends BaseEntity {

    /** 用户ID */
    @Column(name = "USERID")
    private String uid;

    /** 用户名 */
    @Column(name = "USERNAME")
    private String username;

    /** 密码 */
    @Column(name = "PASSWORD")
    private String password;

    /** 用户所对应的角色组(见enum Role)，格式为: 例如"SS,TS"，例如"CUS"，例如"ADMIN" */
    @Column(name = "ROLES")
    private String roles = "";

    /** 添加角色/权限 */
    public void addRole(String role) {
        if (roles.length() > 0)
            roles = new String(roles + "," + role);
        else
            setRoles(role);
    }

    public String getUserID() {
        return uid;
    }

    public void setUserID(String uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = new String(roles);
    }

}
