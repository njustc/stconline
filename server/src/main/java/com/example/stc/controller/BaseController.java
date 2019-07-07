package com.example.stc.controller;

import com.example.stc.domain.ProcessEntity;
import com.example.stc.framework.util.ProcessUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.mvc.ControllerLinkBuilder;
import org.springframework.web.bind.annotation.RequestMapping;

import static org.springframework.hateoas.mvc.ControllerLinkBuilder.linkTo;
import static org.springframework.hateoas.mvc.ControllerLinkBuilder.methodOn;

@RequestMapping(path = "/api/project")
public class BaseController {

    @Autowired
    private ProcessUtils processUtils;

    protected <T extends ProcessEntity> Resource<T> toResource(T processEntity, Object method1, Object method2) {
        if (method2 == null)
            return new Resource<>(processEntity, linkTo(method1).withSelfRel());
        if (processUtils.isReviewable(processEntity.getProcessInstanceId(), processEntity.getUserId()))
            return new Resource<>(processEntity, linkTo(method1).withSelfRel(), linkTo(method2).withSelfRel());
        else
            return new Resource<>(processEntity, linkTo(method1).withSelfRel());
    }

}
