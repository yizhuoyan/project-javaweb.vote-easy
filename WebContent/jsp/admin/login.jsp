<%@page pageEncoding="utf-8"%>
<%@taglib
	prefix="c"
	uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1" />
<link rel="shortcut icon" href="/img/favicon.ico">
<link
	rel="stylesheet"
	href="/common/css/common.css">
<script src="/js/common.js"></script>
<title>EasyVote|管理员登录</title>
</head>
<body>
	<main>
	<form action="/admin/login.do"	method="post">
		<p>${message}</p>
		<table class="form">
			<tr>
				<th>账号:</th>
				<td><input
					class="ia auto"
					name="account"
					value="system">
				</td>
			</tr>
			<tr>
				<th>密码:</th>
				<td><input
					type="password"
					name="password"
					value="admin"
					class="ia">
				</td>
			</tr>
			<tfoot>
				<tr>
					<td colspan="2">
						<button type="submit">登录</button></td>
				</tr>
			</tfoot>
		</table>
	</form>
	</main>
</body>
</html>
<c:remove var="message" scope="session"/>