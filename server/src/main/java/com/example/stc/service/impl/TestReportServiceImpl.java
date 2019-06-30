package com.example.stc.service.impl;

import com.example.stc.domain.TestReport;
import com.example.stc.repository.TestReportRepository;
import com.example.stc.service.TestReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestReportServiceImpl implements TestReportService {

    @Autowired
    private TestReportRepository testReportRepository;

    @Override
    public List<TestReport> findAllTestReports() {
        return testReportRepository.findAll();
    }

    @Override
    public TestReport findTestReportByPid(String pid) {
        return testReportRepository.findByPid(pid);
    }

    @Override
    public TestReport newTestReport(TestReport testReport) {
        // 要求pid在前端已经设置好
        // TODO: 流程引擎
        return testReportRepository.save(testReport);
    }

    @Override
    public TestReport updateTestReport(String pid, TestReport record) {
        TestReport testReport = testReportRepository.findByPid(pid);
        record.setId(testReport.getId());
        record.setPid(testReport.getPid());
        record.setProcessState(testReport.getProcessState());
        record.setProcessInstanceID(testReport.getProcessInstanceID());
        return testReportRepository.save(record);
    }

    @Override
    public void deleteTestReportById(Long id) {
        testReportRepository.deleteById(id);
    }

    @Override
    public void deleteTestReportByPid(String pid) {
        testReportRepository.deleteByPid(pid);
    }
}
