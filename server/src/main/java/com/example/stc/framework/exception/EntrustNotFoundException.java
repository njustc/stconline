package com.example.stc.framework.exception;

import javax.persistence.EntityNotFoundException;

public class EntrustNotFoundException extends EntityNotFoundException {

	public EntrustNotFoundException(String pid) {
		super("Could not find entrust with pid(String) = " + pid);
	}

	public EntrustNotFoundException(long id) {
		super("Could not find entrust with id(long) = " + id);
	}
	
}
