package com.example.stc.repository;

import com.example.stc.domain.TestRecord;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface TestRecordRepository extends ProcessEntityRepository<TestRecord> {
    TestRecord findByTestId(String testId);

    @Modifying(flushAutomatically = true)
    @Transactional
    int deleteByTestId(String testId);


}
