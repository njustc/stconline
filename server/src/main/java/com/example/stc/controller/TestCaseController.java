package com.example.stc.controller;

import com.example.stc.domain.TestCase;
import com.example.stc.service.TestCaseService;
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
 * 测试用例相关接口
 */
@RestController
public class TestCaseController extends BaseController {

    @Autowired
    private TestCaseService testCaseService;
    
    /**
     * 添加Link，使 TestCase -> Resource<TestCase>
     */
    private static Resource<TestCase> toResource(TestCase testCase) {
        return new Resource<>(testCase
                , linkTo(methodOn(TestCaseController.class).getOneTestCase(testCase.getTestId())).withSelfRel()
                , linkTo(methodOn(TestCaseController.class).getAllTestCases()).withSelfRel()
        );
    }
    
    /**
     * 查看全部测试用例
     */
    @GetMapping(path = "/testcase/all")
    public @ResponseBody
    Resources<Resource<TestCase>> getAllTestCases() {
        List<Resource<TestCase>> testCases = testCaseService.findAllTestCases().stream()
                .map(TestCaseController::toResource)
                .collect(Collectors.toList());
        return new Resources<>(testCases,
                linkTo(methodOn(TestCaseController.class).getAllTestCases()).withSelfRel());
    }

    /**
     * 查看某一项目全部测试用例
     */
    @GetMapping(path = "/testcase")
    public @ResponseBody
    Resources<Resource<TestCase>> getProjectTestCases(@RequestParam String pid) {
        List<Resource<TestCase>> testCases = testCaseService.findAllTestCasesByPid(pid).stream()
                .map(TestCaseController::toResource)
                .collect(Collectors.toList());
        return new Resources<>(testCases,
                linkTo(methodOn(TestCaseController.class).getProjectTestCases(pid)).withSelfRel());
    }

    /**
     * 新建测试用例
     * @throws URISyntaxException
     */
    @PostMapping(path = "/testcase")
    public @ResponseBody
    ResponseEntity<?> addNewTestCase(@RequestBody TestCase testCase) throws URISyntaxException {
        Resource<TestCase> resource = toResource(testCaseService.newTestCase(testCase));
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 查看单个测试用例
     */
    @GetMapping(path = "/testcase/{testId}")
    public @ResponseBody
    Resource<TestCase> getOneTestCase(@PathVariable String testId) {
        TestCase testCase = testCaseService.findTestCaseByTestId(testId);
        return toResource(testCase);
    }

    /**
     * 修改单个测试用例
     * @throws URISyntaxException
     */
    @PutMapping(path = "/testcase/{testId}")
    public @ResponseBody
    ResponseEntity<?> replaceTestCase(@PathVariable String testId, @RequestBody TestCase testCase) throws URISyntaxException {
        TestCase updatedTestCase = testCaseService.updateTestCase(testId, testCase);
        Resource<TestCase> resource = toResource(updatedTestCase);
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 删除单个测试用例
     */
    @DeleteMapping(path = "/testcase/{testId}")
    public @ResponseBody
    ResponseEntity<?> deleteTestCase(@PathVariable String testId) {
        testCaseService.deleteTestCaseByTestId(testId);
        return ResponseEntity.noContent().build();
    }
}
