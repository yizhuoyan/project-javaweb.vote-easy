package com.easyvote.entity;

import java.time.Instant;
import java.util.Date;

public class VoteEntity {
	private String id;
	private String title;
	private String logo;
	private String introductions;
	private int totalComments;
	private int totalBrowses;
	private int totalVotes;
	private boolean isRadioChoice;
	private boolean isCommentAllowed;
	private boolean isShowResult;
	private String votePassword;
	private int repleatVoteInteval;
	private int maxvote;
	private Date timeCreate;
	private Date timeVoteBegin;
	private Date timeVoteEnd;
	private VoteTypeEntity voteType;
	private String voteTypeId;
	private UserEntity createUser;
	private String createUserId;
	private int status;
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
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getIntroductions() {
		return introductions;
	}
	public void setIntroductions(String introductions) {
		this.introductions = introductions;
	}
	public int getTotalComments() {
		return totalComments;
	}
	public void setTotalComments(int totalComments) {
		this.totalComments = totalComments;
	}
	public int getTotalBrowses() {
		return totalBrowses;
	}
	public void setTotalBrowses(int totalBrowses) {
		this.totalBrowses = totalBrowses;
	}
	public int getTotalVotes() {
		return totalVotes;
	}
	public void setTotalVotes(int totalVotes) {
		this.totalVotes = totalVotes;
	}
	public boolean isRadioChoice() {
		return isRadioChoice;
	}
	public void setRadioChoice(boolean isRadioChoice) {
		this.isRadioChoice = isRadioChoice;
	}
	public boolean isCommentAllowed() {
		return isCommentAllowed;
	}
	public void setCommentAllowed(boolean isCommentAllowed) {
		this.isCommentAllowed = isCommentAllowed;
	}
	public boolean isShowResult() {
		return isShowResult;
	}
	public void setShowResult(boolean isShowResult) {
		this.isShowResult = isShowResult;
	}
	public String getVotePassword() {
		return votePassword;
	}
	public void setVotePassword(String votePassword) {
		this.votePassword = votePassword;
	}
	public int getRepleatVoteInteval() {
		return repleatVoteInteval;
	}
	public void setRepleatVoteInteval(int repleatVoteInteval) {
		this.repleatVoteInteval = repleatVoteInteval;
	}
	public int getMaxvote() {
		return maxvote;
	}
	public void setMaxvote(int maxvote) {
		this.maxvote = maxvote;
	}
	public Date getTimeCreate() {
		return timeCreate;
	}
	public void setTimeCreate(Date timeCreate) {
		this.timeCreate = timeCreate;
	}
	public Date getTimeVoteBegin() {
		return timeVoteBegin;
	}
	public void setTimeVoteBegin(Date timeVoteBegin) {
		this.timeVoteBegin = timeVoteBegin;
	}
	public Date getTimeVoteEnd() {
		return timeVoteEnd;
	}
	public void setTimeVoteEnd(Date timeVoteEnd) {
		this.timeVoteEnd = timeVoteEnd;
	}
	public VoteTypeEntity getVoteType() {
		return voteType;
	}
	public void setVoteType(VoteTypeEntity type) {
		this.voteType = type;
	}
	public String getVoteTypeId() {
		return voteTypeId;
	}
	public void setVoteTypeId(String voteTypeId) {
		this.voteTypeId = voteTypeId;
	}
	public UserEntity getCreateUser() {
		return createUser;
	}
	public void setCreateUser(UserEntity createUser) {
		this.createUser = createUser;
	}
	public String getCreateUserId() {
		return createUserId;
	}
	public void setCreateUserId(String createUserId) {
		this.createUserId = createUserId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "VoteEntity [id=" + id + ", title=" + title + ", logo=" + logo + ", introductions=" + introductions
				+ ", totalComments=" + totalComments + ", totalBrowses=" + totalBrowses + ", totalVotes=" + totalVotes
				+ ", isRadioChoice=" + isRadioChoice + ", isCommentAllowed=" + isCommentAllowed + ", isShowResult="
				+ isShowResult + ", votePassword=" + votePassword + ", repleatVoteInteval=" + repleatVoteInteval
				+ ", maxvote=" + maxvote + ", timeCreate=" + timeCreate + ", timeVoteBegin=" + timeVoteBegin
				+ ", timeVoteEnd=" + timeVoteEnd + ", voteType=" + voteType + ", voteTypeId=" + voteTypeId
				+ ", createUser=" + createUser + ", createUserId=" + createUserId + ", status=" + status + "]";
	}
	
}
