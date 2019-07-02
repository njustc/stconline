package com.example.stc.framework.util;

import com.example.stc.activiti.STCProcessEngine;
import com.example.stc.domain.User;
import com.example.stc.service.UserService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.identity.Group;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * 流程引擎辅助工具类
 */
@Component
public class ProcessUtils {

    @Autowired
    private IdentityService identityService;

    @Autowired
    private UserService userService;

    @Autowired
    private STCProcessEngine stcProcessEngine;

    /**
     * 检查Task是否对应
     * @param task
     * @param taskName
     */
    public void checkTask(Task task, String taskName) {
        if (!task.getName().equals(taskName)) {
            // TODO: 抛出异常
        }
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
        System.out.println("\n\n" + group + "\n\n");
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

}
