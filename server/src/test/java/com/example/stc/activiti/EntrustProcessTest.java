package com.example.stc.activiti;

import com.example.stc.StcApplication;
import com.example.stc.domain.Entrust;
import com.example.stc.service.EntrustService;
import com.example.stc.service.UserService;
import org.activiti.engine.*;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.User;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = StcApplication.class)
public class EntrustProcessTest {

    /** 通过默认载入activiti.cfg.xml获取 */
    private ProcessEngine processEngine = ProcessEngines.getDefaultProcessEngine();

    @Autowired
    private EntrustAction entrustAction;

    @Autowired
    private EntrustService entrustService;

    @Autowired
    private UserService userService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private FormService formService;

    private Entrust entrust;
    private com.example.stc.domain.User user;

//    private Entrust entrust1;
//    private Entrust entrust2;
//    private Entrust entrust3;
//    private com.example.stc.domain.User customer1;
//    private com.example.stc.domain.User customer2;
//    private com.example.stc.domain.User customer3;
//    private String processInstanceId;
//    private String projectId;
//
//    @Before
//    public void setUp() {
//        customer1 = userService.getUserByUsername("Tonny");
//        customer2 = userService.getUserByUsername("Jimmy");
//        customer3 = userService.getUserByUsername("Larry");
//        entrust1 = entrustService.findEntrustById(1L);
//        entrust2 = entrustService.findEntrustById(2L);
//        entrust3 = entrustService.findEntrustById(3L);
//    }

//    @Test
//    public void createEntrustTest() {
//        try {
//            processInstanceId = entrustAction.createEntrustProcess(entrust1, customer1);
//            Assert.assertNotNull(processInstanceId);
//            System.out.println("Create Success");
//            System.out.println("processInstanceId: " + processInstanceId);
//        } catch(Exception e){
//            e.printStackTrace();
//        }
//    }

    @Before
    public void before() {
        entrust = entrustService.findEntrustById(1L);
        user = userService.getUserByUsername("Tonny");
    }

    /**
     * 测试添加数据进入数据库
     */
    @Test
    public void createUserAndEntrust() {
        IdentityService identityService = processEngine.getIdentityService();

    }

    /** 部署流程定义 */
    @Test
    public void deployEntrustProcess() {
        Deployment deployment = processEngine.getRepositoryService()//与流程定义和部署对象相关的Service
                .createDeployment() // 创建一个部署对象
                .name("EntrustProcess测试") // 添加部署的名称
                .addClasspathResource("processes/Entr ps" +
                        "rust.bpmn20.xml") // 从classpath的资源中加载，一次只能加载一个文件
                .deploy();//完成部署
        System.out.println("部署ID：" + deployment.getId());
        System.out.println("部署名称：" + deployment.getName());
    }

    /** 设置用户与用户组 */
    @Test
    public void setUsersAndGroups() {
        IdentityService identityService = processEngine.getIdentityService();
        // 初始化
        identityService.deleteUser("C1");
        identityService.deleteUser("C2");
        identityService.deleteUser("C3");
        identityService.deleteUser("S4");
        identityService.deleteUser("S5");
        identityService.deleteGroup("Customers");
        identityService.deleteGroup("Staff");
        // 创建用户组
        Group groupC = identityService.newGroup("Customers");
        groupC.setName("客户组");
        identityService.saveGroup(groupC);
        Group groupS = identityService.newGroup("Staff");
        groupS.setName("工作人员组");
        identityService.saveGroup(groupS);
        // 创建用户
        User user1 = identityService.newUser("C1");
        User user2 = identityService.newUser("C2");
        User user3 = identityService.newUser("C3");
        User user4 = identityService.newUser("S4");
        User user5 = identityService.newUser("S5");
        identityService.saveUser(user1);
        identityService.saveUser(user2);
        identityService.saveUser(user3);
        identityService.saveUser(user4);
        identityService.saveUser(user5);
        // 建立用户和角色的关联关系
        identityService.createMembership("C1", "Customers");
        identityService.createMembership("C2", "Customers");
        identityService.createMembership("C3", "Customers");
        identityService.createMembership("S4", "Staff");
        identityService.createMembership("S5", "Staff");
        // 查询
        List<User> customers = identityService.createUserQuery().memberOfGroup("Customers").list();
        List<User> staff = identityService.createUserQuery().memberOfGroup("Staff").list();
        System.out.println("已创建用户组及其成员，查询：");
        System.out.println("Customers: ");
        for (User c: customers)
            System.out.print("  " + c.getId());
        System.out.println("\nStaff: ");
        for (User s: staff)
            System.out.print("  " + s.getId());
    }

    /** 查询用户和用户组 */
    @Test
    public void queryUsersAndGroups() {
        IdentityService identityService = processEngine.getIdentityService();
        User customer = identityService.createUserQuery().userId("C1").singleResult();
        System.out.println("查询用户得到：" + customer.getId());
        Group staffGroup = identityService.createGroupQuery().groupId("Staff").singleResult();
        System.out.println("查询组得到：" + staffGroup.getId());
    }

