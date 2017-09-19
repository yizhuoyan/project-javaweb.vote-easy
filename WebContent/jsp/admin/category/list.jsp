<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"  href="/common/css/common.css">
<title>EasyVote|</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
<link rel="shortcut icon" href="/img/favicon.ico">
</head>
<body>
	<header>
		<a href="/admin/category/add.do">新增</a>
	</header>
	<table class="data">
		<thead>
			<tr>
				<th width="40px">序号</th>
				<th width="150px">操作</th>
				<th width="200px">类型名称</th>
				<th>描述</th>
			</tr>
		</thead>
		<c:set var="result" scope="page" value="${requestScope.result}" ></c:set>
		
		<c:if test="${result.found}">
		<tbody>
			<c:forEach var="row" items="${result.pageData}" varStatus="vs">
				<tr>
					<td>${vs.count}</td>
					<td>
						<a href="/admin/category/mod.do?id=${row.id}">查看修改</a>
						<a href="/admin/category/del.do?id=${row.id}">删除</a>
					</td>
					<td>${row.name}</td>
					<td>${row.remark}</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="99">
					<span>共<b>${result.rows}条记录</b></span>
				</td>
			</tr>
		</tfoot>
		</c:if>
		<c:if test="${!result.found}">
			<tr>
				<td colspan="99">
					暂无相关数据,请添加!
				</td>
			</tr>
		</c:if>
	</table>
</body>
</html>