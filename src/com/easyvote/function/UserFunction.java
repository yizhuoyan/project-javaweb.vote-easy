package com.easyvote.function;

import java.util.Map;


/**
 * 用户功能
 * @author ben
 *
 */
public interface UserFunction extends CommonFunction{
	/**
	 * 加载首页数据
	 * @return
	 * @throws Exception
	 */
	Map<String,Object> loadIndexPage()throws Exception;
	
	
}

