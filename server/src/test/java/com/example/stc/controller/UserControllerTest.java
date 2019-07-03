package com.example.stc.controller;

import com.alibaba.fastjson.JSON;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureWebMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import java.util.HashMap;
import java.util.Map;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureWebMvc
@AutoConfigureMockMvc
public class UserControllerTest {
    @Autowired
    private UserController userController;
    @Autowired
    private MockMvc mockMvc;

    private final String loginUri = "/api/login";

    @Test
    public void checkNotNull() {
        assertThat(userController).isNotNull();
        assertThat(mockMvc).isNotNull();
    }

    /**
     * 测试未鉴权之后的用户
     */
    @Test
    public void checkNotAuth() throws Exception {
        //check not auth
        mockMvc.perform(get("/api/project/entrust"))
                .andExpect(status().isUnauthorized());
    }

    /**
     * 登录接口测试
     */
    @Test
    public void apiLogin() throws Exception {
        Map<String, String> req = new HashMap<>();
        //设定正确的账号密码
        req.put("username", "CUSA");
        req.put("password", "cusa");
        mockMvc.perform(post("/api/login")
                .content(JSON.toJSONString(req))
                .contentType("application/json"))
                .andExpect(status().isOk());
        //设定错误的账号密码
        req.replace("password", "cussa");
        mockMvc.perform(post("/api/login")
                .content(JSON.toJSONString(req))
                .contentType("application/json"))
                .andExpect(status().isUnauthorized());
    }

}
