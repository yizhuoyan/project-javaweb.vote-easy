package com.easyvote.web.filter;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.FilterChain;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easyvote.common.core.SystemConstans;

public class AuthorizeFilter extends AbstractFilter {
	private Set<String> whiteURLs;
	private String notLoginPath;

	public void setWhiteURLs(String urls) {
		urls = urls.trim();
		String[] urlArray = urls.split("\\s+");
		this.whiteURLs = new HashSet<>(Arrays.asList(urlArray));
		this.application.log("加载白名单url为" + this.whiteURLs);
	}

	public void setNotLoginPath(String notLoginPath) {
		if (notLoginPath == null) {
			notLoginPath = "/login.jsp";
		}
		this.notLoginPath = notLoginPath;
	}

	/**
	 * 如果未登录,则仅有白名单可以通过
	 */
	@Override
	public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain) throws Exception {
		// 是否是白名单
		String url = req.getRequestURI();
		if (whiteURLs.contains(url)) {
			// 请求直接通过
			chain.doFilter(req, resp);
			return;
		} 
		HttpSession session = req.getSession();
		Object authorizeValue = session.getAttribute(SystemConstans.SESSION_KEY$LOGIN_USER);
		if (authorizeValue != null) {
			// 请求直接通过
			chain.doFilter(req, resp);
			return;
		}
		// 未登录
		session.setAttribute("message", "请先登录");
		resp.sendRedirect(resp.encodeRedirectURL(req.getContextPath() + this.notLoginPath));
	}
}
