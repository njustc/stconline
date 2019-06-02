package com.example.stc.service.impl;

import com.example.stc.domain.*;
import com.example.stc.framework.exception.*;
import com.example.stc.framework.util.DateUtils;
import com.example.stc.repository.UserRepository;
import com.example.stc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;

import java.util.Date;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private PasswordEncoder passwordEncoder; //security提供的加密接口，先写着，等会配置

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private DateUtils dateUtils;

    @Override
    public User getUserByUsername(String username)
    {
        return userRepository.findByUsername(username);
    }

    @Override
    public void deleteUserById(Long userId){
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new UserNotFoundException(userId));
        userRepository.deleteById(userId);
    }

    @Override
    public void editUser(JSONObject params, User user){
        Long userId = params.getLong("id");
        User userToEdit = userRepository.findById(userId)
                .orElseThrow(() -> new UserNotFoundException(userId));

        userToEdit.setUsername(user.getUsername());
        userToEdit.setId(user.getId());

        // 用户权限不可更改
        //userToEdit.setRoles(user.getRoles());

        userRepository.save(userToEdit);
    }

    @Override
    public User newUser(User user) {
        if (user.getUsername() != null && user.getPassword() != null){
            user.setPassword(passwordEncoder.encode(user.getPassword()));
            user.setUserID("u" + dateUtils.dateToStr(new Date(), "yyyyMMddHHmmss"));
            user.addRole(Role.USER.str()); // 都有用户权限
            return userRepository.save(user);
        }
        return null;
    }

    @Override
    public User findUserByUid(String uid) {
        return userRepository.findByUid(uid);
    }

    @Override
    public int deleteUserByUid(String uid) {
        return userRepository.deleteByUid(uid);
    }
}

