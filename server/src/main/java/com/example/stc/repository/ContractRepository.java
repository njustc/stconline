package com.example.stc.repository;

import com.example.stc.domain.Contract;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface ContractRepository extends ProcessEntityRepository<Contract> {
}
