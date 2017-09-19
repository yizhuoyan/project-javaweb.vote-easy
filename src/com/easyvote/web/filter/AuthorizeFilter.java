package com.easyvote.web.filter;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easyvote.common.core.SystemConstans;

public class AuthorizeFilter implements Filter {
	private Set<String> whiteURLs;
	private String notLoginPath;
	
	@Override
	public void init(FilterConfig config) throws ServletException {
		String urlString=config.getInitParameter("white-urls");
		urlString=urlString.trim();
		String[] urls=urlString.split("\\s+");
		this.whiteURLs=new HashSet<>(Arrays.asList(urls));
		config.getServletContext().log("加载白名单url为"+this.whiteURLs);
		String notLoginPath=config.getInitParameter("notLogin");
		if(notLoginPath==null){
			notLoginPath="/login.jsp";
		}
		this.notLoginPath=notLoginPath;
	}
	

	@Override
	/**
	 * 如果未登录,则仅有白名单可以通过
	 */
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse resp=(HttpServletResponse)response;
		//把请求转到下一个节点
		//是否是白名单
		String url=req.getRequestURI();
		if(whiteURLs.contains(url)){
			//请求直接通过
			chain.doFilter(req, resp);
		}else{
			HttpSession session=req.getSession();
			Object authorizeValue=session.getAttribute(SystemConstans.SESSION_KEY$LOGIN_USER);
			if(authorizeValue==null){
				session.setAttribute("message", "请先登录");
				resp.sendRedirect(resp.encodeRedirectURL(req.getContextPath()+this.notLoginPath));
				//未登录
			}else{
				//请求直接通过
				chain.doFilter(req, resp);
			}
		}
		
	}

	@Override
	public void destroy() {
		this.notLoginPath=null;
		this.whiteURLs=null;
	}
}
