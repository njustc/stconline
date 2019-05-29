package com.example.stc;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.stc.controller.CustomerEntrustController;
import com.example.stc.domain.Entrust;
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
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
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
     * 委托
     */
    @Test
    public void httpPostTest() throws Exception {
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
        String content = result.getResponse().getContentAsString();
        Entrust record = JSONObject.toJavaObject(JSONObject.parseObject(content), Entrust.class);
        //删除刚刚新建的委托内容
        mockMvc.perform(delete("/api/customers/projects" + "/" + record.getPid() + "/entrust")
                .contentType("application/json"))
                .andExpect(status().isNoContent()) // 删除成功,返回204
                .andReturn();
        //再次删除,需要返回的是404
        mockMvc.perform(delete("/api/customers/projects" + "/" + record.getPid() + "/entrust")
                .contentType("application/json"))
                .andExpect(status().isNotFound()) // 删除成功,返回204
                .andReturn();
    }

}
