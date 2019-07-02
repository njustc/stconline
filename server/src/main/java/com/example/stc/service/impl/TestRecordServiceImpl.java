package com.example.stc.service.impl;

import com.example.stc.domain.TestCase;
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
        // 该测试记录的pid和testId应该是已经填好的
        // TODO: 流程引擎
        return testRecordRepository.save(testRecord);
    }

    @Override
    public TestRecord updateTestRecord(String testId, TestRecord record) {
        TestRecord testRecord = testRecordRepository.findByTestId(testId);
        record.setId(testRecord.getId());
        record.setPid(testRecord.getPid());
        record.setProcessState(testRecord.getProcessState());
        record.setProcessInstanceID(testRecord.getProcessInstanceID());
        return testRecordRepository.save(record);
    }
}
