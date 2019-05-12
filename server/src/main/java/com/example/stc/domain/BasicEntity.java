package com.example.stc.domain;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

/**
 * 实体类基类, 持有基本的实体类属性
 *
 * @author : lfm
 */
@MappedSuperclass
public class BasicEntity {
    //数据库id
    private String id;


    @Id
    @Column(name = "id", length = 32, nullable = false)
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }


}
