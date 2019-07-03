package com.example.stc.repository;

import com.example.stc.domain.Contract;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

/**
 * 合同实体数据访问测试
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class ContractRepoTest {
    @Autowired
    private ContractRepository contractRepository;

    @Test
    public void notNull() {
        assertThat(contractRepository).isNotNull();
    }

    @Test
    public void functionTest() {
        Contract contract = new Contract();
        contract.setPid("pid");
        contract.setPrice("price");
        //保存至db
        contractRepository.save(contract);
        //根据pid 获取
        Contract fetchRecord = contractRepository.findByPid("pid");
        //判定对象的price是否相同
        assertThat(fetchRecord.getPrice())
                .isEqualTo("price");
        //delete
        assertThat(contractRepository.deleteByPid("pid")).isEqualTo(1);
    }
}
