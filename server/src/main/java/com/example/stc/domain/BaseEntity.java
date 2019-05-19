package com.example.stc.domain;

import javax.persistence.*;

@MappedSuperclass
public class BaseEntity {
    /**
     * 自动生成的Id
     */
    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "ID")
    private String id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
