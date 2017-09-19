package com.easyvote.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.easyvote.common.dao.DBUtil;
import com.easyvote.dao.VoteDao;
import com.easyvote.entity.VoteEntity;
import com.easyvote.entity.VoteOptionEntity;

public class VoteDaoImpl extends AbstaractDao<VoteEntity> implements VoteDao {
	@Override
	protected String getTableName() {
		return "vot_vote";
	}
	@Override
	public void insert(VoteEntity po) throws Exception {
		Connection con = DBUtil.getConnection(false);

		StringBuilder sql = new StringBuilder();
		sql.append("insert into vot_vote").append(
				"(id,title,logo,introductions,totalcomments,totalbrowses,totalvotes,isRadioChoice,isCommentAllowed,isShowResult,votePassword,repleatVoteInteval,maxvote,timecreate,timevotebegin,timevoteend,type_id,creater_id,status)")
				.append("values(?,?,?,?,?  ,?,?,?,?,? ,?,?,?,?,? ,?,?,?,?)");
		PreparedStatement ps = con.prepareStatement(sql.toString());
		int i = 1;
		po.setId(DBUtil.uuid());
		ps.setString(i++, po.getId());
		ps.setString(i++, po.getTitle());
		ps.setString(i++, po.getLogo());
		ps.setString(i++, po.getIntroductions());
		ps.setInt(i++, po.getTotalComments());
		ps.setInt(i++, po.getTotalBrowses());
		ps.setInt(i++, po.getTotalVotes());
		ps.setBoolean(i++, po.isRadioChoice());
		ps.setBoolean(i++, po.isCommentAllowed());
		ps.setBoolean(i++, po.isShowResult());
		ps.setString(i++, po.getVotePassword());
		ps.setInt(i++, po.getRepleatVoteInteval());
		ps.setInt(i++, po.getMaxvote());
		ps.setTimestamp(i++, DBUtil.toTimestamp(po.getTimeCreate()));
		ps.setTimestamp(i++, DBUtil.toTimestamp(po.getTimeVoteBegin()));
		ps.setTimestamp(i++, DBUtil.toTimestamp(po.getTimeVoteEnd()));
		ps.setString(i++, po.getVoteTypeId());
		ps.setString(i++, po.getCreateUserId());
		ps.setInt(i++, po.getStatus());
		ps.executeUpdate();
		con.commit();
	}



	public void deleteOptions(String qid) throws Exception {
		Connection con = DBUtil.getConnection(false);
		StringBuilder sql = new StringBuilder();
		sql.append("delete from qst_option where question_id=?");
		PreparedStatement ps = con.prepareStatement(sql.toString());
		ps.setObject(1, qid);
		ps.executeUpdate();
		con.commit();
	}




	@Override
	public List<VoteEntity> selectsNewest(int pageSize, int pageNo) throws Exception {
		Connection con = DBUtil.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("select v.* ");
		sql.append("from vot_vote v  ");
		sql.append("where v.status=0 order by v.timevotebegin limit ?,?");
		PreparedStatement ps = con.prepareStatement(sql.toString());
		ps.setObject(1, (pageNo-1)*pageSize);
		ps.setObject(2, pageSize);
		ResultSet rs = ps.executeQuery();
		List<VoteEntity> result=new ArrayList<>(pageSize);
		while (rs.next()) {
			result.add(this.result2po(rs));
		}
		return result;
	}
	@Override
	public List<VoteOptionEntity> selectOptions(String voteId) throws Exception {
		
		return null;
	}
	@Override
	protected VoteEntity result2po(ResultSet rs) throws Exception {
		VoteEntity po = super.result2po(rs);
		po.setShowResult(rs.getBoolean("isShowResult"));
		po.setCommentAllowed(rs.getBoolean("isCommentAllowed"));
		po.setCreateUserId(rs.getString("creater_id"));
		po.setVoteTypeId(rs.getString("type_id"));
		return po;
	}


}
