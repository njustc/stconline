package com.example.stc.controller;

import com.example.stc.domain.Role;
import com.example.stc.domain.User;
import com.example.stc.framework.exception.EntrustNotFoundException;
import com.example.stc.framework.exception.UserNotFoundException;
import com.example.stc.framework.util.AuthorityUtils;
import com.example.stc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import static org.springframework.security.web.context.HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY;

@RestController
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private AuthorityUtils authorityUtils;

    @Resource(name = "authenticationManager")
    private AuthenticationManager authManager;

    /**
     * 用户基本信息
     */
    @GetMapping("/api/userdetail/{uid}")
    public User getUserDetail(@PathVariable String uid) {
        User user = userService.findUserByUid(uid);
        if (user == null)
            throw new UserNotFoundException(uid);
        return user;
    }

    /**
     * DEBUG: 注册界面
     */
    @GetMapping("/api/register")
    public String showRegister() {


        return "DEBUG: 用户注册，请Post";
    }

    /**
     * DEBUG: 登录界面
     */
    @PostMapping("/api/login")
    public String userLogin(HttpServletRequest req,
                            HttpServletResponse response,
                            @RequestBody User user) {
        //TODO: 将具体逻辑加入到service层
        UsernamePasswordAuthenticationToken authReq
                = new UsernamePasswordAuthenticationToken(user.getUsername(),
                user.getPassword());
        Authentication auth = authManager.authenticate(authReq);
        SecurityContext sc = SecurityContextHolder.getContext();
        sc.setAuthentication(auth);
        HttpSession session = req.getSession(true);

        //add cookie
        Cookie cookie = new Cookie("roles",authorityUtils.getLoginUser().getRoles()); // 创建新cookie
        cookie.setMaxAge(60 * 60); // 设置存在时间60min
        cookie.setPath("/"); // TODO: 设置作用域
        response.addCookie(cookie); // 将cookie添加到response的cookie数组中返回给客户端

        session.setAttribute(SPRING_SECURITY_CONTEXT_KEY, sc);
        return "DEBUG: 用户登录";
    }

    /**
     * 客户注册
     */
    @PostMapping("/api/register/customer")
    public @ResponseBody
    User registerCustomer(@RequestBody User user) {
        user.addRole(Role.Customer.str());
        user.addRole(Role.USER.str());
        userService.newUser(user);
        return user;
    }

    /**
     * 市场部工作人员注册
     */
    @PostMapping("/api/register/salesStaff")
    public @ResponseBody
    User registerSalesStaff(@RequestBody User user) {
        user.addRole(Role.SalesStaff.str());
        user.addRole(Role.USER.str());
        userService.newUser(user);
        return user;
    }

    /**
     * 市场部经理注册
     */
    @PostMapping("/api/register/salesManager")
    public @ResponseBody
    User registerSalesManager(@RequestBody User user) {
        user.addRole(Role.SalesManager.str());
        user.addRole(Role.USER.str());
        userService.newUser(user);
        return user;
    }

    /**
     * 测试部工作人员注册
     */
    @PostMapping("/api/register/testStaff")
    public @ResponseBody
    User registerTestStaff(@RequestBody User user) {
        user.addRole(Role.TestStaff.str());
        user.addRole(Role.USER.str());
        userService.newUser(user);
        return user;
    }

    /**
     * 测试部经理注册
     */
    @PostMapping("/api/register/testManager")
    public @ResponseBody
    User registerTestManager(@RequestBody User user) {
        user.addRole(Role.TestManager.str());
        user.addRole(Role.USER.str());
        userService.newUser(user);
        return user;
    }

    /**
     * 质量部经理注册
     */
    @PostMapping("/api/register/qualityManager")
    public @ResponseBody
    User registerQualityManager(@RequestBody User user) {
        user.addRole(Role.QualityManager.str());
        user.addRole(Role.USER.str());
        userService.newUser(user);
        return user;
    }

    /**
     * 超级管理员注册
     */
    @PostMapping("/api/register/admin")
    public @ResponseBody
    User registerAdmin(@RequestBody User user) {
        user.addRole(Role.Admin.str());
        userService.newUser(user);
        return user;
    }

}
