package com.example.stc.domain;


import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Column;

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
}
