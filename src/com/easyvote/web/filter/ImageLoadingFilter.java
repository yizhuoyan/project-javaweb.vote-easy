package com.easyvote.web.filter;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ImageLoadingFilter extends AbstractFilter {
	private String actualPath;

	public void setActualPath(String actualPath) {
		if(actualPath.charAt(actualPath.length()-1)=='/') {
			actualPath=actualPath.substring(0, actualPath.length()-1);
		}
		this.actualPath = actualPath;
	}
	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain) throws Exception {
		String uri=req.getRequestURI();
		//1获取图片路径
		String imgName=uri.substring(req.getContextPath().length());
		String actualImagePath=this.actualPath+imgName;
		this.application.log("图片路径"+uri+"转换为"+actualImagePath);
		req.getRequestDispatcher(actualImagePath).forward(req, resp);
	}

	
}
