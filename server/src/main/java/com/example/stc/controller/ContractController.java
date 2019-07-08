package com.example.stc.controller;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.stream.Collectors;

import com.example.stc.activiti.ProcessState;
import com.example.stc.domain.Role;
import com.example.stc.domain.User;
import com.example.stc.framework.util.AuthorityUtils;
import com.example.stc.framework.util.ProcessUtils;
import com.example.stc.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.annotation.Secured;
import org.springframework.web.bind.annotation.*;

import com.example.stc.domain.Contract;

/**
 * 客户的合同相关接口
 */
@RestController
public class ContractController extends BaseController {

    Logger logger = LoggerFactory.getLogger(ContractController.class);

    @Autowired
    private ContractService contractService;

    /**
     * 查看全部合同
     * CUS, SS, SM, QM可随时查看
     */
    @Secured({"ROLE_CUS", "ROLE_SS", "ROLE_SM", "ROLE_QM"})
    @GetMapping(path = "/contract")
    public @ResponseBody
    Resources<Resource<Contract>> getAllContract() {
        List<Resource<Contract>> contracts = contractService.findContractsByAuthority().stream()
                .map(contract -> toResource(contract, methodOn(ContractController.class).getAllContract(), null))
                .collect(Collectors.toList());
        logger.info("getAllContract: 最终查询合同数：" + contracts.size());
        return new Resources<>(contracts,
                linkTo(methodOn(ContractController.class).getAllContract()).withSelfRel());
    }

    /**
     * 查看全部待办合同
     * CUS, SS, SM, QM可随时查看
     */
    @Secured({"ROLE_CUS", "ROLE_SS", "ROLE_SM", "ROLE_QM"})
    @GetMapping(path = "/contract/todo")
    public @ResponseBody
    Resources<Resource<Contract>> getAllToDoContract() {
        List<Resource<Contract>> contracts = contractService.findToDoContractsByAuthority().stream()
                .map(contract -> toResource(contract, methodOn(ContractController.class).getAllContract(), null))
                .collect(Collectors.toList());
        logger.info("getAllToDoContract: 最终查询合同数：" + contracts.size());
        return new Resources<>(contracts,
                linkTo(methodOn(ContractController.class).getAllToDoContract()).withSelfRel());
    }

    /**
     * 查看某一用户全部合同
     * 专门用于 STAFF 角色查询某一个用户的合同列表
     */
    @Deprecated
    @Secured({"ROLE_SS", "ROLE_SM", "ROLE_QM"})
    @GetMapping(path = "/contract/user/{uid}")
    public @ResponseBody
    Resources<Resource<Contract>> getUserContract(@PathVariable String uid) {
        List<Resource<Contract>> contracts = contractService.findContractByUser(uid).stream()
                .map(contract -> toResource(contract, methodOn(ContractController.class).getUserContract(uid), null))
                .collect(Collectors.toList());
        return new Resources<>(contracts,
                linkTo(methodOn(ContractController.class).getUserContract(uid)).withSelfRel());
    }

    /**
     * 自动新建合同
     */
    @PostMapping(path = "/contract/{pid}")
    public @ResponseBody
    ResponseEntity<?> addNewContract(@PathVariable String pid, @RequestParam String uid) throws URISyntaxException {
        logger.info("addNewContract");
        Resource<Contract> resource = toResource(contractService.newContract(pid, uid)
                , methodOn(ContractController.class).addNewContract(pid, uid), null);
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 查看单个合同
     * CUS, SS, SM, QM可查看；
     * CUS仅Review的客户确认阶段之后；
     * SS可随时查看；
     * SM, QM仅Review和Approve阶段查看
     */
    @Secured({"ROLE_CUS", "ROLE_SS", "ROLE_SM", "ROLE_QM"})
    @GetMapping(path = "/contract/{pid}")
    public @ResponseBody
    Resource<Contract> getOneContract(@PathVariable String pid) {
        Contract contract = contractService.findContractByPid(pid);
        authorityUtils.customerAccessCheck(contract); // 若为客户，只能访问本人的合同
        authorityUtils.stateAccessCheck(contract, "CUS", "Review,Approve", "查看"); // 若为客户，只能在客户确认阶段查看
        authorityUtils.stateAccessCheck(contract, "SM,QM", "Review,Approve", "查看"); // 若为SM, QM，Review和Approve阶段
        logger.info("getOneContract");
        return this.toResource(contract, methodOn(ContractController.class).getOneContract(pid)
                , methodOn(ContractController.class).getAllContract());
    }

    /**
     * 修改单个合同
     * 仅SS在Submit阶段可修改
     */
    @Secured({"ROLE_SS"}) // 市场部工作人员
    @PutMapping(path = "/contract/{pid}")
    public @ResponseBody
    ResponseEntity<?> replaceContract(@PathVariable String pid, @RequestBody Contract contract) throws URISyntaxException {
        Contract updatedContract = contractService.updateContract(pid, contract);
        authorityUtils.stateAccessCheck(contract, "SS", "Submit", "修改"); // 工作人员仅提交前可修改
        logger.info("replaceContract");
        Resource<Contract> resource = toResource(updatedContract
                , methodOn(ContractController.class).replaceContract(pid, contract), null);
        return ResponseEntity.created(new URI(resource.getId().expand().getHref())).body(resource);
    }

    /**
     * 合同废止。删除合同的同时应删除对应的委托，测试方案等
     * 仅CUS, SM, QM在Review阶段可废止
     */
    @Secured({"ROLE_CUS", "ROLE_SM", "ROLE_QM"})
    @DeleteMapping(path = "/contract/{pid}")
    public @ResponseBody
    ResponseEntity<?> deleteContract(@PathVariable String pid) {
        Contract contract = contractService.findContractByPid(pid);
        if (contract.getProcessState() == ProcessState.Approve) {
            logger.info("deleteContract: 废止失败，合同已生效");
            throw new AccessDeniedException("废止失败，合同已生效");
        }
        authorityUtils.customerAccessCheck(contract); // 若为客户，只能访问本人的合同
        authorityUtils.stateAccessCheck(contract, "CUS", "Review", "废止"); // 若为客户，只能在客户确认阶段废止
        authorityUtils.stateAccessCheck(contract, "SM,QM", "Review", "废止"); // 若为SM, QM，仅Review阶段
        contractService.deleteContractByPid(pid);
        logger.info("deleteContract");
        return ResponseEntity.noContent().build();
    }

}
