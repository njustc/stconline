package com.example.stc.controller;

import com.example.stc.domain.TestPlan;
import com.example.stc.service.TestPlanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.http.ResponseEntity;
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

    @Autowired
    private TestPlanService testPlanService;
    
    /**
     * 添加Link，使 TestPlan -> Resource<TestPlan>
     */
    private static Resource<TestPlan> toResource(TestPlan testPlan) {
        return new Resource<>(testPlan
                , linkTo(methodOn(TestPlanController.class).getOneTestPlan(testPlan.getPid())).withSelfRel()
                , linkTo(methodOn(TestPlanController.class).getAllTestPlan()).withSelfRel()
        );
    }

    /**
     * 查看全部测试方案
     */
    @GetMapping(path = "/testplan")
    public @ResponseBody
    Resources<Resource<TestPlan>> getAllTestPlan() {
        // 依据当前登录的用户的权限查询能见的测试方案
        List<Resource<TestPlan>> testPlans = testPlanService.findAllTestPlans().stream()
                .map(TestPlanController::toResource)
                .collect(Collectors.toList());
        return new Resources<>(testPlans,
                linkTo(methodOn(TestPlanController.class).getAllTestPlan()).withSelfRel());
    }

    /**
     * 查看单个测试方案
     */
    @GetMapping(path = "/testplan/{pid}")
    public @ResponseBody
    Resource<TestPlan> getOneTestPlan(@PathVariable String pid) {
        TestPlan testPlan = testPlanService.findTestPlanByPid(pid);
        return toResource(testPlan);
    }

    /**
     * 新建测试方案
     * @throws URISyntaxException
     */
    @PostMapping(path = "/testplan")
    public @ResponseBody
    ResponseEntity<?> addNewTestPlan(@RequestBody TestPlan testPlan) throws URISyntaxException {
        Resource<TestPlan> resource = toResource(testPlanService.newTestPlan(testPlan));
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 修改单个测试方案
     * @throws URISyntaxException
     */
    @PutMapping(path = "/testplan/{pid}")
    public @ResponseBody
    ResponseEntity<?> replaceTestPlan(@PathVariable String pid, @RequestBody TestPlan testPlan) throws URISyntaxException {
        TestPlan updatedTestPlan = testPlanService.updateTestPlan(pid, testPlan);
        Resource<TestPlan> resource = toResource(updatedTestPlan);
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 删除单个测试方案
     */
    @DeleteMapping(path = "/testplan/{pid}")
    public @ResponseBody
    ResponseEntity<?> deleteTestPlan(@PathVariable String pid) {
        testPlanService.deleteTestPlanByPid(pid);
        return ResponseEntity.noContent().build();
    }

}
