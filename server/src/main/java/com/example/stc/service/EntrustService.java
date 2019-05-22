package com.example.stc.service;

import com.example.stc.domain.Entrust;

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
    List<Entrust> findAllEntrusts();

    /**
     * 通过主键ID查询单个委托记录
     */
    Entrust findEntrustById(String id);

    /**
     * 通过委托ID查询单个委托记录
     */
    Entrust findEntrustByPid(String pid);

    /**
     * 通过主键ID删除单个委托记录
     */
    void deleteEntrustById(String id);

    /**
     * 通过委托ID删除单个委托记录
     */
    void deleteEntrustByPid(String pid);

    /**
     * 插入单个委托记录
     *
     * @return
     * */
    Entrust newEntrust(Entrust entrust);

    /**
     * 通过委托ID修改单个委托记录
     * 若委托记录不存在，将报异常
     * */
    Entrust updateEntrust(String pid, Entrust record);
}
