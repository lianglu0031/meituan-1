<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
		<title>登录&nbsp;丨肥肥外卖</title>
		<link rel="stylesheet" type="text/css" href="/css/login.css"/>
		<script src="/js/login.js" type="text/javascript" charset="utf-8"></script>
		<script src="/js/jquery-1.6.4.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
 			<!--登录页面logo-->
			<div class="logo banxin">
				<a href="index.html"><img src="/images/logo_03.png"/></a>
			</div>
			<!--主体部分-->
			<div class="main banxin">
				
				<img src="/images/delogo.png" alt="" />
				<div class="login">
					<p class="zi">美团外卖</p>
					<div class="info" id="info"></div>
					<span class="user"></span>
					<input type="text" name="username" id="username" placeholder="手机号/用户名/邮箱"/><br />
					<span class="lock"></span>
					<input type="password" name="password" id="password" placeholder="密码"/>
					<p ><a href="#" class="forget">忘记密码</a></p>
					<input type="submit" value="登录" id="btn" />
					<p class="no">还没有账号？ <a href="register.html">免费注册</a></p>
				</div>
			</div>
</body>
</html>