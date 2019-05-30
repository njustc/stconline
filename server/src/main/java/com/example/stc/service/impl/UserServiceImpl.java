package com.example.stc.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.example.stc.repository.RoleRepository;
import com.example.stc.repository.UserRepository;
import com.example.stc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.stc.domain.*;
import com.example.stc.framework.exception.*;

import java.util.ArrayList;
import java.util.List;


public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

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

        String username = params.getString("username");

        JSONArray roleIds = params.getJSONArray("roleIds");
        if(roleIds != null) {
            List<Role> roles = new ArrayList<Role>();

            for(int i = 0; i < roleIds.size(); i++) {
                Long roleId = roleIds.getLong(i);
                Role role = roleRepository.findById(roleId)
                        .orElseThrow(() -> new RoleNotFoundException(roleId));
                roles.add(role);
            }

            userToEdit.setRoles(roles);
        }
        userToEdit.setUsername(user.getUsername());
        userToEdit.setId(user.getId());
        userRepository.save(userToEdit);
    }

    @Override
    public User newUser(User user){
        return userRepository.save(user);
    }
}
