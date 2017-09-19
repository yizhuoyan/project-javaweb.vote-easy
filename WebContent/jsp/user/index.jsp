<%@page pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="zh"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="zh"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="zh"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="zh">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="keywords"
	content="投票,文字投票,图片投票,视频投票,免费投票,网络投票,微信投票,市场调查,生活调查,生活决策,梦豆投票网" />
<meta name="description"
	content="梦豆投票网，只需简单几步即可创建投票。无论是文字投票、图片投票、视频投票您都能轻松实现，并且您还能把投票分享给周围的每一个人，让大家实时参与，互动评论。" />
<title>梦豆投票网</title>
<base href="<%=request.getContextPath()%>/">
<link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="css/style.min.css" rel="stylesheet" />

<script src="js/modernizr-2.8.3.js"></script>
</head>
<body class="right-sb">
	<div class="container">
		<!-- Start Header -->
		<header class="header-wrap clearfix">
			<div class="logo" role="banner">
				<h1>
					<a href="index.html" title="梦豆投票网" rel="home"> 梦豆投票网 </a>
				</h1>
			</div>
			<!--未登录-->
			<!--<nav class="main-nav clearfix">
            <div class="menu-navigation-container">
                <ul id="menu-navigation" class="menu">

                    <li><a Id="registerLink" href="#">注册</a></li>
                    <li><a Id="loginLink" href="#">登录</a></li>

                    <li><a href="#">帮助</a></li>
                </ul>
            </div>
        </nav>-->
			<!--登录后-->
			<nav class="main-nav clearfix">
				<div class="menu-navigation-container">
					<ul id="menu-navigation" class="menu">

						<li><a class="username" href="account.html" title="管理">hughst</a>
							<ul class="sub-menu">
								<li><a href="addvote.html">发起投票</a></li>
								<li><a href="mylist.html">我的菜单</a></li>
								<li>
									<form Id="logoutForm" action="#" method="post">
										<a
											href="javascript:document.getElementById('logoutForm').submit()">注销</a>
									</form>
								</li>
							</ul></li>

						<li><a href="help.html">帮助</a></li>
					</ul>
				</div>
			</nav>

		</header>
		<!-- End Header -->


		<main class="content-section clearfix">

		<div class="list_carousel clearfix">
			<ul id="featured-posts">
				<c:forEach var="v" items="${CAROUSEL_ITEMS}">
					<li class="carousel-item">
						<div class="entry-margin">
							<h6 class="auto-hidden">
								<a href="vote/${v.id}">${v.title}</a>
							</h6>
							<span><i class="fa fa-clock-o"></i> <f:formatDate
									value="${v.createTime}" pattern="MM月dd日  yyyy" /> </span>
						</div>
						<div class="featured-image">
							<div class="entry-image">
								<a href="vote/${v.id}"> <img class="image-middle"
									src="${v.logo}" />
								</a>
							</div>
							<div class="entry-icon">
								<span class="fa-stack fa-lg"> <i
									class="fa fa-circle fa-stack-2x"></i> <i
									class="fa fa-picture-o fa-stack-1x fa-inverse"></i>
								</span>
							</div>
						</div>
						<div class="entry-margin">
							<p>
								发起人：${v.userName}<br> 总票数：${v.totalVotes}<br>
								浏览量：${v.totalBrowses}
							</p>
						</div>
					</li>
				</c:forEach>
			</ul>

			<div class="carousel-controls clear">
				<a id="prev2" class="prev"><i class="fa fa-angle-left"></i></a> <a
					id="next2" class="next"><i class="fa fa-angle-right"></i></a>
			</div>
		</div>

		<div id="main-content" class="content">

			<div id="newVotes">
				<script id="PageVoteTemplate" type="text/html">
    <article class="loop-container clearfix">
        <header class="entry-header">
            <div class="clearfix">
                <div class="entry-avatar">
                    <a href="#">
                        <img alt="头像" src="[HeadFace]" class="avatar avatar-70 photo" /></a>
                </div>
                <h3 class="entry-title"><a href="Vote/[Id]" title="[VoteName]" target="_blank">[VoteName]</a></h3>
            </div>
            <p class="entry-meta">
            	<span class="updated" role="剩余时间"><i class="fa fa-clock-o"></i>[TimeLeft]</span>
	            <span class="entry-category" role="浏览次数"><i class="fa fa-folder-open-o"></i>[ClickNumber]</span>
    	        <span role="评论次数"><i class="fa fa-comment-o"></i>[CommentListNum]</span>
            	<span role="发起人"><i class="fa fa-user"></i>[LoveName]</span>
            </p>
        </header>
        <section>	
        	[Content]
        </section>
        <ul class="entry-social clearfix">
            <li class="entry-social-more"><a href="Vote/[Id]" class="more-link" target="_blank">参与投票 <i class="fa fa-arrow-circle-o-right"></i></a></li>
        </ul>
    </article>
