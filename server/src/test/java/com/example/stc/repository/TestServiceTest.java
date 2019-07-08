package com.example.stc.repository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.assertj.core.api.AssertionsForClassTypes.assertThat;

/**
 * 测试相关测试
 * 包括了测试用例、测试方案、测试记录、测试报告
 * 测试方案和测试报告与项目pid为一对一映射
 * pid 和 testId 为一对多映射
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class TestServiceTest {
//    @Autowired
//    private TestCaseRepository testCaseRepository;
    @Autowired
    private TestPlanRepository testPlanRepository;
    @Autowired
    private TestRecordRepository testRecordRepository;
    @Autowired
    private TestReportRepository testReportRepository;

    @Test
    public void notNull() {
//        assertThat(testCaseRepository).isNotNull();
        assertThat(testPlanRepository).isNotNull();
        assertThat(testRecordRepository).isNotNull();
        assertThat(testReportRepository).isNotNull();
    }

//    @Test
//    public void functionTest() {
//        TestPlan testPlan = new TestPlan();
//        testPlan.setAuthor("author");
//        testPlan.setPid("pid1");
//        TestPlan newPlan = testPlanRepository.save(testPlan);
//        TestPlan fetchPlan = testPlanRepository.findByPid("pid1");
//        //保存的内容和查询的内容是否相等
//        assertThat(fetchPlan.getPid()).isEqualTo("pid1");
//
//        //新建一个测试用例
//        TestCase testCase = new TestCase();
//        testCase.setTestId("tid1");
//        testCase.setPid("pid1");
//        //新建另一个测试用例
//        TestCase anotherCase = new TestCase();
//        anotherCase.setPid("pid1");
//        anotherCase.setTestId("tid2");
//        List<TestCase> testCases =
//                new LinkedList<>();
//        testCases.add(testCase);
//        testCases.add(anotherCase);
//
//        List<TestCase> newCases = testCaseRepository.saveAll(testCases);
//        assertThat(newCases.size()).isEqualTo(2);
//        //分步删除两个testcase
//        int item = testCaseRepository.deleteByTestId("tid1");
//        assertThat(item).isEqualTo(1);
//
//        item = testCaseRepository.deleteByTestId("tid2");
//        assertThat(item).isEqualTo(1);
//
//        item = testPlanRepository.deleteByPid(testPlan.getPid());
//        assertThat(item).isEqualTo(1);
//    }
}
