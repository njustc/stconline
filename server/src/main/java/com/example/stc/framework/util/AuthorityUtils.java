package com.example.stc.framework.util;

import com.example.stc.domain.Role;
import com.example.stc.domain.User;
import com.example.stc.repository.UserRepository;
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

    @Autowired
    private UserRepository userRepository;

    /** 获取当前登录的用户 */
    public User getLoginUser() {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();
        User user = userRepository.findByUsername(userDetails.getUsername());
        return user;
    }

    /** @param role 为Role枚举类型对应的String */
    public boolean hasAuthority(Role role) {

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
        return isRole;
    }

    /** 检查仅Role具有的权限 */
    public void roleAccessCheck(Role role) {
        if (!hasAuthority(role))
            throw new AccessDeniedException("不是" + role.str() + "，没有访问权限");
    }
}
