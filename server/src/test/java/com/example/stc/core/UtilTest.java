package com.example.stc.core;

import com.example.stc.framework.util.SessionUtils;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.servlet.http.HttpSession;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

/**
 * 工具类测试
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class UtilTest {
    @Autowired
    private SessionUtils sessionUtils;

    @Test
    public void sessionTest() {
        assertThat(sessionUtils).isNotNull();
        assertThat(sessionUtils.getRequest()).isNotNull();
        HttpSession session = sessionUtils.getSession();
        assertThat(session).isNull();
    }
}