    /** 启动流程实例 */
    @Test
    public void startProcessInstance() {
        // 定义参数
//        Map<String, Object> variables = new HashMap<String, Object>();
//        variables.put("CustomersGroup", "Customers"); // 为candidateGroups的参数CustomersGroup指定值
//        variables.put("StaffGroup", "Staff"); // 为candidateGroups的参数StaffGroup指定值
//        // 流程定义的key
//        String processDefinitionKey = "entrust_process";
//        ProcessInstance processInstance = processEngine.getRuntimeService()// 与正在执行的流程实例和执行对象相关的Service
//                .startProcessInstanceByKey(processDefinitionKey, variables);// 使用流程定义的key启动流程实例，EntrustProcess.bpmn中id的属性值
//        System.out.println("流程实例ID:" + processInstance.getId());// 流程实例ID
//        System.out.println("流程定义ID:" + processInstance.getProcessDefinitionId());// 流程定义ID
        /** 创建流程 */
        System.out.println(entrust.getPid());
        System.out.println(user.getUserID());
        entrustAction.createEntrustProcess(entrust, user);
        System.out.println("Process status: " + entrustAction.getEntrustProcessState(entrust.getProcessInstanceID()));

        try {
            /** 提交 */
            entrustAction.updateEntrustProcess(entrust, null, null);
            System.out.println("Process status: " + entrustAction.getEntrustProcessState(entrust.getProcessInstanceID()));

            /** 否决 */
            entrustAction.updateEntrustProcess(entrust, "ReviewDisprove", null);
            System.out.println("Process status: " + entrustAction.getEntrustProcessState(entrust.getProcessInstanceID()));

            /** 再提交 */
            entrustAction.updateEntrustProcess(entrust, null, null);
            System.out.println("Process status: " + entrustAction.getEntrustProcessState(entrust.getProcessInstanceID()));

            /** 通过 */
            entrustAction.updateEntrustProcess(entrust, "ReviewPass", null);
            System.out.println("Process status: " + entrustAction.getEntrustProcessState(entrust.getProcessInstanceID()));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

//    /** 认领任务 */
//    @Test
//    public void claimTasks() {
//        TaskService taskService = processEngine.getTaskService();
//        Task customerTask = taskService.createTaskQuery().taskCandidateGroup("Customers").singleResult();
//        taskService.claim(customerTask.getId(), "C1");
//        System.out.println("流程实例ID:" + customerTask.getProcessInstanceId());// 流程实例ID
//        System.out.println("流程定义ID:" + customerTask.getProcessDefinitionId());// 流程定义ID
//        System.out.println("任务：" + customerTask.getId() + "  " + customerTask.getName());
//        System.out.println("成功认领");
//    }
//
//    /** 解除认领 */
//    @Test
//    public void declaimTasks() {
//        TaskService taskService = processEngine.getTaskService();
//        Task customerTask = taskService.createTaskQuery().taskCandidateOrAssigned("C1").singleResult();
//        taskService.setAssignee(customerTask.getId(), null);
//        System.out.println("流程实例ID:" + customerTask.getProcessInstanceId());// 流程实例ID
//        System.out.println("流程定义ID:" + customerTask.getProcessDefinitionId());// 流程定义ID
//        System.out.println("任务：" + customerTask.getId() + "  " + customerTask.getName());
//        System.out.println("解除认领");
//    }
//
//    /** 完成任务 */
//    @Test
//    public void completeTasks() {
//        TaskService taskService = processEngine.getTaskService();
//        Task customerTask = taskService.createTaskQuery().taskAssignee("C1").singleResult();
//        taskService.addComment(customerTask.getId(), customerTask.getProcessInstanceId(), "提交委托");
//        taskService.complete(customerTask.getId());
//        System.out.println("流程实例ID:" + customerTask.getProcessInstanceId());// 流程实例ID
//        System.out.println("流程定义ID:" + customerTask.getProcessDefinitionId());// 流程定义ID
//        System.out.println("任务：" + customerTask.getId() + "  " + customerTask.getName());
//        System.out.println("完成任务，认领者：" + customerTask.getAssignee());
//    }

    /** 查询当前任务 */
    @Test
    public void queryTasks() {
        TaskService taskService = processEngine.getTaskService();
        List<Task> tasks = taskService.createTaskQuery().list();
        System.out.println("查询全部任务：");
        for (Task task: tasks) {
            System.out.println("  " + task.getId() + ": " + task.getName() + ", Assignee: " + task.getAssignee());
        }
        List<Task> customerTasks = taskService.createTaskQuery().taskCandidateGroup("Customers").list();
        System.out.println("查询当前客户组任务：");
        for (Task task: customerTasks) {
            System.out.println("  " + task.getId() + ": " + task.getName());
        }
        List<Task> staffTasks = taskService.createTaskQuery().taskCandidateGroup("Staff").list();
        System.out.println("查询当前工作人员组任务：");
        for (Task task: staffTasks) {
            System.out.println("  " + task.getId() + ": " + task.getName());
        }
    }

    /** 删除所有流程实例 */
    @Test
    public void deleteProcessInstance() {
        HistoryService historyService = processEngine.getHistoryService();
        List<HistoricProcessInstance> historicProcessInstance = historyService.createHistoricProcessInstanceQuery().list();
        for (HistoricProcessInstance hpi: historicProcessInstance) {
            String processInstanceId = hpi.getId();
            ProcessInstance processInstance = processEngine.getRuntimeService()
                    .createProcessInstanceQuery().processInstanceId(processInstanceId).singleResult();
            if (processInstance == null) // 该流程实例已经完成
                historyService.deleteHistoricProcessInstance(processInstanceId);
            else { // 该流程实例未结束
                processEngine.getRuntimeService().deleteProcessInstance(processInstanceId,"");
                historyService.deleteHistoricProcessInstance(processInstanceId);
            }
        }
    }

}
