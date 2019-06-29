package com.example.stc.controller;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.stream.Collectors;

import com.example.stc.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.example.stc.domain.Entrust;

/**
 * 用户的委托相关接口
 */
@RestController
public class EntrustController extends BaseController {

    @Autowired
    private EntrustService entrustService;

    /**
     * 添加Link，使 Entrust -> Resource<Entrust>
     */
    private static Resource<Entrust> toResource(Entrust entrust) {
        return new Resource<>(entrust
                , linkTo(methodOn(EntrustController.class).getOneEntrust(entrust.getPid())).withSelfRel()
                , linkTo(methodOn(EntrustController.class).getAllEntrust()).withSelfRel()
                , linkTo(methodOn(UserController.class).getUserDetail(entrust.getUser().getUserID())).withSelfRel()
        );
    }

    /**
     * 查看全部委托
     */
    @GetMapping(path = "/entrust")
    public @ResponseBody
    Resources<Resource<Entrust>> getAllEntrust() {
        // 依据当前登录的用户的权限查询能见的委托
        List<Resource<Entrust>> entrusts = entrustService.findAllEntrusts().stream()
                .map(EntrustController::toResource)
                .collect(Collectors.toList());
        return new Resources<>(entrusts,
                linkTo(methodOn(EntrustController.class).getAllEntrust()).withSelfRel());
    }

    /**
     * 查看某一用户全部委托
     */
    @GetMapping(path = "/entrust/user/{uid}")
    public @ResponseBody
    Resources<Resource<Entrust>> getUserEntrust(@PathVariable String uid) {
        // 查询某一用户全部委托
        List<Resource<Entrust>> entrusts = entrustService.findAllEntrusts().stream()
                .map(EntrustController::toResource)
                .collect(Collectors.toList());
        return new Resources<>(entrusts,
                linkTo(methodOn(EntrustController.class).getUserEntrust(uid)).withSelfRel());
    }

    /**
     * 新建委托
     *
     * @return
     * @throws URISyntaxException
     */
    @PostMapping(path = "/entrust")
    public @ResponseBody
    ResponseEntity<?> addNewEntrust(@RequestBody Entrust entrust) throws URISyntaxException {
        Resource<Entrust> resource = toResource(entrustService.newEntrust(entrust));
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 查看单个委托
     */
    @GetMapping(path = "/entrust/{pid}")
    public @ResponseBody
    Resource<Entrust> getOneEntrust(@PathVariable String pid) {
        Entrust entrust = entrustService.findEntrustByPid(pid);
        return toResource(entrust);
    }

    /**
     * 修改单个委托
     *
     * @throws URISyntaxException
     */
    @PutMapping(path = "/entrust/{pid}")
    public @ResponseBody
    ResponseEntity<?> replaceEntrust(@PathVariable String pid, @RequestBody Entrust entrust) throws URISyntaxException {
        Entrust updatedEntrust = entrustService.updateEntrust(pid, entrust);
        Resource<Entrust> resource = toResource(updatedEntrust);
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 删除单个委托
     */
    @DeleteMapping(path = "/entrust/{pid}")
    public @ResponseBody
    ResponseEntity<?> deleteEntrust(@PathVariable String pid) {
        entrustService.deleteEntrustByPid(pid);
        return ResponseEntity.noContent().build();
    }
}
