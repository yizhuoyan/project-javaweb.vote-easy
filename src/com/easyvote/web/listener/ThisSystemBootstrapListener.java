/**
 * 
 */
package com.easyvote.web.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.easyvote.common.dao.DBUtil;

/**
 * @author ben
 * 
 */
public class ThisSystemBootstrapListener implements ServletContextListener {
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
	}

	@Override
	public void contextInitialized(ServletContextEvent evt) {
		ServletContext sc = evt.getServletContext();

		try {
			//this.loadAllQuestionCategories(sc);
		} catch (Exception e) {
			System.err.println("系统启动出现错误");
			e.printStackTrace();
		}finally{
			DBUtil.closeConnection();
		}
	}

	

}
