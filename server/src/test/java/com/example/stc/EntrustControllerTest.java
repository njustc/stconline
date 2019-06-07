package com.example.stc;

import com.alibaba.fastjson.JSONObject;
import com.example.stc.controller.EntrustController;
import com.example.stc.controller.UserController;
import com.example.stc.domain.Entrust;
import com.example.stc.domain.User;
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
import org.springframework.mock.web.MockHttpSession;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureWebMvc
@AutoConfigureMockMvc
@WithMockUser(username = "CUSA", password = "cusa", roles = {"CUS", "USER"})
public class EntrustControllerTest {
    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private EntrustController entrustController;

    @Autowired
    private UserController userController;
    private MockHttpSession session;

    private static final Logger logger = LoggerFactory.getLogger(EntrustControllerTest.class);

    //进行认证操作 , 避免之后无法调用方法
    @Before
    public void prepare() throws Exception {
        this.session = new MockHttpSession();

    }

    @Test
    public void notNull() throws Exception {
        assertThat(entrustController).isNotNull();
        assertThat(userController).isNotNull();
        assertThat(mockMvc).isNotNull();
    }


    /**
     * 接口测试
     * 委托查询
     */
    @Test
//    @WithMockUser(username = "CUSA", password = "cusa", roles = {"CUS", "USER"})
    public void getAllEntrustTest() throws Exception {
        Resources<Resource<Entrust>> resources =
                this.entrustController.getAllEntrust();
        assertThat(resources).isNotNull();
    }

    @Test
    @WithMockUser(username = "CUSA", password = "cusa", roles = {"CUS","USER"})
    public void PDSMTest() throws Exception {
        User user = new User();
        user.setUsername("CUSA");
        user.setPassword("cusa");
        user.setUserID("aaa");
        user.setId(131L);
        Entrust record = new Entrust();
        record.setUser(user);
        ResponseEntity<?> entity =
                this.entrustController.addNewEntrust(record);
        Resource<Entrust> resource = (Resource<Entrust>) entity.getBody();
        record = resource.getContent();
        assertThat(record).isNotNull();
        //删除记录
        entity = this.entrustController.deleteEntrust(record.getPid());
        assertThat(entity).isNotNull();
    }
}
