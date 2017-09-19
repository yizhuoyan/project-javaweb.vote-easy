package com.easyvote.common.dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Map;
import java.util.Map.Entry;
/**
 * 模板dao
 * @author ben
 */
public interface TemplateDao<T> {

	void insert(T t)throws Exception;
	void delete(Serializable id)throws Exception;
	void update(Serializable id,Map<String,Object> map)throws Exception;
	void update(Serializable id,String column,Object value)throws Exception;
	/**
	 * 根据唯一性字段查询
	 * @param uk 字段名称
	 * @param ukValue 字段值
	 * @return 
	 * @throws Exception
	 */
	T select(String uk,Object ukValue)throws Exception;
	/**
	 * 判断某个字段值是否存在
	 * @param uk 字段名称
	 * @param ukValue 字段值
	 * @return
	 * @throws Exception
	 */
	boolean exist(String uk,Object ukValue)throws Exception;
	
	
	
	
}
