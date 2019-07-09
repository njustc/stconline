package com.example.stc.framework.util;

import com.example.stc.activiti.ProcessState;
import com.example.stc.domain.ProcessEntity;
import com.example.stc.domain.Role;
import com.example.stc.domain.User;
import com.example.stc.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.context.SecurityContextImpl;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * 用于判断用户是否具有某一权限
 */
@Component
public class AuthorityUtils {

    Logger logger = LoggerFactory.getLogger(AuthorityUtils.class);

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProcessUtils processUtils;

    /** 判断当前是否有用户登录 */
    public boolean isAuthenticated() {
        if (SecurityContextHolder.getContext().getAuthentication() == null)
            return false;
        boolean isAuth = SecurityContextHolder.getContext().getAuthentication().isAuthenticated();
        if (!isAuth)
            logger.info("Not Authenticated");
        else logger.info("Authenticated");
        return isAuth;
    }

    /** 获取当前登录的用户 */
    public User getLoginUser() {
        if (!isAuthenticated())
            return null; // 未登录
        User user = userRepository.findByUsername(SecurityContextHolder.getContext()
                .getAuthentication().getName());
        logger.info("getLoginUser: id = " + user.getUserID() + ", name = " + user.getUsername() +
                ", roles = " + user.getRoles());
        return user;
    }

    /** @param role 为Role枚举类型对应的String */
    public boolean hasAuthority(Role role) {
        if (!isAuthenticated())
            return false; // 未登录

        // 获取权限集
        List<GrantedAuthority> authorList = new ArrayList<>(SecurityContextHolder.getContext()
                .getAuthentication().getAuthorities());

        // 判断是否具有role角色
        boolean isRole = false;
        for (GrantedAuthority author: authorList) {
            if (author.getAuthority().equals("ROLE_" + role.str()))
                isRole = true;
        }

        logger.info("Authenticated User has role " + role.str());

        return isRole;
    }

    /** 检查仅Role具有的权限 */
    public void roleAccessCheck(Role role) {
        if (!hasAuthority(role))
            throw new AccessDeniedException("不是" + role.str() + "，没有访问权限");
    }

    /** 对于Role，若ProcessEntity在state（Submit/Review/Approve）阶段应当具有访问（查看，修改，删除）权限，返回当前是否具有权限 */
    public void stateAccessCheck(ProcessEntity entity, String roles, String states, String msg) {
        String[] roleStrs = roles.split(",");
        boolean isRole = false;
        User curUser = this.getLoginUser();
        for (String role: roleStrs) {
            if (curUser.getRoles().contains(role))
                isRole = true;
        }
        if (isRole) {
            String[] stateStrs = states.split(",");
            boolean isState = false;
            for (String state: stateStrs) {
                if (state.equals(processUtils.getProcessState(entity.getProcessInstanceId())))
                    isState = true;
            }
            if (isState)
                logger.info("stateAccessCheck: 当前用户（" + curUser.getRoles() + "）具有" + msg + "权限");
            else {
                logger.info("stateAccessCheck: 当前用户（" + curUser.getRoles() + "）没有" + msg + "权限");
                throw new AccessDeniedException("stateAccessCheck: 当前用户（" + curUser.getRoles() + "）没有" + msg + "权限");
            }
        }
    }

    /** 对于客户，只能访问自己的委托、合同等，若不是则权限异常 */
    public void customerAccessCheck(ProcessEntity entity) {
        if (this.hasAuthority(Role.Customer)) {
            if (!entity.getUserId().equals(this.getLoginUser().getUserID())) {
                logger.info("customerAccessCheck: 没有权限，客户只能访问自己的项目");
                throw new AccessDeniedException("没有权限，客户只能访问自己的项目");
            }
        }
    }

}
