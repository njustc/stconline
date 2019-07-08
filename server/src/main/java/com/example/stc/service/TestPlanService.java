package com.example.stc.service;

import com.example.stc.domain.TestPlan;
import org.springframework.security.access.annotation.Secured;

import java.util.List;

public interface TestPlanService extends BaseService<TestPlan> {

    /**
     * 获取全部项目的测试方案
     */
    List<TestPlan> findAllTestPlans();

    /**
     * 获取全部可见的测试方案
     */
    List<TestPlan> findTestPlansByAuthority();

    /**
     * 获取全部待办的测试方案
     */
    List<TestPlan> findToDoTestPlansByAuthority();

    /**
     * 通过pid获取单个项目的测试方案
     */
    TestPlan findTestPlanByPid(String pid);

    /**
     * 新建项目测试方案
     */
    TestPlan newTestPlan(String pid, String uid);

    /**
     * 通过pid修改单个委托记录
     */
    TestPlan updateTestPlan(String pid, TestPlan record);

    /**
     * 通过pid删除单个项目的测试方案
     */
    void deleteTestPlanByPid(String pid);

    /**
     * 修改流程状态, 添加评审意见
     * @param pid
     * @param processState
     * @param comment
     * @return
     */
    TestPlan updateProcessState(String pid, String processState, String comment);
}
