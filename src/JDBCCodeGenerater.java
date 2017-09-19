import java.lang.reflect.Method;
import java.util.Date;

import com.easyvote.entity.UserEntity;
import com.easyvote.entity.VoteEntity;
import com.easyvote.entity.VoteOptionEntity;

public class JDBCCodeGenerater {
	static private String  generateRs2entity(Class type)throws Exception{
		Method[] declaredMethods = type.getDeclaredMethods();
		StringBuilder sb=new StringBuilder("int i=1;\n");
		String methodName=null;
		for (Method method : declaredMethods) {
			methodName=method.getName();
			if(methodName.startsWith("set")) {
				sb.append("ps.set");
				Class paraType=method.getParameterTypes()[0];
				if(paraType.isAssignableFrom(int.class)) {
					sb.append("Int");
				}else if(paraType.isAssignableFrom(boolean.class)) {
					sb.append("Boolean");
				}else if(paraType.isAssignableFrom(Date.class)) {
					sb.append("Timestamp");
				}else {
					sb.append("String");
				}
				
				sb.append("(i++,")
				.append("e.get").append(methodName.substring(3))
				.append("());\n");
			}
		}
		return sb.toString();
	}
	
	public static void main(String[] args)throws Exception{
		String result=generateRs2entity(VoteOptionEntity.class);
		System.out.println(result);
	}
}
