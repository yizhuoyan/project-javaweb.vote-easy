/**
 * 
 */
package com.easyvote.function.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.easyvote.ao.ModifyPasswordAo;
import com.easyvote.dto.BreifVoteDto;
import com.easyvote.dto.CarouselVoteDto;
import com.easyvote.dto.VoteTypeDto;
import com.easyvote.entity.SysDicEntity;
import com.easyvote.entity.UserEntity;
import com.easyvote.entity.VoteEntity;
import com.easyvote.function.CommonFunction;
import com.easyvote.service.VoteService;

/**
 * @author ben
 *
 */
public class CommonFunctionImpl extends AbstractFunction implements CommonFunction {
	private VoteService voteService=new VoteService();
	@Override
	public List<VoteTypeDto> loadAllVoteTypes() throws Exception {
		List<SysDicEntity> items = dicDao.select("");
		List<VoteTypeDto> result = new ArrayList<>();
		for (SysDicEntity item : items) {
			VoteTypeDto dto = new VoteTypeDto();
			dto.setCode(item.getItemValue(0));
			dto.setName(item.getItemValue(1));
			dto.setId(item.getId());
			result.add(dto);
		}
		return result;
	}

	public void modifyPassword(ModifyPasswordAo dto) throws Exception {
		String account = checkNotBlank("请指定账号", dto.getAccount());
		String newPassword = checkNotBlank("新密码必须指定", dto.getNewPassword());
		checkEquals("两次密码必须一致", newPassword, dto.getNewPasswordConfirm());
		UserEntity user = userDao.select("account", account);
		checkEquals("旧密码不正确", dto.getOldPassword(), user.getPassword());
		checkNotEquals("新密码不能和旧密码一致", newPassword, user.getPassword());
		user.setPassword(newPassword);
		Map<String, Object> dataMap = new HashMap<>();
		dataMap.put("password", newPassword);
		userDao.update(user.getId(), dataMap);
	}

	

	@Override
	public List<CarouselVoteDto> loadCarouseVotes() throws Exception {
		List<SysDicEntity> items = this.dicDao.select("CAROUSEL-VOTE");
		List<CarouselVoteDto> result = new ArrayList<>(items.size());
		for (SysDicEntity item : items) {
			VoteEntity vote = this.voteService.load(item.getItemName());
			if (vote == null)
				continue;
			CarouselVoteDto dto = new CarouselVoteDto();
			dto.setCreateTime(vote.getTimeCreate());
			dto.setId(vote.getId());
			dto.setLogo(vote.getLogo());
			dto.setTitle(vote.getTitle());
			dto.setTotalBrowses(vote.getTotalBrowses());
			dto.setTotalVotes(vote.getTotalVotes());
			dto.setUserId(vote.getCreateUser().getId());
			dto.setUserName(vote.getCreateUser().getName());
			dto.setVoteType(vote.getVoteType());
			result.add(dto);
		}
		return result;
	}

	@Override
	public List<BreifVoteDto> loadNewVotes(String pageSize, String pageNo) throws Exception {
		int pageSizeUse = $(pageSize, 3);
		int pageNoUse = $(pageNo, 1);
		List<VoteEntity> vs = this.voteDao.selectsNewest(pageSizeUse, pageNoUse);
		List<BreifVoteDto> result = new ArrayList<>(vs.size());
		for (VoteEntity v : vs) {
			BreifVoteDto dto = new BreifVoteDto();
			result.add(dto);
		}
		return result;
	}
}
