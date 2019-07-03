package com.example.stc.controller;

import com.example.stc.domain.Contract;
import com.example.stc.domain.Entrust;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureWebMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

/**
 * 合同相关测试用例
 */
@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureWebMvc
@AutoConfigureMockMvc
public class ContractControllerTest {
    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private ContractController contractController;

    @Test
    public void notNull() {
        assertThat(contractController).isNotNull();
        assertThat(mockMvc).isNotNull();
    }

    /**
     * 合同查询
     * 指定查询者为CUSA
     */
    @Test
    @WithMockUser(username = "CUSA", password = "cusa", roles = {"CUS", "USER"})
    public void getAllEntrustTest() throws Exception {
        Resources<Resource<Contract>> resources = contractController.getAllContract();
        assertThat(resources).isNotNull();
    }


}
