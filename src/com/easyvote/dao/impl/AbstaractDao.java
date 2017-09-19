package com.easyvote.dao.impl;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.WeakHashMap;
import java.util.Map.Entry;

import com.easyvote.common.dao.DBUtil;
import com.easyvote.common.dao.TemplateDao;

public abstract class AbstaractDao<T> implements TemplateDao<T>{
	//po类型
	private Class<T> poType;
	//保存po类中的set方法数据(key=出去set后的方法名称)
	private final Map<String,Method> setterMethodMap=new HashMap<>();
	
	{
		//1获取po类型
		ParameterizedType  t=(ParameterizedType) this.getClass().getGenericSuperclass();
		this.poType=(Class<T>) t.getActualTypeArguments()[0];
		//2获取setter方法（目前仅查找set开头和一个参数的方法）
		Arrays.stream(poType.getMethods()).filter(m->m.getName().startsWith("set")
					&&m.getParameterCount()==1).forEach(m->setterMethodMap.put(m.getName().substring(3).toUpperCase(), m));
	}
	
	@Override
	public void insert(T t) throws Exception {
		
	}

	@Override
	public void delete(Serializable id) throws Exception {
		Connection con = DBUtil.getConnection(false);
		StringBuilder sql = new StringBuilder();
		sql.append("delete from ").append(this.getTableName()).append(" where id=?");
		PreparedStatement ps = con.prepareStatement(sql.toString());
		ps.setObject(1, id);
		ps.executeUpdate();
	}
	protected java.sql.Timestamp toTimestamp(java.util.Date d){
		if(d==null)return null;
		return new Timestamp(d.getTime());
	}
	@Override
	public void update(Serializable id, String column, Object value) throws Exception {
		Connection con = DBUtil.getConnection(false);
		StringBuilder sql = new StringBuilder();
		sql.append("update ").append(this.getTableName()).append(" set ");
		sql.append(column).append("=?");
		sql.append(" where id=?");
		PreparedStatement ps = con.prepareStatement(sql.toString());
		ps.setObject(1, value);
		ps.setObject(2, id);
		ps.executeUpdate();
		con.commit();
	}

	@Override
	public void update(Serializable id, Map<String, Object> map) throws Exception {
		Connection con = DBUtil.getConnection(false);
		StringBuilder sql = new StringBuilder();
		sql.append("update ").append(this.getTableName()).append(" set ");
		String[] fields=new String[map.size()];
		int j=0;
		for (Entry<String, Object> entry :map.entrySet()) {
			sql.append(entry.getKey())
			.append("=?,");
			fields[j++]=entry.getKey();
		}
		sql.setCharAt(sql.length()-1, ' ');
		sql.append(" where id=?");
		PreparedStatement ps = con.prepareStatement(sql.toString());
		int i = 1;
		for (String field : fields) {
			ps.setObject(i++, map.get(field));
		}
		ps.setObject(i++, id);
		ps.executeUpdate();
		con.commit();
	}

	@Override
	public T select(String uk, Object ukValue) throws Exception {
		Connection con = DBUtil.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("select * from ").append(this.getTableName()).append(" where ").append(uk)
				.append(" = ?");
		PreparedStatement ps = con.prepareStatement(sql.toString());
		ps.setObject(1, ukValue);
		System.out.println(sql);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			return this.result2po(rs);
		}
		return null;
	}

	@Override
	public boolean exist(String uk, Object ukValue) throws Exception {
		Connection con = DBUtil.getConnection();
		StringBuilder sql = new StringBuilder();
		sql.append("select count(*) from ").append(this.getTableName()).append(" where ").append(uk)
				.append(" = ?");
		PreparedStatement ps = con.prepareStatement(sql.toString());
		ps.setObject(1, ukValue);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			return rs.getInt(1)>0;
		}
		return false;
	}
	
	protected abstract String getTableName() ;
	protected T result2po(ResultSet rs)throws Exception{
		ResultSetMetaData metaData = rs.getMetaData();
		Map<String,Method> methodMap=this.setterMethodMap;
		T po=this.poType.newInstance();
		for (int i = metaData.getColumnCount(); i>0;i--) {
			String columnLabel = metaData.getColumnLabel(i);
			//findsetterMethod
			Method m=methodMap.get(columnLabel.toUpperCase());
			if(m!=null) {
				Object fieldValue=getFieldValue(rs,i,m.getParameterTypes()[0]);
				m.invoke(po, fieldValue);
			}
		}
		return po;
	}
	private Object getFieldValue(ResultSet rs,int i,Class<?> valueType)throws SQLException {
		if(valueType.isAssignableFrom(String.class)) {
			return rs.getString(i);
		}else if(valueType.isAssignableFrom(Date.class)) {
			return rs.getTimestamp(i);
		}else if(valueType.isAssignableFrom(int.class)) {
			return rs.getInt(i);
		}else if(valueType.isAssignableFrom(boolean.class)) {
			return rs.getBoolean(i);
		}else if(valueType.isAssignableFrom(long.class)) {
			return rs.getLong(i);
		}
		return null;
	}
}
