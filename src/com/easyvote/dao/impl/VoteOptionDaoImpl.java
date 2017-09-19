package com.easyvote.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.easyvote.common.dao.DBUtil;
import com.easyvote.dao.UserDao;
import com.easyvote.dao.VoteOptionDao;
import com.easyvote.entity.VoteOptionEntity;

public class VoteOptionDaoImpl extends AbstaractDao<VoteOptionEntity> implements VoteOptionDao{

	@Override
	protected String getTableName() {
		return "vot_option";
	}
	@Override
	public void insert(VoteOptionEntity e) throws Exception {
		Connection con = DBUtil.getConnection(false);

		StringBuilder sql = new StringBuilder();
		sql.append("insert into ").append(this.getTableName()).append(
				"(id,ordershow,content,remark,totalvotes,vote_id)")
				.append("values(?,?,?,?,?  ,?)");
		PreparedStatement ps = con.prepareStatement(sql.toString());
		int i=1;
		ps.setString(i++,e.getId());
		ps.setInt(i++,e.getOrderShow());
		ps.setString(i++,e.getContent());
		ps.setString(i++,e.getRemark());
		ps.setInt(i++,e.getTotalvotes());
		ps.setString(i++,e.getBelongVoteId());


		ps.executeUpdate();
	}

}
