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
 * 客户类用户的委托相关接口
 */
@RestController
//@RequestMapping(path = "/api/customers") // 当前不考虑登录问题
//@RequestMapping(path="/api/customers/{cid}") //考虑登录问题时的接口前缀
public class CustomerEntrustController extends BaseController {

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
    Resources<Resource<Entrust>> getAllEntrust() {
        List<Resource<Entrust>> entrusts = entrustService.findAllEntrusts().stream()
                .map(entrust -> toResource(entrust))
                .collect(Collectors.toList());
        return new Resources<>(entrusts,
                linkTo(methodOn(CustomerEntrustController.class).getAllEntrust()).withSelfRel());
    }

    /**
     * 新建委托
     *
     * @return
     * @throws URISyntaxException
     */
    @PostMapping(path = "/projects")
    public @ResponseBody
    ResponseEntity<?> addNewEntrust(@RequestBody Entrust entrust) throws URISyntaxException {
        Resource<Entrust> resource = toResource(entrustService.newEntrust(entrust));
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 查看单个委托
     */
    @GetMapping(path = "/projects/{pid}/entrust")
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
    @PutMapping(path = "/projects/{pid}/entrust")
    public @ResponseBody
    ResponseEntity<?> replaceEntrust(@PathVariable String pid, @RequestBody Entrust entrust) throws URISyntaxException {
        Entrust updatedEntrust = entrustService.updateEntrust(pid, entrust);
        Resource<Entrust> resource = toResource(updatedEntrust);
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 删除单个委托
     */
    @DeleteMapping(path = "/projects/{pid}/entrust")
    public @ResponseBody
    ResponseEntity<?> deleteEntrust(@PathVariable String pid) {
        entrustService.deleteEntrustById(pid);
        return ResponseEntity.noContent().build();
    }
}
