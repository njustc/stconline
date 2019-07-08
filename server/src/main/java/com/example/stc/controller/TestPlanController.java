package com.example.stc.controller;

import com.example.stc.activiti.ProcessState;
import com.example.stc.domain.Role;
import com.example.stc.domain.TestPlan;
import com.example.stc.domain.User;
import com.example.stc.framework.util.AuthorityUtils;
import com.example.stc.framework.util.ProcessUtils;
import com.example.stc.service.TestPlanService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.stream.Collectors;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

/**
 * 测试方案相关接口
 */
@RestController
public class TestPlanController extends BaseController {

    Logger logger = LoggerFactory.getLogger(TestPlanController.class);

    @Autowired
    private TestPlanService testPlanService;

    /**
     * 查看全部测试方案
     * CUS, TS, TM, QM可查看
     */
    @Secured({"ROLE_CUS", "ROLE_TS", "ROLE_TM", "ROLE_QM"})
    @GetMapping(path = "/testplan")
    public @ResponseBody
    Resources<Resource<TestPlan>> getAllTestPlan() {
        // 依据当前登录的用户的权限查询能见的测试方案
        List<Resource<TestPlan>> testPlans = testPlanService.findTestPlansByAuthority().stream()
                .map(testPlan -> toResource(testPlan, methodOn(TestPlanController.class).getAllTestPlan(), null))
                .collect(Collectors.toList());
        logger.info("getAllTestPlan: 最终查询测试方案数：" + testPlans.size());
        return new Resources<>(testPlans,
                linkTo(methodOn(TestPlanController.class).getAllTestPlan()).withSelfRel());
    }

    /**
     * 查看全部待办测试方案
     * CUS, TS, TM, QM可查看
     */
    @Secured({"ROLE_CUS", "ROLE_TS", "ROLE_TM", "ROLE_QM"})
    @GetMapping(path = "/testplan/todo")
    public @ResponseBody
    Resources<Resource<TestPlan>> getAllToDoTestPlan() {
        // 依据当前登录的用户的权限查询能见的测试方案
        List<Resource<TestPlan>> testPlans = testPlanService.findToDoTestPlansByAuthority().stream()
                .map(testPlan -> toResource(testPlan, methodOn(TestPlanController.class).getAllTestPlan(), null))
                .collect(Collectors.toList());
        logger.info("getAllToDoTestPlan: 最终查询测试方案数：" + testPlans.size());
        return new Resources<>(testPlans,
                linkTo(methodOn(TestPlanController.class).getAllToDoTestPlan()).withSelfRel());
    }

    /**
     * 查看单个测试方案
     * CUS, TS, TM, QM可查看
     * TM, QM仅审核阶段之后可查看
     * CUS仅审核通过可查看
     */
    @Secured({"ROLE_CUS", "ROLE_TS", "ROLE_TM", "ROLE_QM"})
    @GetMapping(path = "/testplan/{pid}")
    public @ResponseBody
    Resource<TestPlan> getOneTestPlan(@PathVariable String pid) {
        TestPlan testPlan = testPlanService.findTestPlanByPid(pid);
        authorityUtils.customerAccessCheck(testPlan);
        authorityUtils.stateAccessCheck(testPlan, "CUS", "Approve", "查看");
        authorityUtils.stateAccessCheck(testPlan, "TM,QM", "Review,Approve", "查看");
        logger.info("getOneTestPlan");
        return toResource(testPlan, methodOn(TestPlanController.class).getOneTestPlan(pid)
                , methodOn(TestPlanController.class).getAllTestPlan());
    }

    /**
     * 自动新建测试方案
     * @throws URISyntaxException
     */
    @PostMapping(path = "/testplan/{pid}")
    public @ResponseBody
    ResponseEntity<?> addNewTestPlan(@PathVariable String pid, @RequestParam String uid) throws URISyntaxException {
        logger.info("addNewTestPlan");
        Resource<TestPlan> resource = toResource(testPlanService.newTestPlan(pid, uid)
                , methodOn(TestPlanController.class).addNewTestPlan(pid, uid), null);
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 修改单个测试方案
     * 仅TS在Submit阶段可修改
     * @throws URISyntaxException
     */
    @Secured({"ROLE_TS"}) // 测试部工作人员
    @PutMapping(path = "/testplan/{pid}")
    public @ResponseBody
    ResponseEntity<?> replaceTestPlan(@PathVariable String pid, @RequestBody TestPlan testPlan) throws URISyntaxException {
        TestPlan updatedTestPlan = testPlanService.updateTestPlan(pid, testPlan);
        authorityUtils.stateAccessCheck(testPlan, "TS", "Submit", "修改");
        logger.info("replaceTestPlan");
        Resource<TestPlan> resource = toResource(updatedTestPlan
                , methodOn(TestPlanController.class).replaceTestPlan(pid, testPlan), null);
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 删除单个测试方案
     * 仅TS在Submit阶段可删除
     */
    @Secured({"ROLE_TS"}) // 测试部工作人员
    @DeleteMapping(path = "/testplan/{pid}")
    public @ResponseBody
    ResponseEntity<?> deleteTestPlan(@PathVariable String pid) {
        TestPlan testPlan = testPlanService.findTestPlanByPid(pid);
        authorityUtils.stateAccessCheck(testPlan, "TS", "Submit", "删除");
        logger.info("deleteTestPlan");
        testPlanService.deleteTestPlanByPid(pid);
        return ResponseEntity.noContent().build();
    }

}
