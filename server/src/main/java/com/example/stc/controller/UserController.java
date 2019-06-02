package com.example.stc.controller;

import com.example.stc.domain.Role;
import com.example.stc.domain.User;
import com.example.stc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
public class UserController {

    @Autowired
    private UserService userService;

    /** DEBUG: 注册界面 */
    @GetMapping("/api/register")
    public String showRegister() {
        return "DEBUG: 用户注册，请Post";
    }

    /** DEBUG: 登录界面 */
    @GetMapping("/api/login")
    public String showLogin() {
        return "DEBUG: 用户登录";
    }

    /** 客户注册 */
    @PostMapping("/api/register/customer")
    public @ResponseBody
    User registerCustomer(@RequestBody User user) {
        user.setRoles(Role.Customer.str());
        userService.newUser(user);
        return user;
    }

    /** 市场部工作人员注册 */
    @PostMapping("/api/register/salesStaff")
    public @ResponseBody
    User registerSalesStaff(@RequestBody User user) {
        user.setRoles(Role.SalesStaff.str());
        userService.newUser(user);
        return user;
    }

    /** 市场部经理注册 */
    @PostMapping("/api/register/salesManager")
    public @ResponseBody
    User registerSalesManager(@RequestBody User user) {
        user.setRoles(Role.SalesManager.str());
        userService.newUser(user);
        return user;
    }

    /** 测试部工作人员注册 */
    @PostMapping("/api/register/testStaff")
    public @ResponseBody
    User registerTestStaff(@RequestBody User user) {
        user.setRoles(Role.TestStaff.str());
        userService.newUser(user);
        return user;
    }

    /** 测试部经理注册 */
    @PostMapping("/api/register/testManager")
    public @ResponseBody
    User registerTestManager(@RequestBody User user) {
        user.setRoles(Role.TestManager.str());
        userService.newUser(user);
        return user;
    }

    /** 质量部经理注册 */
    @PostMapping("/api/register/qualityManager")
    public @ResponseBody
    User registerQualityManager(@RequestBody User user) {
        user.setRoles(Role.QualityManager.str());
        userService.newUser(user);
        return user;
    }

    /** 超级管理员注册 */
    @PostMapping("/api/register/admin")
    public @ResponseBody
    User registerAdmin(@RequestBody User user) {
        user.setRoles(Role.Admin.str());
        userService.newUser(user);
        return user;
    }

}
