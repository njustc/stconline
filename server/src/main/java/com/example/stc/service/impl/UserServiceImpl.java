package com.example.stc.service.impl;

import com.example.stc.domain.User;
import com.example.stc.repository.UserRepository;
import com.example.stc.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private PasswordEncoder passwordEncoder; //security提供的加密接口，先写着，等会配置

    @Autowired
    private UserRepository userRepository;

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public User addUser(User user) {
        if (user.getUsername() != null && user.getPassword() != null){

            System.out.println("Saved, id = " + user.getId());

            user.setPassword(passwordEncoder.encode(user.getPassword()));
            return userRepository.save(user);
        }

        System.out.println("Not Saved");

        return user;
    }
}
