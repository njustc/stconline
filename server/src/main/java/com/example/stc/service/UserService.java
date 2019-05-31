package com.example.stc.service;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.stc.domain.*;
import com.example.stc.repository.*;


@Service
public interface UserService extends BaseService<User>{
    /**
     * 编辑用户信息
     * @param params
     * @param user
     */
    public void editUser(JSONObject params, User user);

    /**
     * 删除用户
     * @param userId
     */
    public void deleteUserById(Long userId);

    /**
     * 添加新用户
     * @param user
     */
    public User newUser(User user);

    /**
     * 查询User
     * @param username
     * @return
     */
    public User getUserByUsername(String username);
}
