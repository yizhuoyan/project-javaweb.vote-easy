package com.easyvote.common.util;

import javax.servlet.http.HttpServletRequest;

import com.easyvote.common.exception.ThisSystemException;

public class HttpServletRequestHolder {
	final private static ThreadLocal<HttpServletRequest> THREAD_LOCAL$HTTP_REQUEST=new ThreadLocal<>();
	
	public static void hold(HttpServletRequest req) {
		THREAD_LOCAL$HTTP_REQUEST.set(req);
	}
	
	public static HttpServletRequest get() {
		return THREAD_LOCAL$HTTP_REQUEST.get();
	}
	public static void unhold() {
		THREAD_LOCAL$HTTP_REQUEST.remove();
	}
	public static HttpServletRequest load() {
		HttpServletRequest req=THREAD_LOCAL$HTTP_REQUEST.get();
		if(req==null) {
			throw new ThisSystemException("无法加载保持请求！");
		}
		return req;
	}
	
}
