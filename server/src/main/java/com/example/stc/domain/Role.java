package com.example.stc.domain;
import com.alibaba.fastjson.annotation.JSONField;

import javax.persistence.*;
import java.util.List;


/**
 * 每个用户User对应一个角色Role，一个Role包含若干个Funtion
 */
@Entity
@Table(name = "TBL_SYS_ROLES")
public class Role extends BaseEntity{
    /**
     * 角色名称
     */
    @Column(name = "ROLE_NAME")
    private String roleName;


    @ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinTable(name = "TBL_SYS_ROLE_FUNCTIONS", joinColumns = {
            @JoinColumn(name = "ROLE_ID", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    }, inverseJoinColumns = {
            @JoinColumn(name = "FUNCTION_ID", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
    })

    /**
     * 角色所对应的权限
     */
    @JSONField(deserialize = false)
    private List<Function> functions;

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public List<Function> getFunctions() {
        return functions;
    }

    @JSONField(deserialize = false)
    public void setFunctions(List<Function> functions) {
        this.functions = functions;
    }
}
