package com.easyvote.function;

import java.util.Map;

import com.easyvote.ao.RegisterUserAo;
import com.easyvote.dto.DetailVoteDto;
import com.easyvote.dto.LoginUserContext;


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
	/**
	 * 用户登陆
	 * @param account
	 * @param password
	 * @return
	 * @throws Exception
	 */
	LoginUserContext login(String account,String password)throws Exception;
	/**
	 * 用户注册
	 * @param ao
	 * @throws Exception
	 */
	void register(RegisterUserAo ao)throws Exception;
	/**
	 * 用户查看投票详情
	 * @param voteId
	 * @return
	 * @throws Exception
	 */
	DetailVoteDto checkVote(String voteId)throws Exception; 
}

