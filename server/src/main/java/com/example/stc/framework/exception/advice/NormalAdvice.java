package com.example.stc.framework.exception.advice;

import com.example.stc.framework.exception.FunctionNotFoundException;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

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

    @ResponseBody
    @ExceptionHandler(AccessDeniedException.class)
    @ResponseStatus(HttpStatus.UNAUTHORIZED)
    private String unauthorizedHandler(AccessDeniedException e){
        return e.getMessage();
    }
    /**
     * 资源已存在
     */
    @ResponseBody
    @ExceptionHandler({EntityExistsException.class})
    @ResponseStatus(HttpStatus.FOUND)
    private String entityExistHandler(EntityExistsException e) {
        return e.getMessage();
    }

    /**
     * 未知错误
     */
    @ResponseBody
    @ExceptionHandler(Exception.class)
    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    private String exceptionHandler(Exception e) {
        return e.getMessage();
    }
}
