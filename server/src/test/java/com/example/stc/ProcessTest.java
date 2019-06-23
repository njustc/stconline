package com.example.stc;

import com.example.stc.activiti.ContractAction;
import com.example.stc.activiti.EntrustAction;
import com.example.stc.controller.EntrustController;
import com.example.stc.controller.UserController;
import com.example.stc.domain.Contract;
import com.example.stc.domain.Entrust;
import com.example.stc.domain.User;
import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
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

import java.util.List;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureWebMvc
@AutoConfigureMockMvc
public class ProcessTest {

    private User user;

    private Entrust entrust;

    private Contract contract;

    @Autowired
    private EntrustAction entrustAction;

    @Autowired
    private ContractAction contractAction;

    @Autowired
    private TaskService taskService;

    @Before
    public void before() {
        user = new User();
        user.setUsername("Jack");
        user.setPassword("user");
        user.setUserID("u201906231618");

        entrust = new Entrust();
        entrust.setUser(user);
        entrust.setPid("p201906231620");

        contract = new Contract();
        contract.setUser(user);
        entrust.setPid("p201906231620");
    }

    @Test
    public void testProcess() {
        String processInstanceId = contractAction.createContractProcess(contract, user);
        System.out.println(processInstanceId);

        List<Task> tasks = taskService.createTaskQuery().processInstanceId(processInstanceId).list();
        System.out.println(tasks.size());

        // contractAction.deleteContractProcess(contract);
    }
}
