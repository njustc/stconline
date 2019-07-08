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
    List<Entrust> findAllEntrusts();

    /**
     * 依据用户权限获取委托
     */
    List<Entrust> findEntrustsByAuthority();

    /**
     * 获取待办委托
     */
    List<Entrust> findToDoEntrustsByAuthority();

    /**
     * 获取某用户全部委托
     */
    List<Entrust> findEntrustsByUser(String uid);

    /**
     * 通过委托ID查询单个委托记录
     */
    Entrust findEntrustByPid(String pid);

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

    /**
     * 修改流程状态, 添加评审意见
     * @param pid
     * @param processState
     * @param comment
     * @return
     */
    Entrust updateProcessState(String pid, String processState, String comment);
}
