<%@page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<%@include file="jspf/header-common.jspf"%>
<title>用户登陆_易简·投票网</title>
<style>
html{
	position:relative;
	min-height: 100%;
}
body {
	padding-top: 50px;
	margin-bottom: 30px;
}
body>footer{
	position: absolute;
	line-height: 30px;
	width: 100%;
	bottom: 0;
	text-align: center;
	background-color: #222222;
	color: #eee;
}

</style>
</head>
<body>
	<header>
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<section class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.html">易简·投票网</a>
				</div>
				<div id="navbar" class="collapse navbar-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li class="active"><a href="login.html">登陆</a></li>
						<li><a href="register.html">注册</a></li>
						<li><a href="about.html">帮助</a></li>
					</ul>
				</div>
			</section>
		</nav>
	</header>
	<main class="container"> 
		<header class="page-header">
			<h1>
				欢迎登陆 <small><a href="login-help.html">需要帮助？</a></small>
			</h1>
		</header>
	<section class="message-box">
		<div class="alert alert-warning alert-dismissible" role="alert">
			<button type="button" class="close" data-dismiss="alert"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<strong>请输入您的账号和密码</strong> 
		</div>
	</section>
	<section class="form-box">
		<form class="form-horizontal">
			<div class="form-group">
				<label for="accountEL" class="col-sm-2 control-label">账号/手机/邮箱：</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="accountEL"
						placeholder="账号/手机/邮箱都可以登陆哦"  autocomplete="false" maxlength="32" required autofocus>
				</div>
			</div>
			<div class="form-group">
				<label for="passwordEL" class="col-sm-2 control-label">密码：</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" id="passwordEL"
						placeholder="Password" maxlength="16" required>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<div class="checkbox">
						<label> 
							<input type="checkbox"> 一周之内记住我
						</label>
					</div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-lg btn-primary">登陆</button>
					<button type="button" class="btn btn-link">返回</button>
				</div>
			</div>
		</form>
	</section>
	</main>
	<footer>
			&copy;2017-2099 易简·投票网(EasyVote) all rights reserved.
	</footer>
</body>
</html>
