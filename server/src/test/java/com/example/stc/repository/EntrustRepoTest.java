package com.example.stc.repository;

import com.example.stc.domain.Entrust;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

/**
 * 委托实体数据访问测试
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class EntrustRepoTest {
    @Autowired
    private EntrustRepository entrustRepository;

    @Test
    public void notNull() {
        assertThat(entrustRepository).isNotNull();
    }

    @Test
    public void functionTest() {
        Entrust entrust = new Entrust();
        entrust.setPid("pid");
        entrust.setVersion("version");
        //保存至db
        entrustRepository.save(entrust);
        //根据pid 获取
        Entrust fetchRecord = entrustRepository.findByPid("pid");
        //判定对象的price是否相同
        assertThat(fetchRecord.getVersion())
                .isEqualTo("version");
        //delete
        assertThat(entrustRepository.deleteByPid("pid")).isEqualTo(1);
    }
}
