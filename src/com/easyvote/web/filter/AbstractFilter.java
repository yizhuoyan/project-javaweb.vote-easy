package com.easyvote.web.filter;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easyvote.common.util.HttpServletRequestHolder;

public abstract class AbstractFilter implements Filter{
	protected ServletContext application;
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		try {
			req.setCharacterEncoding("utf-8");
			resp.setCharacterEncoding("utf-8");
			HttpServletRequestHolder.hold((HttpServletRequest)req);
			this.doFilter((HttpServletRequest)req, (HttpServletResponse)resp, chain);
		}catch(Exception e) {
			throw new ServletException(e);
		}finally {
			HttpServletRequestHolder.unhold();
		}
	}
	public abstract void doFilter(HttpServletRequest req,HttpServletResponse resp,FilterChain chain)throws Exception;

	@Override
	public void init(FilterConfig config) throws ServletException {
		this.application=config.getServletContext();
		try {
			Method[] methods = this.getClass().getMethods();
			String methodName = null;
			for (Method method : methods) {
				methodName = method.getName();
				if (methodName.startsWith("set")) {
					String paramName = methodName2paramName(methodName);
					String paramValue = config.getInitParameter(paramName);
					method.invoke(this, paramValue);
				}
			}
		} catch (Exception e) {
			throw new ServletException(e);
		}
	}

	private final String methodName2paramName(String methodName) {
		char[] cs = methodName.toCharArray();
		cs[3] += 32;
		// erase 'set'
		return new String(cs, 3, cs.length-3);
	}

	@Override
	public void destroy() {

	}
}
