package com.example.stc.web;

import com.alibaba.fastjson.JSON;
import com.example.stc.controller.UserController;
import com.example.stc.domain.User;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureWebMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultHandler;

import java.util.HashMap;
import java.util.Map;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
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

    @Test
    public void checkNotAuth() throws Exception {
        //check not auth
        mockMvc.perform(get("/api/project/**"))
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
