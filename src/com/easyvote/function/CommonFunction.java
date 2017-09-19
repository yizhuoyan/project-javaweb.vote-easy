/**
 * 
 */
package com.easyvote.function;

import java.util.List;

import com.easyvote.ao.ModifyPasswordAo;
import com.easyvote.dto.BreifVoteDto;
import com.easyvote.dto.CarouselVoteDto;
import com.easyvote.dto.VoteTypeDto;

/**
 * @author ben
 *
 */
public interface CommonFunction  {
	//修改密码
	public void modifyPassword(ModifyPasswordAo dto) throws Exception;
	//加载首页轮播数据
	List<CarouselVoteDto> loadCarouseVotes()throws Exception;
	//分页加载最新投票
	List<BreifVoteDto> loadNewVotes(String pageSize,String pageNo)throws Exception;
	//加载投票分类
	List<VoteTypeDto> loadAllVoteTypes()throws Exception;
	
}