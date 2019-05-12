package com.example.stc.controller;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

import java.util.List;
import java.util.stream.Collectors;

import com.example.stc.service.EntrustService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.web.bind.annotation.*;

import com.example.stc.domain.Entrust;
import com.example.stc.repository.EntrustRepository;

/**
 * 客户类用户的委托相关接口
 */
@RestController
@RequestMapping(path = "/api/customers") // 当前不考虑登录问题
//@RequestMapping(path="/api/customers/{cid}") //考虑登录问题时的接口前缀
public class CustomerEntrustController {

    @Autowired
    private EntrustRepository entrustRepository;
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
    List<Resource<Entrust>> getAllEntrust() {
        return entrustService.findAllEntrusts().stream()
                .map(entrust -> toResource(entrust))
                .collect(Collectors.toList());
    }

    /**
     * 新建委托
     */
    @PostMapping(path = "/projects")
    public @ResponseBody
    Entrust addNewEntrust(@RequestBody Entrust entrust) {
        entrust = entrustService.insertEntrust(entrust);
        return entrust;
    }

    /**
     * 查看单个委托
     */
    @GetMapping(path = "/projects/{pid}/entrust")
    public @ResponseBody
    Resource<Entrust> getOneEntrust(@PathVariable String pid) {
        Entrust entrust=entrustService.findEntrustById(pid);
        return toResource(entrust);
    }

    /**
     * 修改单个委托
     */
    @PutMapping(path = "/projects/{pid}/entrust")
    public @ResponseBody
    Entrust replaceEntrust(@PathVariable String pid, @RequestBody Entrust entrust) {
        return entrustService.updateEntrust(pid,entrust);
    }

    /**
     * 删除单个委托
     */
    @DeleteMapping(path = "/projects/{pid}/entrust")
    public @ResponseBody
    void deleteEntrust(@PathVariable String pid) {
        entrustService.deleteEntrustById(pid);
    }
}
