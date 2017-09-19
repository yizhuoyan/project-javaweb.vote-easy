package com.easyvote.common;

import java.util.HashMap;
import java.util.Map;

import com.easyvote.dao.SysDicDao;
import com.easyvote.dao.UserDao;
import com.easyvote.dao.VoteDao;
import com.easyvote.dao.impl.SysDicDaoImpl;
import com.easyvote.dao.impl.UserDaoImpl;
import com.easyvote.dao.impl.VoteDaoImpl;


public class DaoFactory {
private static Map<String,Object> DAO_MAP=new HashMap<String, Object>(); 
	
	static{
		loadDaos();
	}
	//加载所有services对象
	private static void loadDaos(){
		DAO_MAP.put(VoteDao.class.getName(), new VoteDaoImpl());
		DAO_MAP.put(SysDicDao.class.getName(), new SysDicDaoImpl());
		DAO_MAP.put(UserDao.class.getName(), new UserDaoImpl());
		
	}
	/**
	 * 获取业务对象
	 * @param type 业务对象类型
	 * @return 业务对象
	 * @throws Exception
	 */
	public static <S>S getDao(Class<S> type){
		return (S)DAO_MAP.get(type.getName());
	}
}
