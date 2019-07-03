package com.example.stc.activiti;

import com.example.stc.controller.ContractController;
import com.example.stc.controller.UserController;
import com.example.stc.domain.Contract;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureWebMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

/**
 * 委托流程引擎测试
 */
@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureWebMvc
@AutoConfigureMockMvc
public class ContractActivitiTest {
    @Autowired
    private MockMvc mockMvc;
    @Autowired
    private ContractController contractController;
    @Autowired
    private UserController userController;

    /**
     * 合同相关的增删改查测试
     */
    @Test
    @WithMockUser(username = "TSA", password = "tsa", roles = {"USER", "USER", "SS"})
    public void NewRepDelTest() throws Exception {
        Contract contract = new Contract();     //新建合同
        contract.setPid("pid");
        contract.setProcessInstanceId("");
        contract.setPrice("3");
        //add
        contractController.addNewContract(contract);
        contract =
                contractController.getOneContract(contract.getPid()).getContent();
        assertThat(contract).isNotNull();
        assertThat(contract.getPrice()).isEqualTo("3");
        //modify
        contract.setPrice("4");
        contractController.replaceContract(contract.getPid(),
                contract);
        contract =
                contractController.getOneContract(contract.getPid()).getContent();
        assertThat(contract).isNotNull();
        assertThat(contract.getPrice()).isEqualTo("4");
        //delete
        contractController.deleteContract(contract.getPid());
    }
}
