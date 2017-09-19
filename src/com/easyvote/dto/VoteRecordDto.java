package com.easyvote.dto;

public class VoteRecordDto {
	private String questionId;
	private String[] voteOptions;
	private String voteIp;
	
	
	public String getVoteIp() {
		return voteIp;
	}
	public void setVoteIp(String voteIp) {
		this.voteIp = voteIp;
	}
	public String getQuestionId() {
		return questionId;
	}
	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}
	public String[] getVoteOptions() {
		return voteOptions;
	}
	public void setVoteOptions(String[] voteOptions) {
		this.voteOptions = voteOptions;
	}
	
	
	
	
}
