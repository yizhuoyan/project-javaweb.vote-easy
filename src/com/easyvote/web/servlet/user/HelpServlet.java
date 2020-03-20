package com.easyvote.web.servlet.user;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easyvote.web.servlet.AbstractServlet;
@WebServlet("/help.html")
public class HelpServlet extends AbstractServlet {
	@Override
	protected String handleRequst(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		return "/user/help.jsp";
	}
}
