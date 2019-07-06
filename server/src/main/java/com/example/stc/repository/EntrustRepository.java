package com.example.stc.repository;

import com.example.stc.domain.Entrust;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 委托实体类
 *
 * @author :lfm
 */

@Repository
public interface EntrustRepository extends ProcessEntityRepository<Entrust> {
}
