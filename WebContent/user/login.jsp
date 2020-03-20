<%@page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<%@include file="jspf/header-common.jspf"%>
<title>用户登陆|易简·投票网</title>
<style>


</style>
</head>
<body>
		<%@include file="jspf/header.jspf"  %>
	<main class="container"> 
		<header class="container page-header">
			<h1>
				欢迎登陆 
				<small>
					<a  href="login-help.html">忘记密码？</a>		
				</small>
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
	<%@include file="jspf/footer.jspf"  %>
</body>
</html>
