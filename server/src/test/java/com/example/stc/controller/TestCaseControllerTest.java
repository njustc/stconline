package com.example.stc.controller;

import com.example.stc.domain.TestCase;
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
public class TestCaseControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private TestCaseController testCaseController;

    @Autowired
    private UserController userController;

    private static final Logger logger = LoggerFactory.getLogger(TestCaseControllerTest.class);

    /**
     * 测试用例查询
     */
    @Test
    @WithMockUser(username = "TSA", password = "tsa", roles = {"TS", "USER"})
    public void getAllTestCaseTest() throws Exception {
        Resources<Resource<TestCase>> resources = testCaseController.getAllTestCases();
        assertThat(resources).isNotNull();
        Resources<Resource<TestCase>> partResources = testCaseController.getProjectTestCases("p20190606171312");
        assertThat(partResources).isNotNull();
    }

    /**
     * 添加+修改+删除测试方案
     * */
    @Test
    @WithMockUser(username = "TSA", password = "tsa", roles = {"TS", "USER"})
    public void NewRepDelTest() throws Exception {
        TestCase record = new TestCase();
        record.setProcessInstanceID("");
        record.setPid("pid");
        record.setDesigner("designer1");
        // 添加
        testCaseController.addNewTestCase(record);
        TestCase testCaseNew = testCaseController.getOneTestCase(record.getTestId()).getContent();
        assertThat(testCaseNew).isNotNull();
        assertThat(testCaseNew.getDesigner()).isEqualTo("designer1");
        // 修改
        testCaseNew.setDesigner("designer2");
        testCaseController.replaceTestCase(testCaseNew.getTestId(), testCaseNew);
        TestCase testCase = testCaseController.getOneTestCase(testCaseNew.getTestId()).getContent();
        assertThat(testCase).isNotNull();
        assertThat(testCase.getDesigner()).isEqualTo("designer2");
        // 删除
        testCaseController.deleteTestCase(testCaseNew.getTestId());
    }

}
