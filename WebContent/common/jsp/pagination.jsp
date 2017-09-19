<%@ page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<c:if test="${requestScope.result!=null&&requestScope.result.found}">
<c:set var="result" value="${requestScope.result}" scope="page"></c:set>
<script>
	var goPage=function(no){
		var form=document.getElementById("${param.formId}");
		form.pageNo.value=String(no);
		form.submit();
	}

</script>

<ul class="pagination">
		<li>共${result.rows}条记录</li>
		<li>每页${result.pageSize}条</li>
		<li>共${result.pages}页</li>
		<li>当前第${result.pageNo}页</li>
	
		<c:if test="${result.pageNo>1}">
			<li><a href="javascript:goPage(1)">第一页</a></li>
			<li><a href="javascript:goPage(${result.pageNo-1})">上一页</a></li>	
		</c:if>
		
		
		<c:if test="${result.pageNo<result.pages}">
			<li><a href="javascript:goPage(${result.pageNo+1})">下一页</a></li>
			<li><a href="javascript:goPage(${result.pages})">末页</a></li>	
		</c:if>
</ul>

</c:if>