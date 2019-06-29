package com.example.stc.controller;

import com.example.stc.domain.TestReport;
import com.example.stc.service.TestReportService;
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
 * 测试报告相关接口
 */
@RestController
public class TestReportController extends BaseController {

    @Autowired
    private TestReportService testReportService;
    
    /**
     * 添加Link，使 TestReport -> Resource<TestReport>
     */
    private static Resource<TestReport> toResource(TestReport testReport) {
        return new Resource<>(testReport
                , linkTo(methodOn(TestReportController.class).getOneTestReport(testReport.getPid())).withSelfRel()
                , linkTo(methodOn(TestReportController.class).getAllTestReport()).withSelfRel()
        );
    }

    /**
     * 查看全部测试报告
     */
    @GetMapping(path = "/testReport")
    public @ResponseBody
    Resources<Resource<TestReport>> getAllTestReport() {
        // 依据当前登录的用户的权限查询能见的测试报告
        List<Resource<TestReport>> testReports = testReportService.findAllTestReports().stream()
                .map(TestReportController::toResource)
                .collect(Collectors.toList());
        return new Resources<>(testReports,
                linkTo(methodOn(TestReportController.class).getAllTestReport()).withSelfRel());
    }

    /**
     * 查看单个测试报告
     */
    @GetMapping(path = "/testReport/{pid}")
    public @ResponseBody
    Resource<TestReport> getOneTestReport(@PathVariable String pid) {
        TestReport testReport = testReportService.findTestReportByPid(pid);
        return toResource(testReport);
    }

    /**
     * 新建测试报告
     * @throws URISyntaxException
     */
    @PostMapping(path = "/testReport/{pid}")
    public @ResponseBody
    ResponseEntity<?> addNewTestReport(@PathVariable String pid, @RequestBody TestReport testReport) throws URISyntaxException {
        Resource<TestReport> resource = toResource(testReportService.newTestReport(pid, testReport));
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 修改单个测试报告
     * @throws URISyntaxException
     */
    @PutMapping(path = "/testReport/{pid}")
    public @ResponseBody
    ResponseEntity<?> replaceTestReport(@PathVariable String pid, @RequestBody TestReport testReport) throws URISyntaxException {
        TestReport updatedTestReport = testReportService.updateTestReport(pid, testReport);
        Resource<TestReport> resource = toResource(updatedTestReport);
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 删除单个测试报告
     */
    @DeleteMapping(path = "/testReport/{pid}")
    public @ResponseBody
    ResponseEntity<?> deleteTestReport(@PathVariable String pid) {
        testReportService.deleteTestReportByPid(pid);
        return ResponseEntity.noContent().build();
    }

}
