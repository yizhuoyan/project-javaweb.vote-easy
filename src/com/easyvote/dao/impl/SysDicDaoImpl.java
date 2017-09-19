package com.easyvote.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.easyvote.common.dao.DBUtil;
import com.easyvote.dao.SysDicDao;
import com.easyvote.entity.SysDicEntity;

public class SysDicDaoImpl  extends AbstaractDao<SysDicEntity> implements SysDicDao {
	@Override
	public void insert(SysDicEntity e) throws Exception {
		Connection con = DBUtil.getConnection(false);
		StringBuilder sql = new StringBuilder();
		sql.append("insert into sys_dic(id,dicname,itemname,itemvalue,itemvalue2,itemorder)")
		.append("values (?,?,?,?,?,?)");
		PreparedStatement ps = con.prepareStatement(sql.toString());
		int i = 1;
		e.setId(DBUtil.uuid());
		ps.setString(i++, e.getId());
		ps.setString(i++, e.getDicName());
		ps.setString(i++, e.getItemName());
		String[] values=e.getItemValue();
		ps.setString(i++, values[0]);
		ps.setString(i++, values[1]);
		ps.setInt(i++, e.getItemOrder());
		ps.executeUpdate();
	}


	@Override
	protected 	SysDicEntity result2po(ResultSet rs) throws Exception {
		SysDicEntity e =super.result2po(rs);
		String value1=rs.getString("itemValue");
		String value2=rs.getString("itemValue2");
		e.setItemValue(new String[] {value1,value2});
		return e;
	}



	

	public Map<String, SysDicEntity> selectAll2Map() throws Exception {
		Connection con = DBUtil.getConnection();
		Map<String, SysDicEntity> map = new HashMap<>();
		StringBuilder sql = new StringBuilder();
		sql.append("select * from sys_dic order by name");
		PreparedStatement ps = con.prepareStatement(sql.toString());

		ResultSet rs = ps.executeQuery();
		SysDicEntity cat = null;
		while (rs.next()) {
			cat = this.result2po(rs);
			map.put(cat.getId(), cat);
		}
		return map;
	}

	@Override
	public List<SysDicEntity> select(String dicname) throws Exception {
		Connection con = DBUtil.getConnection();
		List<SysDicEntity> result = new LinkedList<>();
		StringBuilder sql = new StringBuilder();
		sql.append("select * from sys_dic where dicname=? order by itemorder");
		PreparedStatement ps = con.prepareStatement(sql.toString());
		ps.setString(1, dicname);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			result.add(result2po(rs));
		}
		return result;
	}

	@Override
	protected  String getTableName() {
		return "sys_dic";
	}


}
