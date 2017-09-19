<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"  href="/common/css/common.css">
<script src="/js/common.js"></script>
<title>EasyVote|主页</title>
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
<link rel="shortcut icon" href="/img/favicon.ico">
</head>
<body>
	<c:set var="admin" value="${sessionScope['USER-CONTEXT']}" scope="page"></c:set>
	<header>
		<h1>EasyVote</h1>
	</header>
	
	<main>
		<p>
			欢迎您,<a href="#">${admin.userName}</a>
			<a href="/admin/modifyPassword.do">修改密码</a>
			<a href="/jsp/admin/login.jsp">注销</a>
		</p>
		<menu>
			<ul>
				<li><a href="/admin/category/list.do">问卷类别管理</a></li>
				<li><a href="/admin/question/qry.do">问卷管理</a></li>
				<li><a href="/admin/voteinfo/qry.do">问卷统计</a></li>
			</ul>
		</menu>
	</main>
	<footer>
		<address>root@yizhuoyan.com</address>
	</footer>
</body>
</html>