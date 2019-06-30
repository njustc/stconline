package com.example.stc.repository;

import com.example.stc.domain.Contract;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;

public interface ContractRepository extends BaseRepository<Contract> {
    Contract findByPid(String pid);

    @Modifying(flushAutomatically = true)
    @Transactional
    int deleteByPid(String pid);
}