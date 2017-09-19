/**
 * 
 */
package com.easyvote.common.util;

import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import com.easyvote.common.exception.ThisSystemException;

/**
 * @author ben
 *
 */
public class CheckUtil {

	public final List<String> messages;
	
	public CheckUtil() {
		this(new LinkedList<String>());
	}
	public CheckUtil(List<String> messages) {
		this.messages=messages;
	}
	
	public final boolean hasErrors(){
		return this.messages.size()!=0;
	}
	
	public final String checkNotBlank(String message,String s){
		if(s==null||(s=s.trim()).length()==0){
			this.messages.add(message);
		}
		return s;
	}
	public final <T>T checkNotNull(String message,T obj){
		if(obj==null){
			this.messages.add(message);
		}
		return obj;
	}
	public final Collection checkNotEmpty(String message,Collection obj){
		if(obj==null||obj.size()==0){
			this.messages.add(message);
		}
		return obj;
	}
	public final void checkGreatThan(String message,int n,int min){
		if(n<min){
			this.messages.add(message);
		}
	}
	
	public final void checkLessThan(String message,int n,int min){
		if(n>=min){
			this.messages.add(message);
		}
	}
	public final void checkLessThan(String message,String s,int min){
		if(s.length()>min){
			this.messages.add(message);
		}
	}
	public final void checkBetween(String message,int min,int n,int max){
		if(n<min||n>max){
			this.messages.add(message);
		}
	}
	public final void checkTrue(String message,boolean b){
		if(!b){
			this.messages.add(message);
		}
	}
	public final void checkFalse(String message,boolean b){
		if(b){
			this.messages.add(message);
		}
	}
	public final void checkEquals(String message,Object a,Object b){
		if(a==null?b!=null:!a.equals(b)){
			this.messages.add(message);
		}
	}
	public final void checkNotEquals(String message,Object a,Object b){
		if(a==null?b==null:a.equals(b)){
			this.messages.add(message);
		}
	}
}
