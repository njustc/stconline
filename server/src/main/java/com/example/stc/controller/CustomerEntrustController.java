package com.example.stc.controller;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

import java.util.List;
import java.util.stream.Collectors;

import com.alibaba.fastjson.JSON;
import com.example.stc.framework.core.web.Response;
import com.example.stc.framework.enums.ResponseType;
import com.example.stc.service.EntrustService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.web.bind.annotation.*;

import com.example.stc.domain.Entrust;

/**
 * 客户类用户的委托相关接口
 */
@RestController
@RequestMapping(path = "/api/customers") // 当前不考虑登录问题
//@RequestMapping(path="/api/customers/{cid}") //考虑登录问题时的接口前缀
public class CustomerEntrustController {

    @Autowired
    private EntrustService entrustService;

    /**
     * 添加Link，使 Entrust -> Resource<Entrust>
     */
    private static Resource<Entrust> toResource(Entrust entrust) {
        return new Resource<>(entrust
                , linkTo(methodOn(CustomerEntrustController.class).getOneEntrust(entrust.getPid())).withSelfRel()
                , linkTo(methodOn(CustomerEntrustController.class).getAllEntrust()).withSelfRel()
        );
    }

    /**
     * 查看全部委托
     */
    @GetMapping(path = "/projects")
    public @ResponseBody
    JSON getAllEntrust() {
        try {
            List<Resource<Entrust>> list = entrustService.findAllEntrusts().stream()
                    .map(entrust -> toResource(entrust))
                    .collect(Collectors.toList());
            return Response.success(list);
        } catch (Exception e) {
            return Response.fail(ResponseType.RESOURCE_NOT_EXIST);
        }

    }

    /**
     * 新建委托
     *
     * @return
     */
    @PostMapping(path = "/projects")
    public @ResponseBody
    JSON addNewEntrust(@RequestBody Entrust entrust) {
        try {

            entrust = entrustService.insertEntrust(entrust);
            return Response.success(entrust);
        } catch (RuntimeException e) {
            return Response.fail(ResponseType.RESOURCE_NOT_EXIST);
        } catch (Exception e) {
            return Response.fail(ResponseType.UNKNOWN_ERROR);
        }
    }

    /**
     * 查看单个委托
     */
    @GetMapping(path = "/projects/{pid}/entrust")
    public @ResponseBody
    JSON getOneEntrust(@PathVariable String pid) {
        try {

            Entrust entrust = entrustService.findEntrustById(pid);
            return Response.success(entrust
                    , linkTo(methodOn(CustomerEntrustController.class).getOneEntrust(entrust.getPid())).withSelfRel()
                    , linkTo(methodOn(CustomerEntrustController.class).getAllEntrust()).withSelfRel()
            );
        } catch (RuntimeException e) {
            e.printStackTrace();
            return Response.fail(ResponseType.RESOURCE_NOT_EXIST);
        } catch (Exception e) {
            return Response.fail(ResponseType.UNKNOWN_ERROR);
        }
    }

    /**
     * 修改单个委托
     */
    @PutMapping(path = "/projects/{pid}/entrust")
    public @ResponseBody
    JSON replaceEntrust(@PathVariable String pid, @RequestBody Entrust entrust) {
        try {
            Entrust item = entrustService.updateEntrust(pid, entrust);
            return Response.success(item);
        } catch (Exception e) {
            e.printStackTrace();
            return Response.fail(ResponseType.UNKNOWN_ERROR);
        }
    }

    /**
     * 删除单个委托
     */
    @DeleteMapping(path = "/projects/{pid}/entrust")
    public @ResponseBody
    JSON deleteEntrust(@PathVariable String pid) {
        try {
            entrustService.deleteEntrustById(pid);
            return Response.success(null);
        } catch (RuntimeException e) {
            e.printStackTrace();
            return Response.fail(ResponseType.RESOURCE_NOT_EXIST);
        } catch (Exception e) {
            e.printStackTrace();
            return Response.fail(ResponseType.UNKNOWN_ERROR);
        }
    }
}
