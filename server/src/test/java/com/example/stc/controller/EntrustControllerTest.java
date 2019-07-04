package com.example.stc.controller;

import com.example.stc.activiti.ProcessState;
import com.example.stc.domain.Entrust;
import com.example.stc.domain.User;
import com.example.stc.framework.util.AuthorityUtils;
import org.junit.Before;
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

import java.net.URISyntaxException;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureWebMvc
@AutoConfigureMockMvc
public class EntrustControllerTest {
    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private EntrustController entrustController;

    @Autowired
    private UserController userController;

    @Autowired
    private AuthorityUtils authorityUtils;

    private static final Logger logger = LoggerFactory.getLogger(EntrustControllerTest.class);

    //进行认证操作 , 避免之后无法调用方法
    @Before
    public void prepare() throws Exception {
    }

    @Test
    public void notNull() throws Exception {
        assertThat(entrustController).isNotNull();
        assertThat(userController).isNotNull();
        assertThat(mockMvc).isNotNull();
    }


    /**
     * 委托查询
     */
    @Test
    @WithMockUser(username = "CUSA", password = "cusa", roles = {"CUS", "USER"})
    public void getAllEntrustTest() throws Exception {
        Resources<Resource<Entrust>> resources = entrustController.getAllEntrust();
        assertThat(resources).isNotNull();
    }

    /**
     * 添加+修改+删除委托
     */
    @Test
    @WithMockUser(username = "CUSA", password = "cusa", roles = {"CUS", "USER"})
    public void NewRepDelTest() throws Exception {
//        User user = new User();
//        user.setUsername("CUSA");
//        user.setPassword("cusa");
//        user.setUserID("u20190605134344");
//        user.setId(5L);
        Entrust record = new Entrust();
        record.setProcessInstanceId("");
//        record.setUser(user);
        record.setUserId(authorityUtils.getLoginUser().getUserID());
        logger.info("-----------------------------------");
        logger.info("");
        logger.info("User: uid = " + record.getUserId());
        logger.info("");
        logger.info("-----------------------------------");
        record.setVersion("1.0");
        // 添加
        ResponseEntity<?> entity = entrustController.addNewEntrust(record);
        Resource<Entrust> resource = (Resource<Entrust>) entity.getBody();
        Entrust entrustNew = entrustController.getOneEntrust(resource.getContent().getPid()).getContent();
        assertThat(entrustNew).isNotNull();
        assertThat(entrustNew.getVersion()).isEqualTo("1.0");
        // 修改
        entrustNew.setVersion("2.0");
        entrustController.replaceEntrust(entrustNew.getPid(), entrustNew);
        Entrust entrust = entrustController.getOneEntrust(entrustNew.getPid()).getContent();
        assertThat(entrust).isNotNull();
        assertThat(entrust.getVersion()).isEqualTo("2.0");
        // 删除
        entrustController.deleteEntrust(entrustNew.getPid());
    }

}
