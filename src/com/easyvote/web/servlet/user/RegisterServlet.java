package com.easyvote.web.servlet.user;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easyvote.common.exception.ThisSystemException;
import com.easyvote.dto.LoginUserContext;
import com.easyvote.function.UserFunction;
import com.easyvote.web.servlet.AbstractServlet;
@WebServlet({"/register.html","/register.do"})
public class RegisterServlet extends AbstractServlet {
	private UserFunction  fun;
	@Override
	protected String handleRequst(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getRequestURI().endsWith(".html")) {
			//getView
			return "/user/register.jsp";
		}else {
			try {
				String account=req.getParameter("account");
				String password=req.getParameter("password");
				LoginUserContext uc=fun.login(account,password);
				super.saveUserContext(uc);
				return "@/login.html";
			}catch(ThisSystemException e) {
				return "/register.html";
			}
		}
	}
	
}
