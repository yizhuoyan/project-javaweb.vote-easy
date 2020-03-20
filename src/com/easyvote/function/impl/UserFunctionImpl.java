/**
 * 
 */
package com.easyvote.function.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.easyvote.ao.RegisterUserAo;
import com.easyvote.common.exception.ThisSystemException;
import com.easyvote.dto.CarouselVoteDto;
import com.easyvote.dto.DetailVoteDto;
import com.easyvote.dto.LoginUserContext;
import com.easyvote.entity.UserEntity;
import com.easyvote.function.UserFunction;

/**
 * @author ben
 * 
 */
public class UserFunctionImpl extends CommonFunctionImpl implements
		UserFunction {

	@Override
	public Map<String, Object> loadIndexPage() throws Exception {
		List<CarouselVoteDto> carouselVotes= this.loadCarouseVotes();
		Map<String,Object> result=new HashMap<>();
		result.put("carouselVotes", carouselVotes);
		return result;
	}

	@Override
	public LoginUserContext login(String account, String password) throws Exception {
		account=$("账号不能为空",account);
		password=$("密码不能为空",password);
		
		UserEntity u=this.userDao.select("account", account);
		
		if(u==null||!u.getPassword().equals(password)) {
			throw new ThisSystemException("账号和密码不匹配");
		}
		LoginUserContext uc=new LoginUserContext();
		uc.setAccount(account);
		uc.setId(u.getId());
		uc.setName(u.getName());
		
		
		
		return uc;
	}

	@Override
	public void register(RegisterUserAo ao) throws Exception {
		
	}
	@Override
	public DetailVoteDto checkVote(String voteId) throws Exception {
		return null;
	}
}
