package com.example.stc.service.impl;

import com.example.stc.domain.TestPlan;
import com.example.stc.framework.exception.TestPlanNotFoundException;
import com.example.stc.repository.TestPlanRepository;
import com.example.stc.service.TestPlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestPlanServiceImpl implements TestPlanService {

    @Autowired
    private TestPlanRepository testPlanRepository;

    @Override
    public List<TestPlan> findAllTestPlans() {
        return testPlanRepository.findAll();
    }

    @Override
    public TestPlan findTestPlanByPid(String pid) {
        TestPlan testPlan = testPlanRepository.findByPid(pid);
        if (testPlan == null)
            throw new TestPlanNotFoundException(pid);
        return testPlan;
    }

    @Override
    public TestPlan newTestPlan(TestPlan testPlan) {
        // 要求pid在前端已经设置好
        // TODO: 流程引擎
        return testPlanRepository.save(testPlan);
    }

    @Override
    public TestPlan updateTestPlan(String pid, TestPlan record) {
        TestPlan testPlan = testPlanRepository.findByPid(pid);
        record.setId(testPlan.getId());
        record.setPid(testPlan.getPid());
        record.setProcessState(testPlan.getProcessState());
        record.setProcessInstanceId(testPlan.getProcessInstanceId());
        return testPlanRepository.save(record);
    }

    @Override
    public void deleteTestPlanById(Long id) {
        testPlanRepository.deleteById(id);
    }

    @Override
    public void deleteTestPlanByPid(String pid) {
        TestPlan testPlan = testPlanRepository.findByPid(pid);
        if (testPlan == null)
            throw new TestPlanNotFoundException(pid);
        testPlanRepository.deleteByPid(pid);
    }
}
