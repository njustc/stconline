package com.example.stc.activiti;

import com.alibaba.fastjson.JSONObject;
import com.example.stc.controller.BaseController;
import com.example.stc.domain.ProcessEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.net.URI;

@RestController
public class ProcessInstanceController extends BaseController {

    Logger logger = LoggerFactory.getLogger(ProcessInstanceController.class);

    @Autowired
    private ProcessService processService;

    @PostMapping(path = "/process/create")
    public @ResponseBody
    ResponseEntity<?> createProcessInstance(@RequestParam(value = "pid")String pid,
                                            @RequestParam(value = "type")String type) {
        processService.createProcessInstance(pid, type);
        return ResponseEntity.noContent().build();
    }

    /**
     * 获取Process状态
     * @param object
     * @return
     */
    @GetMapping(path = "/process/query")
    public @ResponseBody
    JSONObject queryProcessState(@RequestBody ProcessEntity object) {
        processService.queryProcessState(object);
        JSONObject obj = new JSONObject();
        obj.put("state", object.getProcessState());
        return obj;
    }

    /**
     * 更新Process状态
     * @param object
     * @return
     */
    @PostMapping(path = "/process/update")
    public @ResponseBody
    ResponseEntity<?> updateProcessState(@RequestBody ProcessEntity object,
                                         @RequestParam(value = "type")String type) {
        processService.updateProcessInstance(object, type);
        return ResponseEntity.noContent().build();
    }


}
