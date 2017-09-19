package com.easyvote.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.easyvote.common.dao.DBUtil;
import com.easyvote.dao.UserDao;
import com.easyvote.entity.UserEntity;

public class UserDaoImpl extends AbstaractDao<UserEntity> implements UserDao{

	@Override
	protected String getTableName() {
		return "sys_user";
	}
	@Override
	public void insert(UserEntity e) throws Exception {
		Connection con = DBUtil.getConnection(false);

		StringBuilder sql = new StringBuilder();
		sql.append("insert into sys_user").append(
				"(id,account,name,password,points,timeCreate)")
				.append("values(?,?,?,?,?  ,?,?)");
		PreparedStatement ps = con.prepareStatement(sql.toString());
		int i=1;
		ps.setString(i++,e.getId());
		ps.setString(i++,e.getAccount());
		ps.setString(i++,e.getName());
		ps.setString(i++,e.getPassword());
		ps.setInt(i++,e.getPoints());
		ps.setTimestamp(i++,toTimestamp(e.getTimeCreate()));
		ps.executeUpdate();
	}

}
