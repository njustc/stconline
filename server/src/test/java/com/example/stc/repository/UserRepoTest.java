package com.example.stc.repository;

import com.example.stc.domain.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

/**
 * 用户实体测试类
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class UserRepoTest {
    @Autowired
    private UserRepository userRepository;

    @Test
    public void notNull() {
        assertThat(userRepository).isNotNull();
    }

    @Test
    public void functionTest() {
        User user = new User();
        user.setUsername("user");
        user.setPassword("psw");
        User newRecord = userRepository.save(user);
        User fetchRecord = userRepository.findByUsername(user.getUsername());
        assertThat(fetchRecord).isEqualTo(fetchRecord);

        userRepository.deleteByUid(newRecord.getUserID());
    }
}
