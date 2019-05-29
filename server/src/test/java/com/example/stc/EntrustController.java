package com.example.stc;

import com.example.stc.controller.CustomerEntrustController;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureWebMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpStatus;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.ResultMatcher;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureWebMvc
@AutoConfigureMockMvc
public class EntrustController {
    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private CustomerEntrustController entrustController;

    @Test
    public void notNull() throws Exception {
        assertThat(entrustController).isNotNull();
        assertThat(mockMvc).isNotNull();
    }

    /**
     * 接口测试
     */
    @Test
    public void httpTest() throws Exception {
        mockMvc.perform(get("/api/customers/projects"))
                .andExpect(status().isOk());
        //新建委托
//        mockMvc.perform(post("/api/customers/projects")
//                .contentType("application/json"))
//                .andExpect(status().isCreated());
    }
}
