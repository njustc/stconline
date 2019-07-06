package com.example.stc.service.impl;

import com.example.stc.domain.TestRecord;
import com.example.stc.framework.exception.TestRecordNotFoundException;
import com.example.stc.framework.util.DateUtils;
import com.example.stc.repository.TestRecordRepository;
import com.example.stc.service.TestRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class TestRecordServiceImpl implements TestRecordService {

    @Autowired
    private TestRecordRepository testRecordRepository;

    @Autowired
    private DateUtils dateUtils;

    @Override
    public List<TestRecord> findAllTestRecords() {
        return testRecordRepository.findAll();
    }

    @Override
    public List<TestRecord> findAllTestRecordsByPid(String pid) {
        return testRecordRepository.findAllByPid(pid);
    }

    @Override
    public TestRecord findTestRecordByTestId(String testId) {
        TestRecord testRecord = testRecordRepository.findByTestId(testId);
        if (testRecord == null)
            throw new TestRecordNotFoundException(testId);
        return testRecord;
    }

    @Override
    public void deleteTestRecordById(Long id) {
        testRecordRepository.deleteById(id);
    }

    @Override
    public void deleteTestRecordByTestId(String testId) {
        TestRecord testRecord = testRecordRepository.findByTestId(testId);
        if (testRecord == null)
            throw new TestRecordNotFoundException(testId);
        testRecordRepository.deleteByTestId(testId);
    }

    @Override
    public TestRecord newTestRecord(TestRecord testRecord) {
        // 该测试用例的pid是已经填好的
        // 根据某一个算法设置testId
        testRecord.setTestId(testRecord.getPid() + "-" + dateUtils.dateToStr(new Date(), "yyyyMMddHHmmss"));
        // TODO: 流程引擎
        return testRecordRepository.save(testRecord);
    }

    @Override
    public TestRecord updateTestRecord(String testId, TestRecord record) {
        TestRecord testRecord = testRecordRepository.findByTestId(testId);
        record.setId(testRecord.getId());
        record.setPid(testRecord.getPid());
        record.setProcessState(testRecord.getProcessState());
        record.setProcessInstanceId(testRecord.getProcessInstanceId());
        return testRecordRepository.save(record);
    }

    @Override
    public TestRecord updateProcessState(String testId, String processState, String comment) {
        TestRecord testRecord = this.findTestRecordByTestId(testId);
        testRecord.setProcessState(processState);
        testRecord.setComment(comment);
        return this.updateTestRecord(testId, testRecord);
    }
}
