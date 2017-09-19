<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"  href="/common/css/common.css">
<script src="/js/common.js"></script>
<meta http-equiv="refresh" content="3;${requestScope.url}">
<title>EasyVote|消息提示</title>
</head>
<body>
		操作成功!
		3s后自动返回
		<a href="${requestScope.url}">立即返回</a>
</body>
</html>