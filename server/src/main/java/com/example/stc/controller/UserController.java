package com.example.stc.controller;

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

    /** 用户注册 */
    @PostMapping("/api/register")
    public @ResponseBody
    User register(@RequestBody User user) {
        userService.newUser(user);
        return user;
    }

    /** DEBUG: 登录界面 */
    @GetMapping("/api/login")
    public String showLogin() {
        return "DEBUG: 用户登录";
    }

}
