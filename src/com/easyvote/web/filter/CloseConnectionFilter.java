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
public class CloseConnectionFilter extends AbstractFilter {


	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain) throws Exception {
		try{
			chain.doFilter(req, resp);
		}finally{
			DBUtil.closeConnection();
		}
	}

	

	
}
