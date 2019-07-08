package com.example.stc.framework.exception.advice;

import com.example.stc.framework.exception.ParamMissingException;
import org.activiti.engine.ActivitiException;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityExistsException;
import javax.persistence.EntityNotFoundException;

@ControllerAdvice
public class NormalAdvice {
    /**
     * 用于资源不存在的异常返回
     * 可以直接利用多态, 让NotFound这一类的异常继承自 EntityNotFoundException
     * 统一处理
     */
    @ResponseBody
    @ExceptionHandler(EntityNotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    private String entityNotFoundHandler(EntityNotFoundException e) {
        return e.getMessage();
    }

    /**
     * 未认证
     * 认证失败
     */
    @ResponseBody
    @ExceptionHandler(AuthenticationException.class)
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    private String unauthorizedHandler(AuthenticationException e) {
        return e.getMessage();
    }

    /**
     * 无权限访问
     */
    @ResponseBody
    @ExceptionHandler(AccessDeniedException.class)
    @ResponseStatus(HttpStatus.FORBIDDEN)
    private String forbiddenHandler(AccessDeniedException e) {
        return e.getMessage();
    }

    /**
     * 资源已存在
     */
    @ResponseBody
    @ExceptionHandler({EntityExistsException.class})
    @ResponseStatus(HttpStatus.METHOD_NOT_ALLOWED)
    private String entityExistHandler(EntityExistsException e) {
        return e.getMessage();
    }

    /**
     * 请求信息有误
     */
    @ResponseBody
    @ExceptionHandler({ParamMissingException.class})
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    private String rapamMissExceptionHandler(ParamMissingException e) {
        return e.getMessage();
    }

    /**
     * 流程调用错误
     */
    @ResponseBody
    @ExceptionHandler({ActivitiException.class})
    @ResponseStatus(HttpStatus.CONFLICT)
    private String activitiExceptionHandler(ActivitiException e) {
        e.printStackTrace();
        return e.getMessage();
    }

    /**
     * 未知错误
     */
    @ResponseBody
    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    private String exceptionHandler(Exception e) {
        e.printStackTrace();
        return e.getMessage();
    }
}
