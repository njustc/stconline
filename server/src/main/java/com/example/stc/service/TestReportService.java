package com.example.stc.service;

import com.example.stc.domain.TestReport;

import java.util.List;

public interface TestReportService extends BaseService<TestReport> {

    /**
     * 获取全部项目的测试报告
     */
    List<TestReport> findAllTestReports();

    /**
     * 获取全部可见的测试报告
     */
    List<TestReport> findTestReportsByAuthority();

    /**
     * 获取全部待办的测试报告
     */
    List<TestReport> findToDoTestReportsByAuthority();

    /**
     * 通过pid获取单个项目的测试报告
     */
    TestReport findTestReportByPid(String pid);

    /**
     * 新建项目测试报告
     */
    TestReport newTestReport(String pid, String uid);

    /**
     * 通过pid修改单个委托记录
     */
    TestReport updateTestReport(String pid, TestReport record);

    /**
     * 通过pid删除单个项目的测试报告
     */
    void deleteTestReportByPid(String pid);

    /**
     * 修改流程状态, 添加评审意见
     * @param pid
     * @param processState
     * @param comment
     * @return
     */
    TestReport updateProcessState(String pid, String processState, String comment);

}
