package com.example.stc.controller;

import com.example.stc.domain.TestReport;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureWebMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

/**
 * 测试报告Test
 * */
@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureWebMvc
@AutoConfigureMockMvc
public class TestReportControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private TestReportController testReportController;

    @Autowired
    private UserController userController;

    private static final Logger logger = LoggerFactory.getLogger(TestReportControllerTest.class);

    /**
     * 测试报告查询
     */
    @Test
    @WithMockUser(username = "TSA", password = "tsa", roles = {"TS", "USER"})
    public void getAllTestReportTest() throws Exception {
        Resources<Resource<TestReport>> resources = testReportController.getAllTestReport();
        assertThat(resources).isNotNull();
    }

    /**
     * 添加+修改+删除测试报告
     * */
    @Test
    @WithMockUser(username = "TSA", password = "tsa", roles = {"TS", "USER"})
    public void NewRepDelTest() throws Exception {
        TestReport record = new TestReport();
        record.setProcessInstanceID("");
        record.setPid("pid");
        record.setVersion("1.0");
        // 添加
        testReportController.addNewTestReport(record);
        TestReport testReportNew = testReportController.getOneTestReport(record.getPid()).getContent();
        assertThat(testReportNew).isNotNull();
        assertThat(testReportNew.getVersion()).isEqualTo("1.0");
        // 修改
        testReportNew.setVersion("2.0");
        testReportController.replaceTestReport(testReportNew.getPid(), testReportNew);
        TestReport testReport = testReportController.getOneTestReport(testReportNew.getPid()).getContent();
        assertThat(testReport).isNotNull();
        assertThat(testReport.getVersion()).isEqualTo("2.0");
        // 删除
        testReportController.deleteTestReport(testReportNew.getPid());
    }

}
