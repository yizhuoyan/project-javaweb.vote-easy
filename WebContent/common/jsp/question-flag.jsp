<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:choose>
	<c:when test="${param.flag==0}">
		草稿
	</c:when>
	<c:when test="${param.flag==1}">
		投票中
		
	</c:when>
	<c:when test="${param.flag==2}">
		到期关闭
	</c:when>
	<c:when test="${param.flag==4}">
		强制关闭
	</c:when>
</c:choose>