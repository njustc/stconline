package com.example.stc.repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Repository;


import com.example.stc.domain.User;
import org.springframework.transaction.annotation.Transactional;

/**
 * 账号的仓库接口类
 */
@Repository
public interface UserRepository extends BaseRepository<User> {
    /**
     * 通过用户名查找对应的账号
     * @param username 待查询的账号的用户名
     * @return 对应的账号
     */
    User findByUsername(String username);

    User findByUid(String uid);

    @Modifying(flushAutomatically = true)
    @Transactional
    int deleteByUid(String uid);

}
