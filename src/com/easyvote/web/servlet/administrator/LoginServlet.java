package com.easyvote.web.servlet.administrator;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easyvote.common.FunctionFactory;
import com.easyvote.common.core.SystemConstans;
import com.easyvote.common.exception.ThisSystemException;
import com.easyvote.dto.LoginUserContext;
import com.easyvote.function.AdministratorFunction;
@WebServlet("/admin/login.do")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.getRequestDispatcher("/jsp/admin/login.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			String account=req.getParameter("account");
			String password=req.getParameter("password");
			//业务对象
			AdministratorFunction fun=FunctionFactory.getFunction(AdministratorFunction.class);
			LoginUserContext context=fun.login(account, password);
			//保存姓名
			HttpSession session=req.getSession();
			session.setAttribute(SystemConstans.SESSION_KEY$LOGIN_USER,context);
			resp.sendRedirect(req.getContextPath()+"/jsp/admin/index.jsp");
			return;
		}catch(ThisSystemException e){
			req.setAttribute("message", e.getMessage());
		}catch (Exception e) {
			req.setAttribute("message","网络繁忙,请稍后");
			e.printStackTrace();
		}
		req.getRequestDispatcher("/jsp/admin/login.jsp").forward(req, resp);
	}
	
}
