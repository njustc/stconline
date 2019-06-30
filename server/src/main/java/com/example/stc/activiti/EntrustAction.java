package com.example.stc.activiti;

import com.alibaba.fastjson.JSONObject;
import com.example.stc.domain.Entrust;
import com.example.stc.domain.Role;
import com.example.stc.domain.User;
import com.example.stc.framework.util.AuthorityUtils;
import com.example.stc.service.EntrustService;
import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class EntrustAction {

    private static final String REVIEW = "reviewEntrustResult";
    private static final String COMMENT = "reviewEntrustComment";

    @Autowired
    private STCProcessEngine stcProcessEngine;

    @Autowired
    private TaskService taskService;

    @Autowired
    private AuthorityUtils authorityUtils;

    /**
     * 检查是否为客户本人的委托，参见EntrustServiceImpl.java
     * @param entrust
     */
    private void customerAccessCheck(Entrust entrust) {
        boolean isCustomer = authorityUtils.hasAuthority(Role.Customer);
        if (isCustomer) {
            if (!entrust.getUser().getUsername().equals(authorityUtils.getLoginUser().getUsername()))
                throw new AccessDeniedException("没有查看权限，客户只能查看自己的委托");
        }
    }

    /**
     * 根据JSON数据创建Process
     * @param param
     * @param user
     */
    public void createEntrustProcess(JSONObject param, User user) {
        Entrust entrust = JSONObject.toJavaObject(param, Entrust.class);
        createEntrustProcess(entrust, user);
    }

    /**
     * 根据Entrust实体创建Process
     * @param entrust
     * @param user
     */
    public String createEntrustProcess(Entrust entrust, User user) {
        Map<String, Object> variable = new HashMap<String, Object>();
        variable.put("EntrustID", entrust.getPid());
        variable.put("ClientID", user.getUserID());

        /**
         * TODO: 根据具体的权限策略(Spring Security or Shiro?)从当前用户组中取出可以进行委托审核操作的工作人员组
         *       是否需要修改.bpmn.xml？工作人员组可能在流程创立之后发生变动，需要使用安全框架实时更新权限组，待研究
         */
//        variable.put("WorkerIDs", "w1");
//        variable.put("WorkerIDs", "w2");

        entrust.setProcessInstanceID(stcProcessEngine.createProcess("Entrust", variable));
        entrust.setProcessState(ProcessState.Review);
        return entrust.getProcessInstanceID();
    }

    /**
     * 获取EntrustProcess状态
     * @param processInstanceId
     * @return 状态信息
     */
    public String getEntrustProcessState(String processInstanceId) {
        return stcProcessEngine.getProcessState(processInstanceId);
    }

    /**
     * 提交Entrust对应流程
     * @param entrust
     */
    public void submitEntrustProcess(Entrust entrust) {
        User user = entrust.getUser();
        String processInstanceId = entrust.getProcessInstanceID();
        if (processInstanceId.equals("")) {
            createEntrustProcess(entrust, user);
        }
        else {
            Task task = taskService.createTaskQuery().processInstanceId(processInstanceId).singleResult();
            taskService.complete(task.getId());
        }

        entrust.setProcessState(getEntrustProcessState(processInstanceId));
    }

    /**
     * 评审Entrust，并给出具体意见
     * @param entrust
     * @param operation
     * @param comment
     */
    public void reviewEntrustProcess(Entrust entrust, String operation, String comment) {
        String processInstanceId = entrust.getProcessInstanceID();
        Task task = taskService.createTaskQuery().processInstanceId(processInstanceId).singleResult();
        User currentUser = authorityUtils.getLoginUser();
        taskService.setAssignee(task.getId(), currentUser.getUserID());
        Map<String, Object> value = new HashMap<>();
        value.put(REVIEW, operation);
        if (!comment.equals("")) {
            value.put(COMMENT, comment);
            entrust.setComment(comment);
        }
        taskService.complete(task.getId(), value);

        entrust.setProcessState(getEntrustProcessState(processInstanceId));
    }

    /**
     * 删除委托流程
     * @param entrust
     */
    public void deleteEntrustProcess(Entrust entrust) {
        String processInstanceId = entrust.getProcessInstanceID();
        if (!processInstanceId.equals(""))
            stcProcessEngine.deleteProcessInstance(processInstanceId);
    }

}
