package com.example.stc.repository;

import com.example.stc.domain.Entrust;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * 委托实体类
 *
 * @author :lfm
 */

@Repository
public interface EntrustRepository extends BaseRepository<Entrust> {

    Entrust findByPid(String pid);

    void deleteByPid(String pid);

}
