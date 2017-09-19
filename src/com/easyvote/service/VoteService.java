package com.easyvote.service;

import com.easyvote.dao.SysDicDao;
import com.easyvote.entity.SysDicEntity;
import com.easyvote.entity.UserEntity;
import com.easyvote.entity.VoteEntity;
import com.easyvote.entity.VoteTypeEntity;
import com.easyvote.function.impl.AbstractFunction;

public class VoteService extends AbstractFunction {
	private static class OnlyInstanceHoler{
		public static VoteService service=new VoteService();
	}
	public static VoteService getService() {
		return OnlyInstanceHoler.service;
	}
	//cache
	
	
	/**
	 * 通过id加载Vote
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public VoteEntity load(String id)throws Exception{
		VoteEntity v=voteDao.select("id",id);
		UserEntity createUser=userDao.select("id", v.getCreateUserId());
		v.setCreateUser(createUser);
		SysDicEntity voteTypeDic=this.dicDao.select("id", v.getVoteTypeId());
		VoteTypeEntity voteType=new VoteTypeEntity();
		voteType.setCode(voteTypeDic.getItemValue(0));
		voteType.setName(voteTypeDic.getItemValue(1));
		voteType.setId(voteTypeDic.getId());
		v.setVoteType(voteType);
		return v;
	}
}

