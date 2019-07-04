package com.example.stc.service.impl;

import com.example.stc.activiti.ProcessState;
import com.example.stc.domain.TestPlan;
import com.example.stc.framework.exception.TestPlanNotFoundException;
import com.example.stc.repository.TestPlanRepository;
import com.example.stc.service.TestPlanService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestPlanServiceImpl implements TestPlanService {

    Logger logger = LoggerFactory.getLogger(ContractServiceImpl.class);

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
    public TestPlan newTestPlan(String pid, String uid) {
        logger.info("newTestPlanAuto: ");
        TestPlan testPlan = new TestPlan();
        testPlan.setPid(pid);
        testPlan.setUserId(uid);
        testPlan.setProcessState(ProcessState.Submit); // 待提交（未进入流程）
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
