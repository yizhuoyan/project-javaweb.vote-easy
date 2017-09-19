package com.easyvote.common.util;

import com.easyvote.common.exception.ThisSystemException;

public class ThisSystemUtil {
	public static boolean isBlank(String s){
		return (s==null||(s=s.trim()).length()==0);
	}
	
	static public Integer parseInt(String s,Integer defaultValue){
		if(s==null||(s=s.trim()).length()==0){
			return defaultValue;
		}
		try{
			return Integer.parseInt(s);
		}catch(Exception e){
			return defaultValue;
		}
	}
	
	
}
