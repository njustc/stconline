package com.example.stc.web;

import com.example.stc.controller.UserController;
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

    @Test
    public void checkNotNull() {
        assertThat(userController).isNotNull();
        assertThat(mockMvc).isNotNull();
    }

    @Test
    public void checkNotAuth() throws Exception {
        //check not auth
        mockMvc.perform(get("/api/project/**"))
                .andExpect(status().isFound())
                .andDo(result1 -> Assert.assertEquals("http://localhost/login",  //重定向成功
                        result1.getResponse().getRedirectedUrl()));
    }

    @Test
    public void apiRegister() throws Exception {
        MvcResult result = mockMvc.perform(get("/api/register"))
                .andExpect(status().isOk())
                .andReturn();
        //check the register page
        Assert.assertEquals("DEBUG: 用户注册，请Post", result.getResponse().getContentAsString());
    }


}
