<%@page pageEncoding="utf-8" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="zh"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="zh"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="zh"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html lang="zh">
<!--<![endif]-->
<head>
	<meta charset="utf-8">
	<base href="<%=request.getContextPath()%>/">
    <link href="/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /><title>
        用户登陆_梦豆投票网
    </title><link href="css/style.min.css" rel="stylesheet"/>

    <script src="js/modernizr-2.8.3.js"></script>
</head>
<body class="right-sb">

<div class="container">


    <!-- Start Header -->
    <header class="header-wrap clearfix">
        <div class="logo" role="banner">
            <a href="index.html" title="梦豆投票网" rel="home">
                <div class="logo-text">
                    <h1 class="logo-name">梦豆投票网</h1>
                </div>
            </a>
        </div>
        <nav class="main-nav clearfix">
            <div class="menu-navigation-container">
                <ul id="menu-navigation" class="menu">

                    <li><a Id="registerLink" href="register.html">注册</a></li>
                    <li><a Id="loginLink" href="login.html">登录</a></li>

                    <li><a href="help.html">帮助</a></li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- End Header -->

    <div class="content-section clearfix">
        <div id="main-content">
            <article class="content-margin content-background clearfix">
                <header class="page-title-wrap">
                    <h1 class="page-title">用户登陆</h1>
                </header>
                <div class="entry-content clearfix">
                    <form action="#" method="post"><input name="__RequestVerificationToken" type="hidden" value="EBUD26lhNPBbMmUYy7G8V0uo-s4beO3BVBQwNRJ3ZAZ_jETVs3cXxTjF8o2dy7Ibl2_PG-lOmWPUHg-xMLvGymVenTjeblKnyFi21UAIn7E1" />

                        <p>
                            <label for="Email">邮箱</label><br />
                            <input data-val="true" data-val-email="邮箱格式不对" data-val-required="邮箱 字段是必需的。" id="Email" name="Email" type="text" value="" />
                            <span class="field-validation-valid" data-valmsg-for="Email" data-valmsg-replace="true"></span>
                        </p>
                        <p>
                            <label for="Password">密码</label><br />
                            <input data-val="true" data-val-required="密码 字段是必需的。" id="Password" name="Password" type="password" />
                            <span class="field-validation-valid" data-valmsg-for="Password" data-valmsg-replace="true"></span>
                        </p>
                        <p>
                            <input data-val="true" data-val-required="记住我? 字段是必需的。" id="ReMemberMe" name="ReMemberMe" type="checkbox" value="true" /><input name="ReMemberMe" type="hidden" value="false" />
                            <label Class="checkbox" for="ReMemberMe">记住我?</label>
                            <a href="#">忘记密码</a>
                        </p>
                        <p>
                            <input type="submit" value="登录" />
                        </p>
                    </form>
                </div>
            </article>
        </div>
        <aside id="main-sidebar" class="sidebar">
            <div class="sb-widget">
                <div class="widget-content">
                    <form action="/Search" class="searchform" id="searchform" method="get">
                        <div>
                            <input type="text" value="" name="keywords" id="keywords" />
                            <input type="submit" id="searchsubmit" value="搜索" />
                        </div>
                    </form>
                </div>
            </div>

        </aside>
    </div>


    <footer id="footer" class="footer clearfix">
        <nav class="social-nav clearfix">
            <div class="menu-social-container">
                <ul id="menu-social" class="menu">
                    <li class="menu-item"><a target="_blank" href="#"><span class="social-icon"><i class="fa fa-social"></i></span><span class="screen-reader-text">腾讯微博</span></a></li>
                    <li class="menu-item"><a target="_blank" href="#"><span class="social-icon"><i class="fa fa-social"></i></span><span class="screen-reader-text">新浪微博</span></a></li>
                    <li class="menu-item"><a target="_blank" href="#"><span class="social-icon"><i class="fa fa-social"></i></span><span class="screen-reader-text">微信</span></a></li>
                </ul>
            </div>
        </nav>
        <div class="copyright-wrap">
            <p class="copyright">Copyright &copy; 2017 <a href="index.html" title="梦豆投票网">梦豆投票网</a></p>
        </div>
    </footer>
    <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

</div>

<script src="js/jquery-1.11.1.min.js"></script>

<script src="js/common.min.js"></script>



</body>
</html>
