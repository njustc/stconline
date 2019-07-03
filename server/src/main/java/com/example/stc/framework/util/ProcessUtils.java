package com.example.stc.framework.util;

import com.example.stc.activiti.ProcessService;
import com.example.stc.activiti.STCProcessEngine;
import com.example.stc.domain.ProcessEntity;
import com.example.stc.domain.User;
import com.example.stc.service.UserService;
import org.activiti.engine.*;
import org.activiti.engine.form.FormProperty;
import org.activiti.engine.form.TaskFormData;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.identity.Group;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.IdentityLink;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Iterator;
import java.util.List;

/**
 * 流程引擎辅助工具类
 */
@Component
public class ProcessUtils {

    @Autowired
    private RuntimeService runtimeService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private HistoryService historyService;

    @Autowired
    private IdentityService identityService;

    @Autowired
    private UserService userService;

    @Autowired
    private FormService formService;

    /**
     * 根据具体流程实例的ID获取其在流程中的状态
     * @param processInstanceId 流程实例ID
     * @return 以String形式返回流程实例的状态
     * // @throws Exception 获取流程实例状态失败
     */
    public String getProcessState(String processInstanceId) {
        if (processInstanceId.equals("")) {
            return "Submit";
        }

        ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId)
                .singleResult();
        List<HistoricActivityInstance> piHistory = historyService.createHistoricActivityInstanceQuery()
                .processInstanceId(processInstanceId).list();
        if (pi == null && !piHistory.isEmpty()) {
            return "Approve";
        }
        else if (pi != null) {
            List<Task> tasks = taskService.createTaskQuery().processInstanceId(processInstanceId).list();
            if (tasks.size() > 1) {
                return "Review";
            }
            else {
                Task task = taskService.createTaskQuery().processInstanceId(processInstanceId).singleResult();
                TaskFormData taskFormData = formService.getTaskFormData(task.getId());
                List<FormProperty> formProperties = taskFormData.getFormProperties();
                for (FormProperty formProperty: formProperties) {
                    if (formProperty.getId().equals("taskType")) {
                        return formProperty.getValue();
                    }
                }
                return "NotExist";
            }
        } else {
            return "NotExist";
        }
    }

    /**
     * 加载时更新用户组
     */
    private void initGroup(String group) {
        List<User> users = userService.findUserByRoles(group);
        Group gr = identityService.newGroup(group);
        identityService.saveGroup(gr);
        for (User user : users) {
            org.activiti.engine.identity.User u = identityService.newUser(user.getUserID());
            u.setPassword(user.getPassword());
            identityService.saveUser(u);
            identityService.createMembership(user.getUserID(), gr.getId());
        }
    }

    /**
     * 判断某个用户是否在某个工作组内
     * @param group
     * @param userId
     * @return
     */
    public boolean checkUser(String group, String userId) {
        Group gr = identityService.createGroupQuery().groupId(group).singleResult();
        if (gr == null) {
            /** 根据当前用户数据库在组内动态更新用户组 */
            initGroup(group);
        }

        List<Group> groups = identityService.createGroupQuery().groupMember(userId).list();
        Group curGroup = identityService.createGroupQuery().groupId(group).singleResult();
        for (Group group1: groups) {
            if (group1.getId().equals(curGroup.getId()))
                return true;
        }
        return false;
    }

    public boolean checkUser(Task task, String userId) {
        boolean result = false;
        List identityLinkList = taskService.getIdentityLinksForTask(task.getId());
        if (identityLinkList != null && identityLinkList.size() > 0) {
            for (Iterator iterator = identityLinkList.iterator(); iterator.hasNext(); ) {
                IdentityLink identityLink = (IdentityLink)iterator.next();
                if (identityLink.getUserId() != null) {
                    result |= (userId.equals(identityLink.getUserId()));
                }
                else if (identityLink.getGroupId() != null) {
                    result |= checkUser(identityLink.getGroupId(), userId);
                }
            }
        }
        return result;
    }

    /**
     * 判断当前任务是否正确
     * @param processInstanceId
     * @param processState
     * @return
     */
    public boolean checkTask(String processInstanceId, String processState) {
        return (processState.equals(getProcessState(processInstanceId)));
    }

}
