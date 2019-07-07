package com.example.stc.activiti;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.stc.controller.EntrustController;
import com.example.stc.domain.*;
import com.example.stc.framework.core.web.Response;
import com.example.stc.framework.util.ProcessUtils;
import com.example.stc.repository.UserRepository;
import com.example.stc.service.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureWebMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.hateoas.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;

import java.util.HashMap;
import java.util.Map;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;


@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureWebMvc
@AutoConfigureMockMvc
public class ProcessTest {

    private String userId;
    private String pid;

    @Autowired
    private EntrustService entrustService;

    @Autowired
    private ContractService contractService;

    @Autowired
    private TestPlanService testPlanService;

    @Autowired
    private TestRecordService testRecordService;

    @Autowired
    private TestReportService testReportService;

    @Autowired
    private ProcessInstanceController processInstanceController;

    @Before
    public void before() {
        userId = "u20190609235999";
        /** 创建委托 */
        Entrust entrust = new Entrust();
        entrust.setUserId(userId);
        entrust = entrustService.newEntrust(entrust);
        pid = entrust.getPid();
    }

    @Test
    @WithMockUser(username = "BOSS", password = "boss")
    public void testProcess() throws Exception {
        /** 账号：用于测试的全权限账号 */

        /** 委托流程 */

        /** CUS第一次提交委托 */
        processInstanceController.createProcessInstance(pid, "Entrust");
        Entrust entrust = entrustService.findEntrustByPid(pid);
        assertThat(entrust.getProcessInstanceId()).isNotEqualTo("");
        assertThat(entrust.getProcessState()).isEqualTo(ProcessState.Review);

        /** SS审批不通过 */
        entrust.setOperation("ReviewDisprove");
        entrust.setComment("我觉得不行");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(entrust), "Entrust");
        entrust = entrustService.findEntrustByPid(pid);
        assertThat(entrust.getProcessState()).isEqualTo(ProcessState.Submit);
        assertThat(entrust.getComment()).isEqualTo("我觉得不行");

        /** CUS第二次提交委托 */
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(entrust), "Entrust");
        entrust = entrustService.findEntrustByPid(pid);
        assertThat(entrust.getProcessState()).isEqualTo(ProcessState.Review);

        /** SS审批通过 */
        entrust.setOperation("ReviewPass");
        entrust.setComment("我觉得可以");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(entrust), "Entrust");
        entrust = entrustService.findEntrustByPid(pid);
        assertThat(entrust.getProcessState()).isEqualTo(ProcessState.Approve);
        assertThat(entrust.getComment()).isEqualTo("我觉得可以");

        /** 合同流程（合同为自动创建） */
        Contract contract = contractService.findContractByPid(pid);
        assertThat(contract.getUserId()).isEqualTo(userId);

        /** SS第一次提交合同 */
        processInstanceController.createProcessInstance(pid, "Contract");
        contract = contractService.findContractByPid(pid);
        assertThat(contract.getProcessInstanceId()).isNotEqualTo("");
        assertThat(contract.getProcessState()).isEqualTo(ProcessState.Review);

        /** SM审核通过 */
        contract.setOperation("ReviewPass");
        contract.setComment("我觉得可以");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(contract), "Contract");
        contract = contractService.findContractByPid(pid);
        assertThat(contract.getProcessState()).isEqualTo(ProcessState.Review);
        assertThat(contract.getComment()).isEqualTo("我觉得可以");

        /** QM审核不通过 */
        contract.setOperation("ReviewDisprove");
        contract.setComment("我觉得不行");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(contract), "Contract");
        contract = contractService.findContractByPid(pid);
        assertThat(contract.getProcessState()).isEqualTo(ProcessState.Submit);
        assertThat(contract.getComment()).isEqualTo("我觉得不行");

        /** SS第二次提交 */
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(contract), "Contract");
        contract = contractService.findContractByPid(pid);
        assertThat(contract.getProcessState()).isEqualTo(ProcessState.Review);

        /** 审核通过×3 */
        contract.setOperation("ReviewPass");
        contract.setComment("我觉得可以");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(contract), "Contract");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(contract), "Contract");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(contract), "Contract");
        contract = contractService.findContractByPid(pid);
        assertThat(contract.getProcessState()).isEqualTo(ProcessState.Approve);
        assertThat(contract.getComment()).isEqualTo("我觉得可以");

        /** 测试方案流程 */
        TestPlan testPlan = testPlanService.findTestPlanByPid(pid);
        assertThat(testPlan.getUserId()).isEqualTo(userId);

        /** TS第一次提交 */
        processInstanceController.createProcessInstance(pid, "TestPlan");
        testPlan = testPlanService.findTestPlanByPid(pid);
        assertThat(testPlan.getProcessInstanceId()).isNotEqualTo("");
        assertThat(testPlan.getProcessState()).isEqualTo(ProcessState.Review);

        /** QM审核不通过 */
        testPlan.setOperation("ReviewDisprove");
        testPlan.setComment("我觉得不行");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(testPlan), "TestPlan");
        testPlan = testPlanService.findTestPlanByPid(pid);
        assertThat(testPlan.getProcessState()).isEqualTo(ProcessState.Submit);
        assertThat(testPlan.getComment()).isEqualTo("我觉得不行");

        /** TS第二次提交 */
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(testPlan), "TestPlan");
        testPlan = testPlanService.findTestPlanByPid(pid);
        assertThat(testPlan.getProcessState()).isEqualTo(ProcessState.Review);

        /** 审核通过×2 */
        testPlan.setOperation("ReviewPass");
        testPlan.setComment("我觉得可以");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(testPlan), "TestPlan");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(testPlan), "TestPlan");
        testPlan = testPlanService.findTestPlanByPid(pid);
        assertThat(testPlan.getProcessState()).isEqualTo(ProcessState.Approve);
        assertThat(testPlan.getComment()).isEqualTo("我觉得可以");

        /** 测试报告流程 */
        TestReport testReport = testReportService.findTestReportByPid(pid);
        assertThat(testReport.getUserId()).isEqualTo(userId);

        /** TS第一次提交 */
        processInstanceController.createProcessInstance(pid, "TestReport");
        testReport = testReportService.findTestReportByPid(pid);
        assertThat(testReport.getProcessInstanceId()).isNotEqualTo("");
        assertThat(testReport.getProcessState()).isEqualTo(ProcessState.Review);

        /** TM审核不通过 */
        testReport.setOperation("ReviewDisprove");
        testReport.setComment("我觉得不行");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(testReport), "TestReport");
        testReport = testReportService.findTestReportByPid(pid);
        assertThat(testReport.getProcessState()).isEqualTo(ProcessState.Submit);
        assertThat(testReport.getComment()).isEqualTo("我觉得不行");

        /** TS第二次提交 */
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(testReport), "TestReport");
        testReport = testReportService.findTestReportByPid(pid);
        assertThat(testReport.getProcessState()).isEqualTo(ProcessState.Review);

        /** 审核通过×3 */
        testReport.setOperation("ReviewPass");
        testReport.setComment("我觉得可以");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(testReport), "TestReport");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(testReport), "TestReport");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(testReport), "TestReport");
        testReport = testReportService.findTestReportByPid(pid);
        assertThat(testReport.getProcessState()).isEqualTo(ProcessState.Approve);
        assertThat(testReport.getComment()).isEqualTo("我觉得可以");
    }

}
