package com.easyvote.function;

import com.easyvote.dto.LoginUserContext;
import com.easyvote.entity.AdministratorEntity;

/**
 * 管理员功能 问卷类别管理 增删改查 问卷管理
 * 
 * 投票管理
 * 
 * 个人中心
 * 
 * @author ben
 * 
 */

public interface AdministratorFunction extends CommonFunction {
	
	public LoginUserContext login(String account,String password)throws Exception;
	
}
