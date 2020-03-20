/**
 * 
 */
package com.easyvote.web.servlet.user;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.easyvote.common.FunctionFactory;
import com.easyvote.function.UserFunction;

/**
 * @author ben
 *首页
 */
@WebServlet("/index.html")
public class IndexServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try{
			UserFunction function=FunctionFactory.getFunction(UserFunction.class);
			Map<String,Object> data=function.loadIndexPage();
			//轮播数据
			req.setAttribute("CAROUSEL_ITEMS",data.get("carouselVotes"));
			req.getRequestDispatcher("/user/index.jsp").forward(req, resp);
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
	
}
