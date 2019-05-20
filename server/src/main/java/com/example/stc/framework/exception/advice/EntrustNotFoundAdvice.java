package com.example.stc.framework.exception.advice;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.example.stc.framework.exception.EntrustNotFoundException;

import javax.persistence.EntityExistsException;
import javax.persistence.EntityNotFoundException;

@ControllerAdvice
public class EntrustNotFoundAdvice {

    /**
     * 用于委托不存在的异常返回
     */
    @ResponseBody
    @ExceptionHandler(EntrustNotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    private String entrustNotFoundHandler(RuntimeException e) {
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

    /**
     * 资源不存在
     */
    @ResponseBody
    @ExceptionHandler(EntityNotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    private String entityNotFoundHandler(RuntimeException e) {
        return e.getMessage();
    }

    /**
     * 资源已存在
     */
    @ResponseBody
    @ExceptionHandler({EntityExistsException.class})
    @ResponseStatus(HttpStatus.FOUND)
    private String entityExistHandler(RuntimeException e) {
        return e.getMessage();
    }
}
