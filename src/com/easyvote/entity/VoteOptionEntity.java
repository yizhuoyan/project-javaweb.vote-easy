package com.easyvote.entity;

public class VoteOptionEntity {
	private String id;
	private String content;
	private String remark;
	private int totalvotes;
	private String belongVoteId;
	
	private VoteEntity belongVote;
	private int orderShow;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getTotalvotes() {
		return totalvotes;
	}
	public void setTotalvotes(int totalvotes) {
		this.totalvotes = totalvotes;
	}
	public String getBelongVoteId() {
		return belongVoteId;
	}
	public void setBelongVoteId(String belongVoteId) {
		this.belongVoteId = belongVoteId;
	}
	public VoteEntity getBelongVote() {
		return belongVote;
	}
	public void setBelongVote(VoteEntity belongVote) {
		this.belongVote = belongVote;
	}
	public int getOrderShow() {
		return orderShow;
	}
	public void setOrderShow(int orderShow) {
		this.orderShow = orderShow;
	}
}
