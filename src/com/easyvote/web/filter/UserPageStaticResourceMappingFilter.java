package com.easyvote.web.filter;

import java.io.IOException;


import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easyvote.common.dao.DBUtil;
/**
 * 前台界面静态资源（js,css,font等）路径映射
 * @author Administrator
 *
 */
public class UserPageStaticResourceMappingFilter extends AbstractFilter {
	private String staticResourceDir;
	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain) throws Exception {
		String uri=req.getRequestURI();//
		//去掉应用名称
		uri=uri.substring(req.getContextPath().length());
		//改变实际路径
		String actualPath=this.staticResourceDir+uri;
		//内部跳转
		req.getRequestDispatcher(actualPath).forward(req, resp);
		this.application.log("静态资源路径"+uri+"转换为"+actualPath);
	}
	public void setStaticResourceDir(String dir) {
		if(dir.charAt(dir.length()-1)=='/') {
			dir=dir.substring(0, dir.length()-1);
		}
		this.staticResourceDir = dir;
	}

	

	
}
