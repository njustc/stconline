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

    protected <T extends ProcessEntity> Resource<T> toResource(T processEntity, Object method) {
        Resource<T> resource;
        if (processUtils.isReviewable(processEntity.getProcessInstanceId(), processEntity.getUserId()))
            resource = new Resource<>(processEntity, linkTo(method).withSelfRel());
        else
            resource = new Resource<>(processEntity);
        return resource;
    }

}
