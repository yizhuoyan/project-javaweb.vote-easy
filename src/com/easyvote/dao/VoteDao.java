package com.easyvote.dao;

import java.util.List;

import com.easyvote.common.dao.TemplateDao;
import com.easyvote.entity.VoteEntity;
import com.easyvote.entity.VoteOptionEntity;

public interface VoteDao  extends TemplateDao<VoteEntity>{

	public List<VoteEntity> selectsNewest(int pageSize,int pageNo)throws Exception;
	
	public List<VoteOptionEntity> selectOptions(String voteId)throws Exception;
}
