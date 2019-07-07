package com.example.stc.activiti;

import com.alibaba.fastjson.JSONObject;
import com.example.stc.domain.*;
import com.example.stc.framework.util.AuthorityUtils;
import com.example.stc.framework.util.ProcessUtils;
import com.example.stc.service.*;
import org.activiti.engine.ActivitiException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class ProcessServiceImpl implements ProcessService {

    @Autowired
    private STCProcessEngine stcProcessEngine;

    @Autowired
    private EntrustService entrustService;

    @Autowired
    private ContractService contractService;

    @Autowired
    private TestPlanService testPlanService;

    @Autowired
    private TestReportService testReportService;

    @Autowired
    private TestRecordService testRecordService;

    @Override
    public void createProcessInstance(String pid, String type) {
        switch (type) {
            case "Entrust": createEntrustProcess(pid); break;
            case "Contract": createContractProcess(pid); break;
            case "TestPlan": createTestPlanProcess(pid); break;
            case "TestReport": createTestReportProcess(pid); break;
            case "TestRecord": createTestRecordProcess(pid); break;
            default: throw new ActivitiException("未知流程类型。");
        }
    }

    /**
     * 创建委托流程
     * @param pid
     */
    @Override
    public void createEntrustProcess(String pid) {
        Entrust entrust = entrustService.findEntrustByPid(pid);
        Map<String, Object> variable = new HashMap<String, Object>();
        variable.put("EntrustID", pid);
        variable.put("ClientID", entrust.getUserId());
        entrust.setProcessInstanceId(stcProcessEngine.createProcess("Entrust", variable));
        entrust.setProcessState(ProcessState.Review);
        entrustService.updateEntrust(pid, entrust);
        queryProcessState(entrust);
    }

    /**
     * 创建合同流程
     * @param pid
     */
    @Override
    public void createContractProcess(String pid) {
        Contract contract = contractService.findContractByPid(pid);
        Map<String, Object> variable = new HashMap<String, Object>();
        variable.put("ContractID", pid);
        variable.put("ClientID", contract.getUserId());
        contract.setProcessInstanceId(stcProcessEngine.createProcess("Contract", variable));
        contract.setProcessState(ProcessState.Review);
        contractService.updateContract(pid, contract);
        queryProcessState(contract);
    }

    /**
     * 创建测试方案流程
     * @param pid
     */
    @Override
    public void createTestPlanProcess(String pid) {
        TestPlan testPlan = testPlanService.findTestPlanByPid(pid);
        Map<String, Object> variable = new HashMap<String, Object>();
        variable.put("TestPlanID", pid);
        variable.put("ClientID", testPlan.getUserId());
        testPlan.setProcessInstanceId(stcProcessEngine.createProcess("TestPlan", variable));
        testPlan.setProcessState(ProcessState.Review);
        testPlanService.updateTestPlan(pid, testPlan);
        queryProcessState(testPlan);
    }

    /**
     * 创建测试报告流程
     * @param pid
     */
    @Override
    public void createTestReportProcess(String pid) {
        TestReport testReport = testReportService.findTestReportByPid(pid);
        Map<String, Object> variable = new HashMap<String, Object>();
        variable.put("TestReportID", pid);
        variable.put("ClientID", testReport.getUserId());
        testReport.setProcessInstanceId(stcProcessEngine.createProcess("TestReport", variable));
        testReport.setProcessState(ProcessState.Review);
        testReportService.updateTestReport(pid, testReport);
        queryProcessState(testReport);
    }

    @Override
    public void createTestRecordProcess(String testId) {
        TestRecord testRecord = testRecordService.findTestRecordByTestId(testId);
        Map<String, Object> variable = new HashMap<String, Object>();
        variable.put("TestReportID", testId);
        testRecord.setProcessInstanceId(stcProcessEngine.createProcess("TestRecord", variable));
        testRecord.setProcessState(ProcessState.Review);
        testRecordService.updateTestRecord(testId, testRecord);
        queryProcessState(testRecord);
    }

    /**
     * 删除流程实例
     * @param entity
     */
    @Override
    public void deleteProcessInstance(ProcessEntity entity) {
        if (!entity.getProcessInstanceId().equals("")) {
            stcProcessEngine.deleteProcessInstance(entity.getProcessInstanceId());
        }
    }

    /**
     * 查询流程状态
     * @param entity
     * @return
     */
    @Override
    public String queryProcessState(JSONObject entity) {
        return queryProcessState(entity.toJavaObject(ProcessEntity.class));
    }

    @Override
    public String queryProcessState(ProcessEntity entity) {
        String processState = stcProcessEngine.getProcessState(entity.getProcessInstanceId());
        return processState;
    }

    /**
     * 更新流程实例
     * @param object
     */
    @Override
    public void updateProcessInstance(JSONObject object, String type) {
        ProcessEntity entity = object.toJavaObject(ProcessEntity.class);
        stcProcessEngine.updateProcess(entity);

        /**
         * 保存process状态
         */
        String pid = entity.getPid();
        String userId = entity.getUserId();
        String comment = entity.getComment();
        String processState = queryProcessState(entity);
        String testId = object.getString("testId");
        switch (type) {
            case "Entrust": entrustService.updateProcessState(pid, processState, comment); break;
            case "Contract": contractService.updateProcessState(pid, processState, comment); break;
            case "TestPlan": testPlanService.updateProcessState(pid, processState, comment); break;
            case "TestReport": testReportService.updateProcessState(pid, processState, comment); break;
            case "TestRecord": testRecordService.updateProcessState(testId, processState, comment); break;
            default: break;
        }

        if (queryProcessState(entity).equals("Approve")) {
            /**
             * 根据type创建流水线的下一个实体
             */
            switch (type) {
                case "Entrust": contractService.newContract(pid, userId); break;
                case "Contract": testPlanService.newTestPlan(pid, userId); break;
                case "TestPlan": testReportService.newTestReport(pid, userId); break;
                default: break;
            }
        }
    }

    /**
     * 获取评审意见
     * @param processInstanceId
     * @return 评审意见
     */
    @Override
    public String getProcessComment(String processInstanceId) {
        return stcProcessEngine.getComment(processInstanceId);
    }

    /**
     * 获取项目状态
     * @param pid
     * @return 项目状态
     */
    @Override
    public int queryProjectState(String pid) {
        Entrust entrust = entrustService.findEntrustByPid(pid);
        if (!queryProcessState(entrust).equals("Approve"))
            return 1;

        Contract contract = contractService.findContractByPid(pid);
        if (!queryProcessState(contract).equals("Approve"))
            return 2;

        TestPlan testPlan = testPlanService.findTestPlanByPid(pid);
        if (!queryProcessState(testPlan).equals("Approve"))
            return 3;

        TestReport testReport = testReportService.findTestReportByPid(pid);
        if (!queryProcessState(testReport).equals("Approve"))
            return 4;

        return 5;
    }
}
