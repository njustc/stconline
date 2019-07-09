package com.example.stc.service.impl;

import com.example.stc.activiti.ProcessState;
import com.example.stc.domain.TestRecord;
import com.example.stc.domain.User;
import com.example.stc.framework.exception.TestRecordNotFoundException;
import com.example.stc.framework.util.AuthorityUtils;
import com.example.stc.framework.util.DateUtils;
import com.example.stc.framework.util.ProcessUtils;
import com.example.stc.repository.TestRecordRepository;
import com.example.stc.service.TestRecordService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class TestRecordServiceImpl implements TestRecordService {

    Logger logger = LoggerFactory.getLogger(TestRecordServiceImpl.class);

    @Autowired
    private TestRecordRepository testRecordRepository;

    @Autowired
    private DateUtils dateUtils;

    @Autowired
    private AuthorityUtils authorityUtils;

    @Autowired
    private ProcessUtils processUtils;

    @Override
    public List<TestRecord> findAllTestRecords() {
        return testRecordRepository.findAll();
    }

    @Override
    public List<TestRecord> findAllTestRecordsByPid(String pid) {
        return testRecordRepository.findAllByPid(pid);
    }

    @Override
    public List<TestRecord> findAllTestRecordsByPidByAuthority(String pid) {
        User curUser = authorityUtils.getLoginUser();
        logger.info("findAllTestRecordsByPidByAuthority: 当前登录者id = " + curUser.getUserID() +
                ", name = " + curUser.getUsername() + ", roles = " + curUser.getRoles());
        List<TestRecord> allTestRecords = this.findAllTestRecordsByPid(pid);
        allTestRecords.removeIf(testRecord -> !processUtils.isVisible(testRecord, "TestRecord"));
        return allTestRecords;
    }

    @Override
    public TestRecord findTestRecordByTestId(String testId) {
        TestRecord testRecord = testRecordRepository.findByTestId(testId);
        if (testRecord == null)
            throw new TestRecordNotFoundException(testId);
        return testRecord;
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
        testRecord.setTestId(testRecord.getPid() + "-" + dateUtils.dateToStr(new Date(), "yyMMddHHmmssSSS"));
        testRecord.setProcessState(ProcessState.Submit); // 待提交（未进入流程）
        testRecord.setProcessInstanceId("");
        return testRecordRepository.save(testRecord);
    }

    @Override
    public TestRecord updateTestRecord(String testId, TestRecord record) {
        TestRecord testRecord = testRecordRepository.findByTestId(testId);
        record.setId(testRecord.getId());
        record.setPid(testRecord.getPid());
        record.setUserId(testRecord.getUserId());
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
