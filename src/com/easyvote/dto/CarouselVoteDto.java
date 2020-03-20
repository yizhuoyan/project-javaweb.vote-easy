package com.easyvote.dto;

import java.util.Date;

import com.easyvote.entity.VoteTypeEntity;

public class CarouselVoteDto {
	private String id;
	private String title;
	private Date createTime;
	private String logo;
	private String userName;
	private String userId;
	private int totalVotes;
	private int totalBrowses;
	
	private VoteTypeEntity voteType;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getTotalVotes() {
		return totalVotes;
	}
	public void setTotalVotes(int totalVotes) {
		this.totalVotes = totalVotes;
	}
	public int getTotalBrowses() {
		return totalBrowses;
	}
	public void setTotalBrowses(int totalBrowses) {
		this.totalBrowses = totalBrowses;
	}
	public VoteTypeEntity getVoteType() {
		return voteType;
	}
	public void setVoteType(VoteTypeEntity voteType) {
		this.voteType = voteType;
	}
	
}
