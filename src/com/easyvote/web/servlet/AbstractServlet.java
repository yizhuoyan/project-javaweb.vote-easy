/**
 * 
 */
package com.easyvote.web.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.easyvote.common.core.SystemConstans;
import com.easyvote.common.exception.ThisSystemException;
import com.easyvote.dto.LoginUserContext;

/**
 * @author ben
 * 
 */
public class AbstractServlet extends HttpServlet {
	protected LoginUserContext getUserContext(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		if (session == null) {
			throw new ThisSystemException("无法获取用户上下文");
		}
		LoginUserContext context = (LoginUserContext) session.getAttribute(SystemConstans.SESSION_KEY$LOGIN_USER);
		if (context == null) {
			throw new ThisSystemException("无法获取用户上下文");
		}
		return context;
	}

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String result = null;
		try {
			result = this.handleRequst(req, resp);
			if (result != null) {
				if (result.length() > 0) {
					if (result.charAt(0) == '@') {
						result = result.substring(1);
						resp.sendRedirect(req.getContextPath() + result);
					} else {
						req.getRequestDispatcher(result).forward(req, resp);
					}
				}

			}
		} catch (Exception e) {
			resp.sendError(500);
		}
	}

	protected  String handleRequst(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		return null;
	}


}
