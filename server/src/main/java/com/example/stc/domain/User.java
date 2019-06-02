package com.example.stc.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Column;

import com.alibaba.fastjson.annotation.JSONField;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

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
    private String roles;

    /** 用户的委托列表 */
    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
 //   @JoinColumn(name = "USER_ID",foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT))
    @JSONField(serialize = false)
    private List<Entrust> entrusts;

    /** 用户的项目列表 */
    @OneToMany(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
 //   @JoinColumn(name = "USER_ID",foreignKey = @ForeignKey(name = "none",value = ConstraintMode.NO_CONSTRAINT))
    @JSONField(serialize = false)
    private List<Project> projects;

    public List<Entrust> getEntrusts() { return entrusts; }

    public void setEntrusts(List<Entrust> entrusts) { this.entrusts = entrusts; }

    public List<Project> getProjects(){
        return projects;
    }

    public void setProjects(List<Project> projects){
        this.projects = projects;
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
