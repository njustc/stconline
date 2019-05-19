package com.example.stc.advice;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.example.stc.exception.EntrustNotFoundException;

@ControllerAdvice
public class EntrustNotFoundAdvice {
	
	@ResponseBody
	@ExceptionHandler(EntrustNotFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	private String entrustNotFoundHandler(EntrustNotFoundException e) {
		return e.getMessage();
	}
	
}
