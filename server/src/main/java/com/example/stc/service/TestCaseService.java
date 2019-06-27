package com.example.stc.service;

import com.example.stc.domain.TestCase;
import org.springframework.security.access.annotation.Secured;

import java.util.List;

/**
 * 测试用例业务逻辑
 */
public interface TestCaseService extends BaseService<TestCase> {

    /**
     * 获取全部测试用例
     */
    List<TestCase> findAllTestCases();

    /**
     * 通过项目ID查询该项目的全部测试用例
     */
    List<TestCase> findAllTestCasesByPid(String pid);

    /**
     * 通过用例ID查询单个测试用例
     */
    TestCase findTestCaseByTestId(String testId);

    /**
     * 通过主键ID删除单个测试用例
     * 如果不存在,就报错
     */
    void deleteTestCaseById(Long id);

    /**
     * 通过用例ID删除单个测试用例
     */
    void deleteTestCaseByTestId(String testId);

    /**
     * 插入单个测试用例
     */
    TestCase newTestCase(String pid, TestCase testCase);

    /**
     * 通过用例ID修改单个测试用例
     * */
    TestCase updateTestCase(String testId, TestCase record);

}
