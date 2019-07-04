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
     * 通过id删除单个项目的测试方案
     */
    void deleteTestPlanById(Long id);

    /**
     * 通过pid删除单个项目的测试方案
     */
    void deleteTestPlanByPid(String pid);

}
