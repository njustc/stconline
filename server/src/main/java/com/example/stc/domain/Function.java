package com.example.stc.domain;


import javax.persistence.*;

/**
 * Funtion指明Role所对应的具体权限
 */

enum FunctionType {
    ADD,VIEW,EDIT,DELETE
}

@Entity
@Table(name = "TBL_SYS_FUNCTIONS")
public class Function extends BaseEntity{
    /**
     * 权限类型
     */
    @Column(name = "FUNCTION_TYPE")
    @Enumerated(EnumType.STRING)
    private FunctionType functionType;

    /**
     * 权限对应文档(委托、合同、测试方案、测试用例)
     */
    @Column(name = "FUNCTION_OBJECT")
    private String object;

    public FunctionType getFunctionType(){
        return functionType;
    }

    public void setFunctionType(FunctionType functionType){
        this.functionType = functionType;
    }

    public String getObject(){
        return object;
    }

    public void setObject(String object){
        this.object = object;
    }
}
