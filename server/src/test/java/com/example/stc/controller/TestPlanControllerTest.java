package com.example.stc.controller;

import com.example.stc.domain.TestPlan;
import com.example.stc.domain.User;
import com.example.stc.framework.util.AuthorityUtils;
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
public class TestPlanControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private TestPlanController testPlanController;

    @Autowired
    private UserController userController;

    @Autowired
    private AuthorityUtils authorityUtils;

    private static final Logger logger = LoggerFactory.getLogger(TestPlanControllerTest.class);

    /**
     * 测试方案查询
     */
    @Test
    @WithMockUser(username = "TSA", password = "tsa", roles = {"TS", "USER"})
    public void getAllTestPlanTest() throws Exception {
        Resources<Resource<TestPlan>> resources = testPlanController.getAllTestPlan();
        assertThat(resources).isNotNull();
    }

    /**
     * 添加+修改+删除测试方案
     * */
    @Test
    @WithMockUser(username = "TSA", password = "tsa", roles = {"TS", "USER"})
    public void NewRepDelTest() throws Exception {
        // 添加
        ResponseEntity<?> entity = testPlanController.addNewTestPlan("pid", authorityUtils.getLoginUser().getUserID());
        Resource<TestPlan> resource = (Resource<TestPlan>) entity.getBody();
        resource.getContent().setBody("body1");
        testPlanController.replaceTestPlan(resource.getContent().getPid(), resource.getContent());
        TestPlan testPlanNew = testPlanController.getOneTestPlan(resource.getContent().getPid()).getContent();
        assertThat(testPlanNew).isNotNull();
        assertThat(testPlanNew.getBody()).isEqualTo("body1");
        // 修改
        testPlanNew.setBody("body2");
        testPlanController.replaceTestPlan(testPlanNew.getPid(), testPlanNew);
        TestPlan testPlan = testPlanController.getOneTestPlan(testPlanNew.getPid()).getContent();
        assertThat(testPlan).isNotNull();
        assertThat(testPlan.getBody()).isEqualTo("body2");
        // 删除
        testPlanController.deleteTestPlan(testPlanNew.getPid());
    }

}
