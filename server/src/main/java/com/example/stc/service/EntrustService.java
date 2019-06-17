package com.example.stc.service;

import com.example.stc.domain.Entrust;
import org.springframework.security.access.annotation.Secured;

import java.util.List;

/**
 * 委托管理业务逻辑
 *
 * @author lfm
 */
public interface EntrustService extends BaseService<Entrust> {
    /**
     * 获取全部的委托
     * 需要进行分页
     */
//    @Secured("ROLE_USER")
    List<Entrust> findAllEntrusts();

    /**
     * 依据用户权限获取委托
     */
    @Secured("ROLE_USER")
    List<Entrust> findEntrustsByAuthority();

    /**
     * 获取某用户全部委托
     */
    @Secured({"ROLE_USER", "ROLE_STAFF"})
    List<Entrust> findEntrustsByUser(String uid);

    /**
     * 通过主键ID查询单个委托记录
     */
    @Secured("ROLE_USER")
    Entrust findEntrustById(Long id);

    /**
     * 通过委托ID查询单个委托记录
     */
    @Secured("ROLE_USER")
    Entrust findEntrustByPid(String pid);

    /**
     * 通过主键ID删除单个委托记录
     * 如果不存在,就报错
     */
    @Secured({"ROLE_USER", "ROLE_CUS"})
    void deleteEntrustById(Long id);

    /**
     * 通过委托ID删除单个委托记录
     */
    @Secured({"ROLE_USER", "ROLE_CUS"})
    void deleteEntrustByPid(String pid);

    /**
     * 插入单个委托记录
     *
     * @return
     * */
    @Secured({"ROLE_USER", "ROLE_CUS"})
    Entrust newEntrust(Entrust entrust);

    /**
     * 通过委托ID修改单个委托记录
     * 若委托记录不存在，将报异常
     * */
    @Secured({"ROLE_USER", "ROLE_CUS"})
    Entrust updateEntrust(String pid, Entrust record);
}
