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
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;

import com.example.stc.domain.Contract;

/**
 * 客户的合同相关接口
 */
@RestController
public class ContractController extends BaseController {

    @Autowired
    private ContractService contractService;

    private static Resource<Contract> toResource(Contract contract) {
        return new Resource<>(contract
                , linkTo(methodOn(ContractController.class).getOneContract(contract.getPid())).withSelfRel()
                , linkTo(methodOn(ContractController.class).getAllContract()).withSelfRel()
                , linkTo(methodOn(UserController.class).getUserDetail(contract.getUserId())).withSelfRel()
        );
    }

    /**
     * 查看全部合同
     */
    @Secured({"ROLE_CUS", "ROLE_SS", "ROLE_SM", "ROLE_QM"})
    @GetMapping(path = "/contract")
    public @ResponseBody
    Resources<Resource<Contract>> getAllContract() {
        List<Resource<Contract>> contracts = contractService.findContractsByAuthority().stream()
                .map(ContractController::toResource)
                .collect(Collectors.toList());
        return new Resources<>(contracts,
                linkTo(methodOn(ContractController.class).getAllContract()).withSelfRel());
    }

    /**
     * 查看某一用户全部合同
     * 专门用于 STAFF 角色查询某一个用户的合同列表
     */
    @Secured({"ROLE_SS", "ROLE_SM", "ROLE_QM"})
    @GetMapping(path = "/contract/user/{uid}")
    public @ResponseBody
    Resources<Resource<Contract>> getUserContract(@PathVariable String uid) {
        List<Resource<Contract>> contracts = contractService.findContractByUser(uid).stream()
                .map(ContractController::toResource)
                .collect(Collectors.toList());
        return new Resources<>(contracts,
                linkTo(methodOn(ContractController.class).getUserContract(uid)).withSelfRel());
    }

    /**
     * 新建合同
     */
    @Secured({"ROLE_SS"}) // 市场部工作人员
    @PostMapping(path = "/contract/{pid}")
    public @ResponseBody
    ResponseEntity<?> addNewContract(@PathVariable String pid, @RequestParam String uid) throws URISyntaxException {
        Resource<Contract> resource = toResource(contractService.newContract(pid, uid));
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 查看单个合同
     */
    @Secured({"ROLE_CUS", "ROLE_SS", "ROLE_SM", "ROLE_QM"})
    @GetMapping(path = "/contract/{pid}")
    public @ResponseBody
    Resource<Contract> getOneContract(@PathVariable String pid) {
        Contract contract = contractService.findContractByPid(pid);
        return toResource(contract);
    }

    /**
     * 修改单个合同
     */
    @Secured({"ROLE_SS"}) // 市场部工作人员
    @PutMapping(path = "/contract/{pid}")
    public @ResponseBody
    ResponseEntity<?> replaceContract(@PathVariable String pid, @RequestBody Contract contract) throws URISyntaxException {
        Contract updatedContract = contractService.updateContract(pid, contract);
        Resource<Contract> resource = toResource(updatedContract);
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 合同废止。删除合同的同时应删除对应的委托，测试方案等
     */
    @Secured({"ROLE_CUS", "ROLE_SM", "ROLE_QM"})
    @DeleteMapping(path = "/contract/{pid}")
    public @ResponseBody
    ResponseEntity<?> deleteContract(@PathVariable String pid) {
        contractService.deleteContractByPid(pid);
        return ResponseEntity.noContent().build();
    }
}
