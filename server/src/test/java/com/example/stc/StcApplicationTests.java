package com.example.stc;

import org.activiti.engine.*;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.runtime.ProcessInstance;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class StcApplicationTests {
    @Autowired
    private RuntimeService runtimeService;
    @Autowired
    private RepositoryService repositoryService;
    @Autowired
    private TaskService taskService;
    @Autowired
    private IdentityService identityService;
    @Autowired
    private HistoryService historyService;
    @Autowired
    private FormService formService;

    //发布流程
    /*
     * 在部署后，每次系统启动时都会被解析，把内容封装成流程定义放入项目缓存中。
     * Activiti框架结合这个xml文件自动管理流程，流程的执行就是按照bpmn文件定义的规则执行的
     * */
    @Test
    public void deployment() {
        ProcessEngine processEngine =
                ProcessEngines.getDefaultProcessEngine();
        Deployment deployment =
                processEngine.getRepositoryService()
                        .createDeployment()
                        .addClasspathResource("processes/Consign.bpmn20.xml")
                        .deploy();
        System.out.println("id = " + deployment.getId());
        System.out.println("name = " + deployment.getName());
        System.out.println("key = " + deployment.getKey());
    }

    //启动流程
    @Test
    public void startProcess() {
        ProcessEngine processEngine =
                ProcessEngines.getDefaultProcessEngine();
        ProcessInstance pi = processEngine.getRuntimeService().startProcessInstanceByKey("myservice");
    }

}
