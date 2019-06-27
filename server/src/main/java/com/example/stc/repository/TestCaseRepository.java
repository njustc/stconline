package com.example.stc.repository;

import com.example.stc.domain.TestCase;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface TestCaseRepository extends BaseRepository<TestCase> {

    List<TestCase> findAllByPid(String pid);

    TestCase findByTestId(String testId);

    @Modifying(flushAutomatically = true)
    @Transactional
    int deleteByTestId(String testId);

}
