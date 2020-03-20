package com.easyvote.web.servlet.user;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easyvote.web.servlet.AbstractServlet;
@WebServlet("/vote/*")
public class DetailVoteServlet extends AbstractServlet{
		
	@Override
	protected String handleRequst(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String id=this.getVoteId(req);
		
		return "/user/vote/vote-detail.jsp";
	}
	private String getVoteId(HttpServletRequest req) {
		String uri=req.getRequestURI();
		return null;
	}
}
