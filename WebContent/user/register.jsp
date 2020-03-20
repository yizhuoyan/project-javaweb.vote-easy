<%@page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<%@include file="jspf/header-common.jspf"%>
<title>注册|易简·投票网</title>
<style>
</style>
</head>
<body>
	<%@include file="jspf/header.jspf"  %>
	<main class="container"> 
		<header class="page-header">
			<h1>
				欢迎您注册 <small><a href="login-help.html">需要帮助？</a></small>
			</h1>
		</header>
	<section class="message-box">
		<div class="alert alert-warning alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<strong>请输入您的账号信息，带*的为必填项哦^-^</strong> 
		</div>
	</section>
	<section class="form-box">
		<form class="form-horizontal">
			<div class="form-group">
				<label for="accountEL" class="col-sm-2 control-label">*账号：</label>
				<span class="col-sm-10">
					<input type="text" class="form-control" id="accountEL"
						placeholder="推荐使用手机或邮箱作为账号呢"  autocomplete="false" maxlength="32" required autofocus>
				</span>
			</div>
			<div class="form-group">
				<label for="passwordEL" class="col-sm-2 control-label">*密码：</label>
				<span class="col-sm-10">
					<input type="password" class="form-control" id="passwordEL"
						placeholder="不超过16个字符" maxlength="16" required>
				</span>
			</div>
			<div class="form-group">
				<label for="password2EL" class="col-sm-2 control-label">*确认密码：</label>
				<span class="col-sm-10">
					<input type="password" class="form-control" id="password2EL"
						placeholder="请再次确认密码" maxlength="16" required>
				</span>
			</div>
			<div class="form-group">
				<span class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-lg btn-primary">注册</button>
					<button type="button" class="btn btn-link">返回</button>
				</span>
			</div>
		</form>
	</section>
	</main>
	<footer>
			&copy;2017-2099 易简·投票网(EasyVote) all rights reserved.
	</footer>
</body>
</html>
