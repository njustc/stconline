package com.example.stc.framework.exception;

public class EntrustNotFoundException extends RuntimeException {

	public EntrustNotFoundException(String pid) {
		super("Could not find entrust with pid(String) = " + pid);
	}

	public EntrustNotFoundException(long id) {
		super("Could not find entrust with id(long) = " + id);
	}
	
}
