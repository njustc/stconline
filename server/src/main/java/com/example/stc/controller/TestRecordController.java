package com.example.stc.controller;

import com.example.stc.domain.TestRecord;
import com.example.stc.service.TestRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.stream.Collectors;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

/**
 * 测试记录相关接口
 */
@RestController
public class TestRecordController extends BaseController {

    @Autowired
    private TestRecordService testRecordService;
    
    /**
     * 添加Link，使 TestRecord -> Resource<TestRecord>
     */
    private static Resource<TestRecord> toResource(TestRecord testRecord) {
        return new Resource<>(testRecord
                , linkTo(methodOn(TestRecordController.class).getOneTestRecord(testRecord.getTestId())).withSelfRel()
                , linkTo(methodOn(TestRecordController.class).getAllTestRecords()).withSelfRel()
        );
    }
    
    /**
     * 查看全部测试记录
     */
    @Secured({"ROLE_TS", "ROLE_TM"})
    @GetMapping(path = "/testRecord/all")
    public @ResponseBody
    Resources<Resource<TestRecord>> getAllTestRecords() {
        List<Resource<TestRecord>> testRecords = testRecordService.findAllTestRecords().stream()
                .map(TestRecordController::toResource)
                .collect(Collectors.toList());
        return new Resources<>(testRecords,
                linkTo(methodOn(TestRecordController.class).getAllTestRecords()).withSelfRel());
    }

    /**
     * 查看某一项目全部测试记录
     */
    @Secured({"ROLE_TS", "ROLE_TM"})
    @GetMapping(path = "/testRecord")
    public @ResponseBody
    Resources<Resource<TestRecord>> getProjectTestRecords(@RequestParam String pid) {
        List<Resource<TestRecord>> testRecords = testRecordService.findAllTestRecordsByPid(pid).stream()
                .map(TestRecordController::toResource)
                .collect(Collectors.toList());
        return new Resources<>(testRecords,
                linkTo(methodOn(TestRecordController.class).getProjectTestRecords(pid)).withSelfRel());
    }

    /**
     * 新建测试记录
     * @throws URISyntaxException
     */
    @PostMapping(path = "/testRecord")
    public @ResponseBody
    ResponseEntity<?> addNewTestRecord(@RequestBody TestRecord testRecord) throws URISyntaxException {
        // testRecord参数中的TestCase是已经填好的
        Resource<TestRecord> resource = toResource(testRecordService.newTestRecord(testRecord));
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 查看单个测试记录
     */
    @Secured({"ROLE_TS", "ROLE_TM"})
    @GetMapping(path = "/testRecord/{testId}")
    public @ResponseBody
    Resource<TestRecord> getOneTestRecord(@PathVariable String testId) {
        TestRecord testRecord = testRecordService.findTestRecordByTestId(testId);
        return toResource(testRecord);
    }

    /**
     * 修改单个测试记录
     * @throws URISyntaxException
     */
    @Secured({"ROLE_TS"})
    @PutMapping(path = "/testRecord/{testId}")
    public @ResponseBody
    ResponseEntity<?> replaceTestRecord(@PathVariable String testId, @RequestBody TestRecord testRecord) throws URISyntaxException {
        TestRecord updatedTestRecord = testRecordService.updateTestRecord(testId, testRecord);
        Resource<TestRecord> resource = toResource(updatedTestRecord);
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 删除单个测试记录
     */
    @Secured({"ROLE_TS"})
    @DeleteMapping(path = "/testRecord/{testId}")
    public @ResponseBody
    ResponseEntity<?> deleteTestRecord(@PathVariable String testId) {
        testRecordService.deleteTestRecordByTestId(testId);
        return ResponseEntity.noContent().build();
    }
}
