package com.example.stc.framework.util;

import com.example.stc.activiti.STCProcessEngine;
import com.example.stc.service.UserService;
import org.activiti.engine.IdentityService;
import org.activiti.engine.identity.Group;
import org.activiti.engine.identity.User;
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
    private void initGroup() {
        System.out.println("initGroup");
        List<com.example.stc.domain.User> users = userService.findAllUsers();
        List<Group> groups = identityService.createGroupQuery().orderByGroupId().asc().list();
        for (Group group: groups) {
            /** 更新用户组 */
            System.out.println("Group: " + group.getId());
            for (com.example.stc.domain.User user: users) {
                System.out.println("User: " + user.getUsername() + user.getUserID());
                if (user.getRoles().contains(group.getId())) {
                    /** 用户在组内，建立映射 */
                    identityService.createMembership(user.getUserID(), group.getId());
                }
            }
        }
    }

    /**
     * 判断某个用户是否在某个工作组内
     * @param group
     * @param userId
     * @return
     */
    public boolean checkUser(String group, String userId) {
        System.out.println("Group: " + group + ", uid: " + userId);
        List<User> users = identityService.createUserQuery().memberOfGroup(group).list();
        if (users.isEmpty()) {
            /** 根据当前用户数据库在组内动态更新用户组 */
            initGroup();
        }

        List<Group> groups = identityService.createGroupQuery().groupMember(userId).list();
        return groups.contains(identityService.createGroupQuery().groupId(group).singleResult());
    }

}
