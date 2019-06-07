package com.example.stc;

import com.example.stc.controller.EntrustController;
import com.example.stc.controller.UserController;
import com.example.stc.domain.Entrust;
import com.example.stc.domain.User;
import com.example.stc.service.EntrustService;
import com.example.stc.service.UserService;
import org.activiti.engine.*;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.runtime.ProcessInstance;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.junit4.SpringRunner;

import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;

@RunWith(SpringRunner.class)
@SpringBootTest
public class StcApplicationTests {
//    @Autowired
//    private RuntimeService runtimeService;
//    @Autowired
//    private RepositoryService repositoryService;
//    @Autowired
//    private TaskService taskService;
//    @Autowired
//    private IdentityService identityService;
//    @Autowired
//    private HistoryService historyService;
//    @Autowired
//    private FormService formService;

    //发布流程
    /*
     * 在部署后，每次系统启动时都会被解析，把内容封装成流程定义放入项目缓存中。
     * Activiti框架结合这个xml文件自动管理流程，流程的执行就是按照bpmn文件定义的规则执行的
     * */
//    @Test
//    public void deployment() {
//        ProcessEngine processEngine =
//                ProcessEngines.getDefaultProcessEngine();
//        Deployment deployment =
//                processEngine.getRepositoryService()
//                        .createDeployment()
//                        .addClasspathResource("processes/Consign.bpmn20.xml")
//                        .deploy();
//        System.out.println("id = " + deployment.getId());
//        System.out.println("name = " + deployment.getName());
//        System.out.println("key = " + deployment.getKey());
//    }
//
//    //启动流程
//    @Test
//    public void startProcess() {
//        ProcessEngine processEngine =
//                ProcessEngines.getDefaultProcessEngine();
//        ProcessInstance pi = processEngine.getRuntimeService().startProcessInstanceByKey("myservice");
//    }

    @Autowired
    private UserController userController;

    @Autowired
    private UserService userService;

    @Autowired
    private EntrustService entrustService;

    @Autowired
    private EntrustController entrustController;

    private ArrayList<User> users = new ArrayList<>();
    private ArrayList<Entrust> entrusts = new ArrayList<>();

    @Test
    @WithMockUser(username = "CUSA", password = "cusa", roles = {"USER","CUS"})
    public void createUserAndEntrust() {
//        /**
//         * 创建用户
//         */
//        for (int i = 0; i < 4; i++)
//            users.add(new User());
//
//        users.get(0).setUsername("Morison");
//        users.get(1).setUsername("Lucio");
//        users.get(2).setUsername("Mei");
//        users.get(3).setUsername("Ana");
//
//        try {
//            for (User user: users) {
//                user.setPassword("user");
//                userController.registerCustomer(user);
//                TimeUnit.SECONDS.sleep(1);
//            }
//        } catch (InterruptedException e) {
//            e.printStackTrace();
//        }

        Entrust entrust = new Entrust();
        entrustService.updateEntrust("p20190606171311", entrust);
    }

}
