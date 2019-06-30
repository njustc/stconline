package com.example.stc.framework.util;

import com.example.stc.domain.Role;
import com.example.stc.domain.User;
import com.example.stc.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
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

    /** 判断当前是否有用户登录 */
    public boolean isAuthenticated() {
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

        logger.info("Get Authenticated User: " + user.getUsername());

        return user;
    }

    /** @param role 为Role枚举类型对应的String */
    public boolean hasAuthority(Role role) {
        if (!isAuthenticated())
            return false; // 未登录

        // 获得当前登陆用户对应的对象
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();
        // 获取权限集
        List<GrantedAuthority> authorList = new ArrayList<>(userDetails.getAuthorities());

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
}
