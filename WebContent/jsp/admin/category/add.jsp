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
	</header>
	<section>
	<form action="/admin/category/add.do" method="post">
		<p>${message}</p>
		<table class="form">
			<tr>
				<th>名称:</th>
				<td>
				<input	class="ia" 
					name="name"
					value="${param.name}">
				</td>
			</tr>
			<tr>
				<th>描述:</th>
				<td><textarea class="ia" 
					name="remark">${param.remark}</textarea>
				</td>
			</tr>
			<tfoot>
				<tr>
					<td colspan="2">
						<button type="submit">确定</button>
						<button type="reset">重置</button>
						<a href="/admin/category/list.do">返回</a>
					</td>									
						
				</tr>
			</tfoot>
		</table>
	</form>
	</section>
</body>
</html>