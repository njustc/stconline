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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

    private final Logger logger = LoggerFactory.getLogger(ProcessTest.class);

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
        logger.info("创建委托，用户ID：" + userId + "，项目ID：" + pid);
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
        logger.info("用户第一次提交委托，状态：Review。");

        /** SS审批不通过 */
        entrust.setOperation("ReviewDisprove");
        entrust.setComment("我觉得不行");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(entrust), "Entrust");
        entrust = entrustService.findEntrustByPid(pid);
        assertThat(entrust.getProcessState()).isEqualTo(ProcessState.Submit);
        assertThat(entrust.getComment()).isEqualTo("我觉得不行");
        logger.info("市场部工作人员审批不通过，返回给用户，状态：Submit。");

        /** CUS第二次提交委托 */
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(entrust), "Entrust");
        entrust = entrustService.findEntrustByPid(pid);
        assertThat(entrust.getProcessState()).isEqualTo(ProcessState.Review);
        logger.info("用户第二次提交委托，状态：Review。");

        /** SS审批通过 */
        entrust.setOperation("ReviewPass");
        entrust.setComment("我觉得可以");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(entrust), "Entrust");
        entrust = entrustService.findEntrustByPid(pid);
        assertThat(entrust.getProcessState()).isEqualTo(ProcessState.Approve);
        assertThat(entrust.getComment()).isEqualTo("我觉得可以");
        logger.info("市场部工作人员审批通过，委托流程结束，状态：Approve。");

        /** 合同流程（合同为自动创建） */
        Contract contract = contractService.findContractByPid(pid);
        assertThat(contract.getUserId()).isEqualTo(userId);
        logger.info("自动创建合同，用户ID：" + userId + "，项目ID：" + pid);

        /** SS第一次提交合同 */
        processInstanceController.createProcessInstance(pid, "Contract");
        contract = contractService.findContractByPid(pid);
        assertThat(contract.getProcessInstanceId()).isNotEqualTo("");
        assertThat(contract.getProcessState()).isEqualTo(ProcessState.Review);
        logger.info("市场部工作人员第一次提交合同，状态：Review。");

        /** SM审核通过 */
        contract.setOperation("ReviewPass");
        contract.setComment("我觉得可以");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(contract), "Contract");
        contract = contractService.findContractByPid(pid);
        assertThat(contract.getProcessState()).isEqualTo(ProcessState.Review);
        assertThat(contract.getComment()).isEqualTo("我觉得可以");
        logger.info("市场部主任审批通过，状态：Review。");

        /** QM审核不通过 */
        contract.setOperation("ReviewDisprove");
        contract.setComment("我觉得不行");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(contract), "Contract");
        contract = contractService.findContractByPid(pid);
        assertThat(contract.getProcessState()).isEqualTo(ProcessState.Submit);
        assertThat(contract.getComment()).isEqualTo("我觉得不行");
        logger.info("质量部主任审批不通过，返回给市场部工作人员，状态：Submit。");

        /** SS第二次提交 */
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(contract), "Contract");
        contract = contractService.findContractByPid(pid);
        assertThat(contract.getProcessState()).isEqualTo(ProcessState.Review);
        logger.info("市场部工作人员第二次提交合同，状态：Review。");

        /** 审核通过×3 */
        contract.setOperation("ReviewPass");
        contract.setComment("我觉得可以");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(contract), "Contract");
        logger.info("市场部主任审批通过，状态：Review。");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(contract), "Contract");
        logger.info("质量部主任审批通过，状态：Review。");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(contract), "Contract");
        logger.info("客户审批通过，合同流程完成，状态：Approve。");
        contract = contractService.findContractByPid(pid);
        assertThat(contract.getProcessState()).isEqualTo(ProcessState.Approve);
        assertThat(contract.getComment()).isEqualTo("我觉得可以");

        /** 测试方案流程 */
        TestPlan testPlan = testPlanService.findTestPlanByPid(pid);
        assertThat(testPlan.getUserId()).isEqualTo(userId);
        logger.info("自动创建测试方案，用户ID：" + userId + "，项目ID：" + pid);

        /** TS第一次提交 */
        processInstanceController.createProcessInstance(pid, "TestPlan");
        testPlan = testPlanService.findTestPlanByPid(pid);
        assertThat(testPlan.getProcessInstanceId()).isNotEqualTo("");
        assertThat(testPlan.getProcessState()).isEqualTo(ProcessState.Review);
        logger.info("测试部工作人员第一次提交测试方案，状态：Review。");

        /** QM审核不通过 */
        testPlan.setOperation("ReviewDisprove");
        testPlan.setComment("我觉得不行");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(testPlan), "TestPlan");
        testPlan = testPlanService.findTestPlanByPid(pid);
        assertThat(testPlan.getProcessState()).isEqualTo(ProcessState.Submit);
        assertThat(testPlan.getComment()).isEqualTo("我觉得不行");
        logger.info("质量部主任审核不通过，返回给测试部工作人员，状态：Submit。");

        /** TS第二次提交 */
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(testPlan), "TestPlan");
        testPlan = testPlanService.findTestPlanByPid(pid);
        assertThat(testPlan.getProcessState()).isEqualTo(ProcessState.Review);
        logger.info("测试部工作人员第二次提交测试方案，状态：Review。");

        /** 审核通过×2 */
        testPlan.setOperation("ReviewPass");
        testPlan.setComment("我觉得可以");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(testPlan), "TestPlan");
        logger.info("质量部主任审核通过，状态：Review。");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(testPlan), "TestPlan");
        logger.info("测试部主任审核通过，测试方案流程完成，状态：Approve。");
        testPlan = testPlanService.findTestPlanByPid(pid);
        assertThat(testPlan.getProcessState()).isEqualTo(ProcessState.Approve);
        assertThat(testPlan.getComment()).isEqualTo("我觉得可以");

        /** 测试报告流程 */
        TestReport testReport = testReportService.findTestReportByPid(pid);
        assertThat(testReport.getUserId()).isEqualTo(userId);
        logger.info("自动创建测试报告，用户ID：" + userId + "，项目ID：" + pid);

        /** TS第一次提交 */
        processInstanceController.createProcessInstance(pid, "TestReport");
        testReport = testReportService.findTestReportByPid(pid);
        assertThat(testReport.getProcessInstanceId()).isNotEqualTo("");
        assertThat(testReport.getProcessState()).isEqualTo(ProcessState.Review);
        logger.info("测试部工作人员第一次提交测试报告，状态：Review。");

        /** TM审核不通过 */
        testReport.setOperation("ReviewDisprove");
        testReport.setComment("我觉得不行");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(testReport), "TestReport");
        testReport = testReportService.findTestReportByPid(pid);
        assertThat(testReport.getProcessState()).isEqualTo(ProcessState.Submit);
        assertThat(testReport.getComment()).isEqualTo("我觉得不行");
        logger.info("测试部主任审核不通过，返回给测试部工作人员，状态：Submit。");

        /** TS第二次提交 */
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(testReport), "TestReport");
        testReport = testReportService.findTestReportByPid(pid);
        assertThat(testReport.getProcessState()).isEqualTo(ProcessState.Review);
        logger.info("测试部工作人员第二次提交测试报告，状态：Review。");

        /** 审核通过×3 */
        testReport.setOperation("ReviewPass");
        testReport.setComment("我觉得可以");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(testReport), "TestReport");
        logger.info("测试部主任审核通过，状态：Review。");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(testReport), "TestReport");
        logger.info("质量部主任审核通过，状态：Review。");
        processInstanceController.updateProcessState((JSONObject)JSON.toJSON(testReport), "TestReport");
        logger.info("客户审核通过，测试报告流程结束，状态：Approve，项目结项。");
        testReport = testReportService.findTestReportByPid(pid);
        assertThat(testReport.getProcessState()).isEqualTo(ProcessState.Approve);
        assertThat(testReport.getComment()).isEqualTo("我觉得可以");
    }

}
