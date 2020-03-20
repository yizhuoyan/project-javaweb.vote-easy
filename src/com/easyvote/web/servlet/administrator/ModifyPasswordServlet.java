package com.easyvote.web.servlet.administrator;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easyvote.ao.ModifyPasswordAo;
import com.easyvote.common.FunctionFactory;
import com.easyvote.common.exception.ThisSystemException;
import com.easyvote.dto.LoginUserContext;
import com.easyvote.function.AdministratorFunction;
import com.easyvote.web.servlet.AbstractServlet;
@WebServlet("/admin/modifyPassword.do")
public class ModifyPasswordServlet extends AbstractServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.getRequestDispatcher("/jsp/admin/modifyPassword.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			String oldPassword=req.getParameter("oldPassword");
			String newPassword=req.getParameter("newPassword");
			String newPasswordConfirm=req.getParameter("newPasswordConfirm");
			ModifyPasswordAo dto=new ModifyPasswordAo();
			dto.setOldPassword(oldPassword);
			dto.setNewPassword(newPassword);
			dto.setNewPasswordConfirm(newPasswordConfirm);
			//session
			LoginUserContext context=this.getUserContext();
			dto.setAccount(context.getAccount());
			//业务对象
			AdministratorFunction fun=FunctionFactory.getFunction(AdministratorFunction.class);
			fun.modifyPassword(dto);
			req.getSession().setAttribute("message", "修改成功,请重新登录");
			resp.sendRedirect(req.getContextPath()+"/jsp/admin/login.jsp");
			return;
		}catch(ThisSystemException e){
			req.setAttribute("message", e.getMessage());
		}catch (Exception e) {
			req.setAttribute("message","网络繁忙,请稍后");
			e.printStackTrace();
		}
		req.getRequestDispatcher("/jsp/admin/modifyPassword.jsp").forward(req, resp);
	}
	
}
