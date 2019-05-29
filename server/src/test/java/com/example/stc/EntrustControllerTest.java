package com.example.stc;

import com.alibaba.fastjson.JSON;
import com.example.stc.controller.CustomerEntrustController;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureWebMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;

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
public class EntrustControllerTest {
    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private CustomerEntrustController entrustController;

    private static final Logger logger = LoggerFactory.getLogger(EntrustControllerTest.class);

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
        Map<String, Object> reqBody = new HashMap<>();
        reqBody.put("pid", "hello");
        logger.info("sent post with body " + JSON.toJSONString(reqBody));
        //新建委托
        MvcResult result = mockMvc.perform(post("/api/customers/projects")
                .content(JSON.toJSONString(reqBody))
                .contentType("application/json"))
                .andExpect(status().isCreated())
                .andReturn();

    }
}
