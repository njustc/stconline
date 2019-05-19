package com.example.stc.domain;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

/**
 * 用于拥有名称的实体类的父类
 */
@MappedSuperclass
public class NamedEntity extends BaseEntity {
    /**
     * 编码
     */
    @Column(name = "CODE")
    private String code;

    /**
     * 名称
     */
    @Column(name = "NAME")
    private String name;

}
