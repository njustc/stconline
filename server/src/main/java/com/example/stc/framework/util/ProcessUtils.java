package com.example.stc.framework.util;

import com.alibaba.fastjson.JSON;
import com.example.stc.domain.ProcessEntity;
import com.example.stc.domain.User;
import com.example.stc.service.UserService;
import org.activiti.engine.*;
import org.activiti.engine.form.FormProperty;
import org.activiti.engine.form.TaskFormData;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.identity.Group;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.IdentityLink;
import org.activiti.engine.task.Task;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import sun.rmi.runtime.Log;

import java.util.Iterator;
import java.util.List;

/**
 * 流程引擎辅助工具类
 */
@Component
public class ProcessUtils {

    Logger logger = LoggerFactory.getLogger(ProcessUtils.class);

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

    @Autowired
    private AuthorityUtils authorityUtils;

    /**
     * 根据具体流程实例的ID获取其在流程中的状态
     * @param processInstanceId 流程实例ID
     * @return 以String形式返回流程实例的状态
     * // @throws Exception 获取流程实例状态失败
     */
    public String getProcessState(String processInstanceId) {
        if (processInstanceId == null || processInstanceId.equals("")) {
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
                        return formProperty.getName();
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
            org.activiti.engine.identity.User searchUser = identityService.createUserQuery().userId(user.getUserID()).singleResult();
            if (searchUser == null) {
                org.activiti.engine.identity.User u = identityService.newUser(user.getUserID());
                identityService.saveUser(u);
            }
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

    /**
     * 判断某个用户是否能够执行某个任务
     * @param task
     * @param userId
     * @return
     */
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

    /**
     * 判断当前用户是否可以对当前实例进行评审
     * @param processInstanceId
     * @param userId
     * @return
     */
    public boolean isReviewable(String processInstanceId, String userId) {
        boolean result = false;
        List<Task> tasks = taskService.createTaskQuery().processInstanceId(processInstanceId).list();
        for (Task task : tasks) {
            result |= checkUser(task, userId);
        }
        return result;
    }

    private boolean isCreator(ProcessEntity entity, String type) {
        User user = authorityUtils.getLoginUser();
        String userId = user.getUserID();

        /** 创建者判断，对于创建实例的用户，在流程全程都能看到 */
        switch (type) {
            case "Entrust":
                return userId.equals(entity.getUserId());
            case "Contract":
                return checkUser("SS", userId);
            case "TestPlan":
            case "TestRecord":
            case "TestReport":
                return checkUser("TS", userId);
            default:
                return false;
        }
    }

    /**
     * 判断当前实例是否对当前用户可见
     * @param entity
     * @param type
     * @return
     */
    public boolean isVisible(ProcessEntity entity, String type) {
        User user = authorityUtils.getLoginUser();
        String userId = user.getUserID();
        String processInstanceId = entity.getProcessInstanceId();

        if (isCreator(entity, type))
            return true;

        String processState = getProcessState(processInstanceId);
        switch (processState) {
            case "Submit":
                /**
                 * 提交阶段，此时能见者为：规定能够建立该流程的人；先前的创建者判断已筛选，故此处必不为能见者
                 */
                return false;
            case "Review":
                /**
                 * 审核阶段，此时能见者为：①当前任务的预定执行者；②历史任务的执行者（自从上一次Submit之后）
                 */
                if (isReviewable(processInstanceId, userId))
                    return true;
                List<HistoricTaskInstance> historicTaskInstances = historyService.createHistoricTaskInstanceQuery()
                        .processInstanceId(processInstanceId)
                        .orderByHistoricTaskInstanceStartTime()
                        .desc().list();
                for (HistoricTaskInstance historicTaskInstance: historicTaskInstances) {
                    String name = historicTaskInstance.getName();
                    if (name.contains("Submit")) {
                        break;
                    }
                    List<Group> groups = identityService.createGroupQuery().groupMember(userId).list();
                    for (Group group: groups) {
                        if (name.contains(group.getId())) {
                            return true;
                        }
                    }
                }
                return false;
            case "Approve":
                /**
                 * 评审通过，此时能见者为：所有工作人员
                 */
                return checkUser("STAFF", userId) || (userId.equals(entity.getUserId()));
            default:
                return false;
        }
    }

    /**
     * 判断某个实体是否为当前用户的待办事项
     * @param entity
     * @param type
     * @return
     */
    public boolean isTodo(ProcessEntity entity, String type) {
        User user = authorityUtils.getLoginUser();
        String userId = user.getUserID();
        String processInstanceId = entity.getProcessInstanceId();
        String processState = getProcessState(processInstanceId);

        switch (processState) {
            case "Approve": return false;
            case "Review": return isReviewable(processInstanceId, userId);
            case "Submit": return isCreator(entity, type);
            default: return false;
        }
    }

}
