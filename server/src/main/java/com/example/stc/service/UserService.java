package com.example.stc.service;

import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Service;
import com.example.stc.domain.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;


@Service
public interface UserService extends BaseService<User> {
    /**
     * 编辑用户信息
     *
     * @param params
     * @param user
     */
    //@Secured("ROLE_ADMIN")
    void editUser(JSONObject params, User user);

    /**
     * 删除用户
     *
     * @param userId
     */
    //@Secured("ROLE_ADMIN")
    void deleteUserById(Long userId);

    /**
     * 添加新用户
     *
     * @param user
     */
    User newUser(User user);

    /**
     * 查询User
     *
     * @param username
     * @return
     */
    User getUserByUsername(String username);

    /**
     * 根据用户uid查找用户
     *
     * @param uid
     * @return
     */
    User findUserByUid(String uid);

    /**
     * 根据用户角色查找用户
     *
     * @param role
     * @return
     */
    List<User> findUserByRoles(String role);

    /**
     * 根据用户uid删除用户
     *
     * @param uid
     * @return
     */
    int deleteUserByUid(String uid);

    String userLogin(User user, HttpServletResponse response);

    List<User> findAllUsers();

    String userLogout(HttpServletResponse response, HttpServletRequest request);

    User getCurrentUser();
}
