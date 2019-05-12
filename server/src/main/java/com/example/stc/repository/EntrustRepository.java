package com.example.stc.repository;

import com.example.stc.domain.Entrust;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 委托实体类
 *
 * @author :lfm
 */
public interface EntrustRepository extends JpaRepository<Entrust, String> {
    /**
     * 根据id查询委托
     */
    Entrust findEntrustById(String id);
}
