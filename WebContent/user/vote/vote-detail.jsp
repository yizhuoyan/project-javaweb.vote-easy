<%@page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<%@include file="/user/jspf/header-common.jspf"%>
<title>${v.title}|易简·投票网</title>
<link rel="stylesheet" href="css/vote.css">
</head>
<body>
	<%@include file="/user/jspf/header.jspf"%>
	<main class="container"> 
		<section class="row">
			<aside class="col-lg-8">
				<section>
                    <!-- 投票区 -->
					<%@include file="voted.jspf" %>
				</section>
				
				<section>
					<!-- 评论操作区 -->
                    
				</section>
				
			</aside>
			<aside class="col-lg-4">
				<article class="panel panel-default">
					<form class="panel-content" action="" method="get">
						<div class="input-group">
						  <input type="text" class="form-control" placeholder="请输入关键字" maxlength="16">
						  <span class="input-group-addon">搜索投票</span>
						</div>
					</form>
				</article>
				
				<article>
					<!-- 相关投票 -->
				</article>
				
				<article>
					<!-- 评论区 -->
				</article>
			</aside>
		</section>
					
	</main>
	<%@include file="/user/jspf/footer.jspf"%>
</body>
</html>