</script>
			</div>

			<div id="loadmore" class="content-background clearfix">
				<p class="center-container">
					<button id="addsubmit" class="submit">查看更多</button>
					<span id="voteloader" style="display: none;"> ...<i
						class="fa fa-circle-o-notch fa-spin"></i>
					</span>
				</p>
			</div>

		</div>


		<aside id="main-sidebar" class="sidebar">

			<section class="sb-widget">
				<div class="widget-content">
					<form action="/Search" class="searchform" id="searchform"
						method="get">
						<div>
							<input type="text" value="" name="keywords" id="keywords" /> <input
								type="submit" id="searchsubmit" value="搜索" />
						</div>
					</form>
				</div>
			</section>

			<article>
				<section class="ad-desktop ad-container-mb">
					<div class="widget-content">
						<img src="img/guanggao.jpg" />
					</div>
				</section>

				<section class="ad-pad ad-container-mb">
					<div class="widget-content">
						<img src="img/guanggao.jpg" />
					</div>
				</section>
			</article>

			<article class="sb-widget">
				<div class="widget-content">
					<h4 class="widget-title">分类</h4>
					<ul>

						<li><a href="#">文字投票</a></li>

						<li><a href="#">图片投票</a></li>
					</ul>
				</div>
			</article>


			<article class="sb-widget">
				<div class="widget-content">
					<h4 class="widget-title">排行榜</h4>
					<ul class="cp-widget clearfix">

						<li class="auto-hidden"><a href="#">华融湘江银行衡阳分行“走进华融
								感受融情”活动，诚邀您一起加入</a></li>

						<li class="auto-hidden"><a href="#">七彩王国儿童乐园第一届儿童才艺比赛投票</a></li>

						<li class="auto-hidden"><a href="#">北汽幻速第二届销售超人大赛华东战区温州站总决赛</a></li>

						<li class="auto-hidden"><a href="#">北汽幻速第二届超人大赛山东特区决赛</a></li>

						<li class="auto-hidden"><a href="#">2017龙鼎区导师比武大赛总决赛投票</a></li>

						<li class="auto-hidden"><a href="#">2017年度海北州银行业文明规范“服务明星”网络投票活动</a></li>

						<li class="auto-hidden"><a href="#">我微笑、您评选。华融湘江银行张家界分行期待你宝贵的一票</a></li>

					</ul>
				</div>
			</article>
		</aside>
		</main>


		<footer id="footer" class="footer clearfix">
			<nav class="social-nav clearfix">
				<div class="menu-social-container">
					<ul id="menu-social" class="menu">
						<li class="menu-item"><a target="_blank" href="#"><span
								class="social-icon"><i class="fa fa-social"></i></span><span
								class="screen-reader-text">腾讯微博</span></a></li>
						<li class="menu-item"><a target="_blank" href="#"><span
								class="social-icon"><i class="fa fa-social"></i></span><span
								class="screen-reader-text">新浪微博</span></a></li>
						<li class="menu-item"><a target="_blank" href="#"><span
								class="social-icon"><i class="fa fa-social"></i></span><span
								class="screen-reader-text">微信</span></a></li>
					</ul>
				</div>
			</nav>
			<div class="copyright-wrap">
				<p class="copyright">
					<a target="_blank" href="http://www.beian.gov.cn/">渝公网安备000000000000号.</a>
					渝ICP备000000000号.
				</p>
			</div>
		</footer>
		<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

	</div>
	<!--
<div class="ad-mobile ad-fix-bottom"><img src="img/guanggao_mobile.jpg" /><span class="ad-fix-bottom-close">x</span></div>
-->

	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/common.min.js"></script>
	<script src="js/jquery.carouFredSel-6.2.1-packed.js"></script>
	<script>
		$('#featured-posts').carouFredSel({
			auto : true,
			prev : '#prev2',
			next : '#next2',
			width : '100%',
			height : 'auto',
			scroll : {
				pauseOnHover : true
			}
		});
	</script>
</body>
</html>
