package com.easyvote.common.exception;

public class ThisSystemException extends RuntimeException{
	public static final String FATAL_MESSAGE="网络繁忙,请稍后再试!";
	public ThisSystemException(String message, Throwable cause) {
		super(message, cause);
	}

	public ThisSystemException(String message) {
		super(message);
	}

	
}

