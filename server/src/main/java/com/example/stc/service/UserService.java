package com.example.stc.service;

import com.example.stc.domain.User;
import org.springframework.stereotype.Service;

public interface UserService extends BaseService<User> {

    public User findByUsername(String username);

    public User addUser(User user);

}
