package com.example.stc.service.impl;

import com.example.stc.domain.TestCase;
import com.example.stc.repository.TestCaseRepository;
import com.example.stc.service.TestCaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestCaseServiceImpl implements TestCaseService {

    @Autowired
    private TestCaseRepository testCaseRepository;

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
        return testCaseRepository.findByTestId(testId);
    }

    @Override
    public void deleteTestCaseById(Long id) {
        testCaseRepository.deleteById(id);
    }

    @Override
    public void deleteTestCaseByTestId(String testId) {
        testCaseRepository.deleteByTestId(testId);
    }

    @Override
    public TestCase newTestCase(String pid, TestCase testCase) {
        testCase.setPid(pid);
        // TODO: 流程引擎
        return testCaseRepository.save(testCase);
    }

    @Override
    public TestCase updateTestCase(String testId, TestCase record) {
        TestCase testCase = testCaseRepository.findByTestId(testId);
        record.setId(testCase.getId());
        record.setPid(testCase.getPid());
        record.setProcessState(testCase.getProcessState());
        record.setProcessInstanceID(testCase.getProcessInstanceID());
        return testCaseRepository.save(record);
    }
}
