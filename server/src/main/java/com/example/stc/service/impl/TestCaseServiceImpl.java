package com.example.stc.service.impl;

import com.example.stc.domain.TestCase;
import com.example.stc.framework.exception.TestCaseNotFoundException;
import com.example.stc.framework.util.DateUtils;
import com.example.stc.repository.TestCaseRepository;
import com.example.stc.service.TestCaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class TestCaseServiceImpl implements TestCaseService {

    @Autowired
    private TestCaseRepository testCaseRepository;

    @Autowired
    private DateUtils dateUtils;

    @Override
    public List<TestCase> findAllTestCases() {
        return testCaseRepository.findAll();
    }

    @Override
    public List<TestCase> findAllTestCasesByPid(String pid) {
        return testCaseRepository.findAllByPid(pid);
    }

    @Override
    public TestCase findTestCaseByTestId(String testId) {
        TestCase testCase = testCaseRepository.findByTestId(testId);
        if (testCase == null)
            throw new TestCaseNotFoundException(testId);
        return testCase;
    }

    @Override
    public void deleteTestCaseById(Long id) {
        testCaseRepository.deleteById(id);
    }

    @Override
    public void deleteTestCaseByTestId(String testId) {
        TestCase testCase = testCaseRepository.findByTestId(testId);
        if (testCase == null)
            throw new TestCaseNotFoundException(testId);
        testCaseRepository.deleteByTestId(testId);
    }

    @Override
    public TestCase newTestCase(TestCase testCase) {
        // 该测试用例的pid是已经填好的
        // 根据某一个算法设置testId
        testCase.setTestId(testCase.getPid() + "-" + dateUtils.dateToStr(new Date(), "yyyyMMddHHmmss"));
        // TODO: 流程引擎
        return testCaseRepository.save(testCase);
    }

    @Override
    public TestCase updateTestCase(String testId, TestCase record) {
        TestCase testCase = testCaseRepository.findByTestId(testId);
        record.setId(testCase.getId());
        record.setPid(testCase.getPid());
        record.setProcessState(testCase.getProcessState());
        record.setProcessInstanceId(testCase.getProcessInstanceId());
        return testCaseRepository.save(record);
    }
}
