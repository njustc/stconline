package com.example.stc.domain;


import com.alibaba.fastjson.annotation.JSONField;

import javax.persistence.*;
import java.util.List;

/**
 * 用户账号类
 */
@Entity
@Table(name = "TBL_SYS_USER")
public class User extends NamedEntity {
    /**
     * 用户名
     */
    @Column(name = "USERNAME")
    private String username;

    /**
     * 密码
     */
    @Column(name = "PASSWORD")
    private String password;


    /**
     * 联接表：用户与角色，多对多
     */
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "TBL_SYS_ROLE_USERS", joinColumns =
            {
                    @JoinColumn(name = "USER_ID", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
            }, inverseJoinColumns =
            {
                    @JoinColumn(name = "ROLE_ID", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
            })

    /**
     * 用户所对应的角色组
     */
    private List<Role> roles;


    /**
     * 用户的委托列表
     */
    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "USER_ID",foreignKey = @ForeignKey(value = ConstraintMode.CONSTRAINT))
    @JSONField(serialize = false)
    private List<Entrust> entrusts;

    /**
     * 用户的项目列表
     */
    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "USER_ID",foreignKey = @ForeignKey(name = "none",value = ConstraintMode.NO_CONSTRAINT))
    @JSONField(serialize = false)
    private List<Project> projects;

    public List<Project> getProjects(){
        return projects;
    }

    /**
     * 用户权限组
     */
    @Transient
    private List<Function> functions;
}
