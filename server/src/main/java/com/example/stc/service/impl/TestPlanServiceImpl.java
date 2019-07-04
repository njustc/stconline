package com.example.stc.service.impl;

import com.example.stc.activiti.ProcessState;
import com.example.stc.domain.TestPlan;
import com.example.stc.domain.User;
import com.example.stc.framework.exception.TestPlanNotFoundException;
import com.example.stc.framework.util.AuthorityUtils;
import com.example.stc.framework.util.ProcessUtils;
import com.example.stc.repository.TestPlanRepository;
import com.example.stc.service.TestPlanService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestPlanServiceImpl implements TestPlanService {

    Logger logger = LoggerFactory.getLogger(TestPlanServiceImpl.class);

    @Autowired
    private TestPlanRepository testPlanRepository;

    @Autowired
    private AuthorityUtils authorityUtils;

    @Autowired
    private ProcessUtils processUtils;

    @Override
    public List<TestPlan> findAllTestPlans() {
        return setState(testPlanRepository.findAll());
    }

    @Override
    public List<TestPlan> findTestPlansByAuthority() {
        User curUser = authorityUtils.getLoginUser();
        logger.info("findTestPlansByAuthority: 当前登录者id = " + curUser.getUserID() +
                ", name = " + curUser.getUsername() + ", roles = " + curUser.getRoles());
        List<TestPlan> allTestPlans = this.findAllTestPlans();
        allTestPlans.removeIf(testPlan -> !processUtils.isVisible(testPlan, "TestPlan"));
        return setState(allTestPlans);
    }

    @Override
    public TestPlan findTestPlanByPid(String pid) {
        TestPlan testPlan = testPlanRepository.findByPid(pid);
        if (testPlan == null)
            throw new TestPlanNotFoundException(pid);
        return setState(testPlan);
    }

    @Override
    public TestPlan newTestPlan(String pid, String uid) {
        logger.info("newTestPlanAuto: ");
        TestPlan testPlan = new TestPlan();
        testPlan.setPid(pid);
        testPlan.setUserId(uid);
        testPlan.setProcessState(ProcessState.Submit); // 待提交（未进入流程）
        return setState(testPlanRepository.save(testPlan));
    }

    @Override
    public TestPlan updateTestPlan(String pid, TestPlan record) {
        TestPlan testPlan = testPlanRepository.findByPid(pid);
        record.setId(testPlan.getId());
        record.setPid(testPlan.getPid());
        record.setProcessState(testPlan.getProcessState());
        record.setProcessInstanceId(testPlan.getProcessInstanceId());
        return setState(testPlanRepository.save(record));
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

    @Override
    public void saveComment(String pid, String comment) {
        TestPlan testPlan = this.findTestPlanByPid(pid);
        testPlan.setComment(comment);
        this.updateTestPlan(testPlan.getPid(), testPlan);
    }

    public List<TestPlan> setState(List<TestPlan> testPlans) {
        for (TestPlan testPlan: testPlans) {
            testPlan.setProcessState(processUtils.getProcessState(testPlan.getProcessInstanceId()));
        }
        return testPlans;
    }

    public TestPlan setState(TestPlan testPlan) {
        testPlan.setProcessState(processUtils.getProcessState(testPlan.getProcessInstanceId()));
        return testPlan;
    }
}
