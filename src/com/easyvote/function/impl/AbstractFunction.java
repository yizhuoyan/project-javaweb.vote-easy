/**
 * 
 */
package com.easyvote.function.impl;

import java.util.Collection;

import com.easyvote.common.DaoFactory;
import com.easyvote.common.exception.ThisSystemException;
import com.easyvote.dao.SysDicDao;
import com.easyvote.dao.UserDao;
import com.easyvote.dao.VoteDao;
import com.easyvote.service.LoginService;

/**
 * @author ben
 *
 */
public abstract class AbstractFunction  {
	protected final SysDicDao dicDao;
	protected final UserDao userDao;
	protected final VoteDao voteDao;
	protected final LoginService loginService;

	public AbstractFunction() {
		this.dicDao = DaoFactory.getDao(SysDicDao.class);
		this.userDao = DaoFactory.getDao(UserDao.class);
		this.voteDao = DaoFactory.getDao(VoteDao.class);
		loginService=new LoginService();
	}
	/**
	 * 如果s为null,空字符串,空白字符,则返回defaultValue
	 * @param s
	 * @param defaultValue
	 * @return
	 */
	protected final String $(String s,String defaultValue){
		if(s==null||(s=s.trim()).length()==0){
			return defaultValue;
		}
		return s;
	}
	/**
	 * 如果o为null,则返回defaultValue
	 * @param s
	 * @param defaultValue
	 * @return
	 */
	protected final <T>T $(T o,T defaultValue){
		if(o==null){
			return defaultValue;
		}
		return o;
	}
	

	/**
	 * 如果s不能转换为整数,则返回defaultValue
	 * @param s
	 * @param defaultValue
	 * @return
	 */
	protected final int $(String s,int defaultValue){
		if(s==null||(s=s.trim()).length()==0){
			return defaultValue;
		}
		try{
			return Integer.parseInt(s);
		}catch(Exception e){
			return defaultValue;
		}
	}
	protected final String checkNotBlank(String message,String s){
		if(s==null||(s=s.trim()).length()==0){
			throw new ThisSystemException(message);
		}
		return s;
	}
	protected final <T>T checkNotNull(String message,T obj){
		if(obj==null){
			throw new ThisSystemException(message);
		}
		return obj;
	}
	protected final Collection checkNotEmpty(String message,Collection obj){
		if(obj==null||obj.size()==0){
			throw new ThisSystemException(message);
		}
		return obj;
	}
	protected final <T>T[] checkNotEmpty(String message,T[] arr){
		if(arr==null||arr.length==0){
			throw new ThisSystemException(message);
		}
		return arr;
	}
	protected final void checkGreatThan(String message,int n,int min){
		if(n<min){
			throw new ThisSystemException(message);
		}
	}
	protected final void checkLessThan(String message,int n,int min){
		if(n>=min){
			throw new ThisSystemException(message);
		}
	}
	protected final void checkLessThan(String message,String s,int min){
		if(s.length()>min){
			throw new ThisSystemException(message);
		}
	}
	protected final void checkBetween(String message,int min,int n,int max){
		if(n<min||n>max){
			throw new ThisSystemException(message);
		}
	}
	protected final void checkTrue(String message,boolean b){
		if(!b){
			throw new ThisSystemException(message);
		}
	}
	protected final void checkFalse(String message,boolean b){
		if(b){
			throw new ThisSystemException(message);
		}
	}
	protected final void checkEquals(String message,Object a,Object b){
		if(a==null){
			if(b!=null)
				throw new ThisSystemException(message);	
		}else if(!a.equals(b)){
			throw new ThisSystemException(message);
		}
	}
	protected final void checkNotEquals(String message,Object a,Object b){
		if(a==null){
			if(b==null){
				throw new ThisSystemException(message);	
			}
		}else if(a.equals(b)){
				throw new ThisSystemException(message);
		}
	}
}
