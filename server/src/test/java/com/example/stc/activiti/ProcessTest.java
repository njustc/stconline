package com.example.stc.activiti;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.stc.controller.EntrustController;
import com.example.stc.domain.Entrust;
import com.example.stc.framework.core.web.Response;
import com.example.stc.framework.util.ProcessUtils;
import com.example.stc.service.EntrustService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureWebMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.hateoas.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import java.util.HashMap;
import java.util.Map;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;


@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureWebMvc
@AutoConfigureMockMvc
public class ProcessTest {

    private String userId;
    private String pid;

    @Autowired
    private EntrustService entrustService;

    @Autowired
    private ProcessService processService;

    @Autowired
    private ProcessUtils processUtils;

    @Before
    public void before() {
        userId = "u20190609235999";
        /** 创建委托 */
        Entrust entrust = new Entrust();
        entrust.setUserId(userId);
        entrust = entrustService.newEntrust(entrust);
        pid = entrust.getPid();
    }

    @Test
    @WithMockUser(username = "BOSS", password = "boss")
    public void testProcess() throws Exception {
        /** 第一次提交委托 */
        processService.createProcessInstance(pid, "Entrust");

        /** 审批不通过 */
        Entrust entrust = entrustService.findEntrustByPid(pid);
        entrust.setOperation("ReviewDisprove");
        entrust.setComment("我觉得不行");
        processService.updateProcessInstance((JSONObject)JSON.toJSON(entrust), "Entrust");

        /** 第二次提交委托 */
        processService.updateProcessInstance((JSONObject)JSON.toJSON(entrust), "Entrust");

        /** 审批通过 */
        entrust = entrustService.findEntrustByPid(pid);
        processUtils.isVisible(entrust, "Entrust");
    }

}
