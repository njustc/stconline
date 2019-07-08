package com.example.stc.controller;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.stream.Collectors;

import com.example.stc.activiti.ProcessService;
import com.example.stc.framework.util.AuthorityUtils;
import com.example.stc.framework.util.ProcessUtils;
import com.example.stc.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;

import com.example.stc.domain.Entrust;

/**
 * 用户的委托相关接口
 */
@RestController
public class EntrustController extends BaseController {

    Logger logger = LoggerFactory.getLogger(EntrustController.class);

    @Autowired
    private EntrustService entrustService;

    @Autowired
    private ProcessService processService;

    /**
     * 查看全部委托
     * CUS, SS可随时查看
     */
    @Secured({"ROLE_CUS", "ROLE_SS"})
    @GetMapping(path = "/entrust")
    public @ResponseBody
    Resources<Resource<Entrust>> getAllEntrust() {
        // 依据当前登录的用户的权限查询能见的委托
        List<Resource<Entrust>> entrusts = entrustService.findEntrustsByAuthority().stream()
                .map(entrust -> toResource(entrust, methodOn(EntrustController.class).getAllEntrust(), null))
                .collect(Collectors.toList());
        logger.info("getAllEntrust: 最终查询委托数：" + entrusts.size());
        return new Resources<>(entrusts,
                linkTo(methodOn(EntrustController.class).getAllEntrust()).withSelfRel());
    }

    /** 查看待办事项 */
    @Secured({"ROLE_CUS", "ROLE_SS"})
    @GetMapping(path = "/entrust/todo")
    public @ResponseBody
    Resources<Resource<Entrust>> getAllToDoEntrust() {
        // 依据当前登录的用户的权限查询待办的委托
        List<Resource<Entrust>> entrusts = entrustService.findToDoEntrustsByAuthority().stream()
                .map(entrust -> toResource(entrust, methodOn(EntrustController.class).getAllEntrust(), null))
                .collect(Collectors.toList());
        logger.info("getAllToDoEntrust: 最终查询委托数：" + entrusts.size());
        return new Resources<>(entrusts,
                linkTo(methodOn(EntrustController.class).getAllToDoEntrust()).withSelfRel());
    }

    /**
     * 查看某一用户全部委托
     */
    @Deprecated
    @Secured({"ROLE_SS"})
    @GetMapping(path = "/entrust/user/{uid}")
    public @ResponseBody
    Resources<Resource<Entrust>> getUserEntrust(@PathVariable String uid) {
        // 查询某一用户全部委托
        List<Resource<Entrust>> entrusts = entrustService.findEntrustsByUser(uid).stream()
                .map(entrust -> toResource(entrust, methodOn(EntrustController.class).getUserEntrust(uid), null))
                .collect(Collectors.toList());
        logger.info("getUserEntrust: 最终查询委托数：" + entrusts.size());
        return new Resources<>(entrusts,
                linkTo(methodOn(EntrustController.class).getUserEntrust(uid)).withSelfRel());
    }

    /**
     * 新建委托
     * CUS可随时新建
     * @throws URISyntaxException
     */
    @Secured({"ROLE_CUS"})
    @PostMapping(path = "/entrust")
    public @ResponseBody
    ResponseEntity<?> addNewEntrust(@RequestBody Entrust entrust) throws URISyntaxException {
        Resource<Entrust> resource = toResource(entrustService.newEntrust(entrust)
                , methodOn(EntrustController.class).addNewEntrust(entrust), null);
        logger.info("addNewEntrust: userId = " + entrust.getUserId());
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 查看单个委托
     * CUS, SS可随时查看；CUS仅查看自己的委托
     */
    @Secured({"ROLE_CUS", "ROLE_SS"})
    @GetMapping(path = "/entrust/{pid}")
    public @ResponseBody
    Resource<Entrust> getOneEntrust(@PathVariable String pid) {
        Entrust entrust = entrustService.findEntrustByPid(pid);
        authorityUtils.customerAccessCheck(entrust); // 若为客户，只能访问本人的委托
        logger.info("getOneEntrust: userId = " + entrust.getUserId());
        return this.toResource(entrust, methodOn(EntrustController.class).getOneEntrust(pid)
                , methodOn(EntrustController.class).getAllEntrust());
    }

    /**
     * 修改单个委托
     * 仅CUS在Submit阶段修改；CUS仅修改自己的委托
     * @throws URISyntaxException
     */
    @Secured({"ROLE_CUS"})
    @PutMapping(path = "/entrust/{pid}")
    public @ResponseBody
    ResponseEntity<?> replaceEntrust(@PathVariable String pid, @RequestBody Entrust entrust) throws URISyntaxException {
        Entrust updatedEntrust = entrustService.updateEntrust(pid, entrust);
        authorityUtils.customerAccessCheck(entrust); // 若为客户，只能访问本人的委托
        authorityUtils.stateAccessCheck(entrust, "CUS", "Submit", "修改"); // 仅Submit阶段可修改
        logger.info("replaceEntrust: userId = " + entrust.getUserId());
        Resource<Entrust> resource = toResource(updatedEntrust
                , methodOn(EntrustController.class).replaceEntrust(pid, entrust), null);
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 删除单个委托
     * 仅CUS在Submit阶段可删除；CUS仅删除自己的委托
     */
    @Secured({"ROLE_CUS"})
    @DeleteMapping(path = "/entrust/{pid}")
    public @ResponseBody
    ResponseEntity<?> deleteEntrust(@PathVariable String pid) {
        Entrust entrust = entrustService.findEntrustByPid(pid);
        authorityUtils.customerAccessCheck(entrust); // 若为客户，只能访问本人的委托
        authorityUtils.stateAccessCheck(entrust, "CUS", "Submit", "删除"); // 仅Submit阶段可删除
        logger.info("deleteEntrust: userId = " + entrust.getUserId());
        processService.deleteProcessInstance(entrust);
        entrustService.deleteEntrustByPid(pid);
        return ResponseEntity.noContent().build();
    }

}
