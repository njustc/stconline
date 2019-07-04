package com.example.stc.activiti;

import com.alibaba.fastjson.JSONObject;
import com.example.stc.domain.*;
import com.example.stc.framework.util.AuthorityUtils;
import com.example.stc.framework.util.ProcessUtils;
import com.example.stc.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class ProcessServiceImpl implements ProcessService {

    @Autowired
    private STCProcessEngine stcProcessEngine;

    @Autowired
    private AuthorityUtils authorityUtils;

    @Autowired
    private EntrustService entrustService;

    @Autowired
    private ContractService contractService;

    @Autowired
    private TestPlanService testPlanService;

    @Autowired
    private TestReportService testReportService;

    @Override
    public void createProcessInstance(String pid, String type) {
        switch (type) {
            case "Entrust": createEntrustProcess(pid); break;
            case "Contract": createContractProcess(pid); break;
            default: break;
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
        testReportService.updateTestReport(pid, testReport);
        queryProcessState(testReport);
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
     */
    @Override
    public void queryProcessState(ProcessEntity entity) {
        entity.setProcessState(stcProcessEngine.getProcessState(entity.getProcessInstanceId()));
    }

    /**
     * 更新流程实例
     * @param entity
     */
    @Override
    public void updateProcessInstance(ProcessEntity entity) {
        stcProcessEngine.updateProcess(entity);
    }

}
