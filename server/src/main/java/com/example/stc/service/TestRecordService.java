package com.example.stc.service;

import com.example.stc.domain.Entrust;
import com.example.stc.domain.TestRecord;

import java.util.List;

/**
 * 测试记录业务逻辑
 */
public interface TestRecordService extends BaseService<TestRecord> {

    /**
     * 获取全部测试记录
     */
    List<TestRecord> findAllTestRecords();

    /**
     * 通过项目ID查询该项目的全部测试记录
     */
    List<TestRecord> findAllTestRecordsByPid(String pid);

    /**
     * 通过项目ID查询该项目的全部可见测试记录
     */
    List<TestRecord> findAllTestRecordsByPidByAuthority(String pid);

    /**
     * 通过用例ID查询单个测试记录
     */
    TestRecord findTestRecordByTestId(String testId);

    /**
     * 通过用例ID删除单个测试记录
     */
    void deleteTestRecordByTestId(String testId);

    /**
     * 插入单个测试记录
     */
    TestRecord newTestRecord(TestRecord testRecord);

    /**
     * 通过用例ID修改单个测试记录
     * */
    TestRecord updateTestRecord(String testId, TestRecord record);

    /**
     * 修改流程状态, 添加评审意见
     * @param testId
     * @param processState
     * @param comment
     * @return
     */
    TestRecord updateProcessState(String testId, String processState, String comment);

}
