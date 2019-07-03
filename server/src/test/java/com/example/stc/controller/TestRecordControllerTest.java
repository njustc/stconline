package com.example.stc.controller;

import com.example.stc.domain.TestRecord;
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
import org.springframework.http.ResponseEntity;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureWebMvc
@AutoConfigureMockMvc
public class TestRecordControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private TestRecordController testRecordController;

    @Autowired
    private UserController userController;

    private static final Logger logger = LoggerFactory.getLogger(TestRecordControllerTest.class);

    /**
     * 测试用例查询
     */
    @Test
    @WithMockUser(username = "TSA", password = "tsa", roles = {"TS", "USER"})
    public void getAllTestRecordTest() throws Exception {
        Resources<Resource<TestRecord>> resources = testRecordController.getAllTestRecords();
        assertThat(resources).isNotNull();
        Resources<Resource<TestRecord>> partResources = testRecordController.getProjectTestRecords("p20190606171312");
        assertThat(partResources).isNotNull();
    }

    /**
     * 添加+修改+删除测试方案
     * */
    @Test
    @WithMockUser(username = "TSA", password = "tsa", roles = {"TS", "USER"})
    public void NewRepDelTest() throws Exception {
        TestRecord record = new TestRecord();
        record.setProcessInstanceId("");
        record.setPid("pid");
        record.setTestId("pid-testId");
        record.setBugId("000");
        // 添加
        testRecordController.addNewTestRecord(record);
        TestRecord testRecordNew = testRecordController.getOneTestRecord(record.getTestId()).getContent();
        assertThat(testRecordNew).isNotNull();
        assertThat(testRecordNew.getBugId()).isEqualTo("000");
        // 修改
        testRecordNew.setBugId("111");
        testRecordController.replaceTestRecord(testRecordNew.getTestId(), testRecordNew);
        TestRecord testRecord = testRecordController.getOneTestRecord(testRecordNew.getTestId()).getContent();
        assertThat(testRecord).isNotNull();
        assertThat(testRecord.getBugId()).isEqualTo("111");
        // 删除
        testRecordController.deleteTestRecord(testRecordNew.getTestId());
    }

}
