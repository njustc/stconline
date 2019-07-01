package com.example.stc.controller;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.stream.Collectors;

import com.example.stc.activiti.ContractAction;
import com.example.stc.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.example.stc.domain.Contract;

/**
 * 客户的合同相关接口
 */
@RestController
public class ContractController extends BaseController {
    @Autowired
    private ContractService contractService;

    @Autowired
    private ContractAction contractAction;

    private static Resource<Contract> toResource(Contract contract) {
        return new Resource<>(contract
                , linkTo(methodOn(ContractController.class).getOneContract(contract.getPid())).withSelfRel()
                , linkTo(methodOn(ContractController.class).getAllContract()).withSelfRel()
                , linkTo(methodOn(UserController.class).getUserDetail(contract.getUser().getUserID())).withSelfRel()
        );
    }

    /**
     * 查看全部合同
     */
    @GetMapping(path = "/contract")
    public @ResponseBody
    Resources<Resource<Contract>> getAllContract() {
        List<Resource<Contract>> contracts = contractService.findAllContracts().stream()
                .map(ContractController::toResource)
                .collect(Collectors.toList());
        return new Resources<>(contracts,
                linkTo(methodOn(ContractController.class).getAllContract()).withSelfRel());
    }

    /**
     * 查看某一用户全部合同
     */
    @GetMapping(path = "/contract/user/{uid}")
    public @ResponseBody
    Resources<Resource<Contract>> getUserContract(@PathVariable String uid) {
        List<Resource<Contract>> contracts = contractService.findAllContracts().stream()
                .map(ContractController::toResource)
                .collect(Collectors.toList());
        return new Resources<>(contracts,
                linkTo(methodOn(ContractController.class).getUserContract(uid)).withSelfRel());
    }

    /**
     * 新建合同
     */
    @PostMapping(path = "/contract")
    public @ResponseBody
    ResponseEntity<?> addNewContract(@RequestBody Contract contract) throws URISyntaxException {
        Resource<Contract> resource = toResource(contractService.newContract(contract));
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 查看单个委托
     */
    @GetMapping(path = "/contract/{pid}")
    public @ResponseBody
    Resource<Contract> getOneContract(@PathVariable String pid) {
        Contract contract = contractService.findContractByPid(pid);
        return toResource(contract);
    }

    /**
     * 修改单个委托
     */
    @PutMapping(path = "/contract/{pid}")
    public @ResponseBody
    ResponseEntity<?> replaceContract(@PathVariable String pid, @RequestBody Contract contract) throws URISyntaxException {
        Contract updatedContract = contractService.updateContract(pid, contract);
        Resource<Contract> resource = toResource(updatedContract);
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 删除单个委托
     */
    @DeleteMapping(path = "/contract/{pid}")
    public @ResponseBody
    ResponseEntity<?> deleteContract(@PathVariable String pid) {
        contractService.deleteContractByPid(pid);
        return ResponseEntity.noContent().build();
    }

    /**
     * 提交合同
     * @param pid
     * @return
     * @throws URISyntaxException
     */
    @PostMapping(path = "/contract/submit")
    public @ResponseBody
    ResponseEntity<?> submitContract(@RequestParam(value = "pid")String pid) throws URISyntaxException {
        Contract contract = contractService.findContractByPid(pid);
        contractAction.submitContractProcess(contract);
        Contract updatedContract = contractService.updateContract(pid, contract);
        Resource<Contract> resource = toResource(updatedContract);
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 评审合同
     * @param comment
     * @param pid
     * @param operation
     * @return
     * @throws URISyntaxException
     */
    @PostMapping(path = "/contract/review")
    public @ResponseBody
    ResponseEntity<?> reviewEntrust(@RequestBody String comment,
                                    @RequestParam(value = "pid") String pid,
                                    @RequestParam(value = "operation") String operation) throws URISyntaxException {
        Contract contract = contractService.findContractByPid(pid);
        contractAction.reviewContractProcess(contract, operation, comment);
        Contract updatedContract = contractService.updateContract(pid, contract);
        Resource<Contract> resource = toResource(updatedContract);
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }
}
