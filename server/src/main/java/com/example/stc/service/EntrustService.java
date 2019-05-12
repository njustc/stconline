package com.example.stc.service;

import com.example.stc.domain.Entrust;

import java.util.List;

/**
 * 委托管理业务逻辑
 *
 * @author lfm
 */
public interface EntrustService {
    /**
     * 获取全部的委托
     * 需要进行分页
     */
    List<Entrust> findAllEntrusts();

    /**
     * 通过ID查询单个委托记录
     */
    Entrust findEntrustById(String pid);

    /**
     * 通过ID删除单个委托记录
     */
    void deleteEntrustById(String pid);

    /**
     * 插入单个委托记录
     *
     * @return
     * */
    Entrust insertEntrust(Entrust entrust);

    /**
     * 修改单个委托记录
     * 若委托记录不存在，将报异常
     * */
    Entrust updateEntrust(String pid, Entrust record);
}
