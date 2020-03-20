<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<%@include file="jspf/header-common.jspf"%>
<title>易简·投票网</title>
<style>
	.newVote-box{
		list-style: none;
		padding: 0;
	}
	.newVote-box>li{
		margin-bottom: 30px;
	}
	.newVote{
		border-radius: 5px;
		padding: 15px;
		background: #fff;
	}
	.vote-user-avator{
		display:inline-block;
		border-radius: 50%;
		overflow:hidden;
		vertical-align: top;
	}
	.vote-title{
		display:inline-block;
		margin: 0;
		padding-left:15px;
	}
	.vote-metadata{
		border-top:1px solid #eee;
		border-bottom:1px solid #eee;
		margin:10px 0;
		padding: 5px ;
	}
	.vote-metadata>*{
		margin-right: 15px;
		color: #c3c3c3;
	}
	.vote-logo-box{
		text-align: center;
		padding: 15px 0;
	}
	.vote-introductions{
		text-indent: 2em;
		font-size: 150%;
	}
	.vote-action-box{
		text-align: right;
	}
	.vote-btn{
		background: #2ECC71;
		padding: 10px 15px;
		color: #fff;
	}
	.vote-btn:hover{
		background: #2ECa11;
	}
	.loadmore{
		display:block;
		padding: 15px;
		width: 100%;
		background: #4c9d04;
		text-align: center;
		color: #fff;
	}
	.loadmore:hover {
		background: #4c7c00;
		color: #fff !important;
		text-decoration: none;
	}
</style>
</head>
<body>
	<%@include file="jspf/header.jspf" %>
	<main class="container">
	<section id="carousel-votes" class="carousel slide" data-ride="carousel">
      
      <div class="carousel-inner" role="listbox">
        <c:forEach var="v" step="2" items="${CAROUSEL_ITEMS}" varStatus="vs">
        	<figure class="item ${vs.count==1?'active':''}"  style="text-align:center">
        		<p>
        			<img src="${v.logo}" style="height: 250px" >
        		</p>
        		<figcaption class="carousel-caption">
        		
        		<h2><a href="vote/${v.id}">${v.title}</a></h2>
        		<p>
				发起人：${v.userName} 
				总票数：${v.totalVotes}  
				浏览量：${v.totalBrowses}
				</p>
				</figcaption>
        	</figure>
        </c:forEach>
      </div>
      
      <a class="left carousel-control" href="#carousel-votes" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      </a>
      <a class="right carousel-control" href="#carousel-votes" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      </a>
    </section>
	<br>
	<section  class="row">
		<aside class="col-lg-8">
			<ul class="newVote-box">
				<li>
					<article class="newVote">
						<header>
								<img class="vote-user-avator" width="50" height="50" src="/avator/nohead.jpg">
								<h3 class="vote-title">发展党员对象<br>投票</h3>
						</header>
						<p class="vote-metadata">
							<span><i class="glyphicon glyphicon-time"></i> <time> 3天1小时35分</time></span>
							<span><i class="glyphicon glyphicon-eye-open"> </i> 49589</span>
							<span><i class="glyphicon glyphicon-comment"> </i> 4</span>
							<span><i class="glyphicon glyphicon-user"> </i><a href="#">张三</a></span>
						</p>
						<p class="vote-logo-box">
							<img src="/voteimg/229841b4f4b992a9833437b908936b33.png">
						</p>
						<!-- 说明 -->
						<p class="vote-introductions">应集团要求，上班时间由9：00——18:00改为10:00——19:00，现征求各员工意见，请积极响应投票。</p>
						<p class="vote-action-box">
							<a class="vote-btn" href="#">参与投票 <i class="glyphicon glyphicon-arrow-right"></i></a>
						</p>
					</article>
				</li>
				<li>
					<article class="newVote">
						<header>
								<img class="vote-user-avator" width="50" height="50" src="/avator/nohead.jpg">
								<h3 class="vote-title">发展党员对象<br>投票</h3>
						</header>
						<p class="vote-metadata">
							<span><i class="glyphicon glyphicon-time"></i> <time> 3天1小时35分</time></span>
							<span><i class="glyphicon glyphicon-eye-open"> </i> 49589</span>
							<span><i class="glyphicon glyphicon-comment"> </i> 4</span>
							<span><i class="glyphicon glyphicon-user"> </i><a href="#">张三</a></span>
						</p>
						<p class="vote-logo-box">
							<img src="/voteimg/229841b4f4b992a9833437b908936b33.png">
						</p>
						<!-- 说明 -->
						<p class="vote-introductions">应集团要求，上班时间由9：00——18:00改为10:00——19:00，现征求各员工意见，请积极响应投票。</p>
						<p class="vote-action-box">
							<a class="vote-btn" href="#">参与投票 <i class="glyphicon glyphicon-arrow-right"></i></a>
						</p>
					</article>
				</li>
			
			</ul>
			<p>
				<a href="#" class="loadmore" >加载更多</a>
			</p>
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
				<!-- 分类 -->
			<article>
					<div class="list-group">
					  <a class="list-group-item disabled" ><b>投票分类</b></a>
					  <a class="list-group-item">文字投票</a>
					  <a class="list-group-item">文字投票</a>
					  <a class="list-group-item">文字投票</a>
					  <a class="list-group-item">文字投票</a>
					</div>
			</article>
			<!-- 广告1 -->
			<article class="panel">
				<img alt="" src="/ad/ad1.jpg">
			</article>
			<!-- 排行榜 -->
			<article>
					<div class="list-group">
					  <a class="list-group-item disabled" ><b>投票排行榜</b></a>
					  <a class="list-group-item">最佳人气奖评选</a>
					  <a class="list-group-item">最佳人气奖评选</a>
					  <a class="list-group-item">最佳人气奖评选</a>
					  <a class="list-group-item">最佳人气奖评选</a>
					</div>
			</article>
			<!-- 广告2 -->
			<article class="panel">
				<img alt="" src="/ad/ad1.jpg">
			</article>
			<!-- 友情连接 -->
			<article class="panel panel-default">
					<div class="panel-heading">
						友情连接
					</div>
					<div class="panel-body">
						<a>重庆驾校</a> 
						<a>趣闻趣事</a>
						<a> 德清论坛</a>
						<a> 南宁时空论坛</a>
						<a> 问卷调查 </a>
						<a>魔物盒手游网</a>
					</div>
			</article>
		</aside>
		
	</section>

	</main>
	<%@include file="jspf/footer.jspf"%>
</body>
</html>

