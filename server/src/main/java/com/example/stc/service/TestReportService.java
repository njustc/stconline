package com.example.stc.service;

import com.example.stc.domain.TestReport;

import java.util.List;

public interface TestReportService extends BaseService<TestReport> {

    /**
     * 获取全部项目的测试报告
     */
    List<TestReport> findAllTestReports();

    /**
     * 通过pid获取单个项目的测试报告
     */
    TestReport findTestReportByPid(String pid);

    /**
     * 新建项目测试报告
     */
    TestReport newTestReport(String pid, TestReport testReport);

    /**
     * 通过pid修改单个委托记录
     */
    TestReport updateTestReport(String pid, TestReport record);
    
    /**
     * 通过id删除单个项目的测试报告
     */
    void deleteTestReportById(Long id);

    /**
     * 通过pid删除单个项目的测试报告
     */
    void deleteTestReportByPid(String pid);

}
