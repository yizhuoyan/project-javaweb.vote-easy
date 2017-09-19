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
<title>EasyVote|管理员修改密码</title>
</head>
<body>
	<main>
	<form
		action="/admin/modifyPassword.do"
		method="post">
		<p>${message}</p>
		<table class="form">
			<tr>
				<th>旧密码:</th>
				<td><input
					name="oldPassword"
					value="admin">
				</td>
			</tr>
			<tr>
				<th>新密码:</th>
				<td><input
					type="password"
					name="newPassword"
					value="admin"
					class="ia">
				</td>
			</tr>
			<tr>
				<th>新密码:</th>
				<td><input
					type="password"
					name="newPasswordConfirm"
					value="admin"
					class="ia">
				</td>
			</tr>
			<tfoot>
				<tr>
					<td colspan="2">
						<button type="submit">登录</button>
						<a href="/jsp/admin/index.jsp">返回</a>	
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
	</main>
</body>
</html>