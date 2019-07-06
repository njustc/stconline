package com.example.stc.repository;

import com.example.stc.domain.ProcessEntity;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 专门用于processEntity 相关的repo 处理
 *
 * @author lfm
 */
@Component(value = "processEntityRepository")
@NoRepositoryBean
public interface ProcessEntityRepository<T extends ProcessEntity> extends BaseRepository<T> {
    /**
     * 根据project id 获取单个实体
     *
     * @param pid :project id
     */
    T findByPid(String pid);

    /**
     * 根据project id 获取关联实体列表
     */
    List<T> findAllByPid(String pid);

    /**
     * 根据project id 删除实体
     *
     * @param pid : project id
     * @return : 删除实体个数
     */
    @Modifying(flushAutomatically = true)
    @Transactional
    int deleteByPid(String pid);
}
