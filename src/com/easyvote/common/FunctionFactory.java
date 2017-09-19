package com.easyvote.common;

import java.beans.BeanInfo;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import com.easyvote.common.dao.DBUtil;
import com.easyvote.function.AdministratorFunction;
import com.easyvote.function.UserFunction;
import com.easyvote.function.impl.AdministratorFunctionImpl;
import com.easyvote.function.impl.UserFunctionImpl;

public class FunctionFactory {
	private static Map<String,Object> SERVICES_MAP=new HashMap<String, Object>(); 
	
	static{
		loadServices();
	}
	//加载所有services对象
	private static void loadServices(){
		SERVICES_MAP.put(AdministratorFunction.class.getName(), new AdministratorFunctionImpl());
		SERVICES_MAP.put(UserFunction.class.getName(), new UserFunctionImpl());
		proxyAllServices();
	}
	private static void proxyAllServices(){
		Object service=null;
		for (String key:SERVICES_MAP.keySet()) {
			service=SERVICES_MAP.get(key);
			SERVICES_MAP.put(key, TransactionProxyServiceFactory.proxy(service));
		}
	}
	/**
	 * 获取业务对象
	 * @param type 业务对象类型
	 * @return 业务对象
	 * @throws Exception
	 */
	public static <S>S getFunction(Class<S> type)throws Exception{
		
		return (S)SERVICES_MAP.get(type.getName());
	}
}
class TransactionProxyServiceFactory{
	public static Object proxy(final Object target){
		
		return Proxy.newProxyInstance(target.getClass().getClassLoader(),
				target.getClass().getInterfaces(),new InvocationHandler() {
					@Override
					public Object invoke(Object proxy, Method method, Object[] args)
							throws Throwable {
						Object result=null;
						try{
							result=method.invoke(target, args);
							DBUtil.commit();
						}catch(Throwable e){
							DBUtil.rollback();
							throw e;
						}
						return result;
					}
				});
	}
}
