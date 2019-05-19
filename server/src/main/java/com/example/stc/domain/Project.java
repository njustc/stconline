package com.example.stc.domain;

import javax.persistence.*;

/**
 * 该类用来管理测试流程中的项目
 * @author JinYiFan
 */
@Entity
@Table(name = "TBL_SYS_PROJECT")
public class Project extends BaseEntity {

//    private Entrust entrust;

//    /**
//     * 该Project对应的用户
//     */
//    @ManyToOne(fetch = FetchType.LAZY)
//    @JoinColumn(name = "USER_ID", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
//    //@JSONField(serialize = false)
//    private User user;
//
//
//    public User getUser() {
//        return user;
//    }
//
//    public void setUser(User user) {
//        this.user = user;
//    }
//
//    @Column(name = "username")
//    public String getUserNAME(){
//        if(user!=null)
//            return user.getUsername();
//        else
//            return "";
//    }
//
//    @Column(name = "userID")
//    public String getUserId(){
//        if(user!=null)
//            return user.getId();
//        else
//            return "";
//    }

    /**
     * 委托
     */
//    @OneToOne(fetch = FetchType.LAZY)
//    //@JoinColumn(name = "CONSIGN_ID", foreignKey = @ForeignKey(name = "none", value = ConstraintMode.NO_CONSTRAINT))
//    //@JSONField(serialize = false)
//    private Entrust entrust;
//
//    public Entrust getEntrust() {
//        return entrust;
//    }
//
//    public void setEntrust(Entrust entrust) {
//        this.entrust = entrust;
//    }
}
