<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册&nbsp;丨肥肥外卖</title>
		<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="/css/register.css"/>
		<script src="/js/ajax.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
		<div class="Info" id="Info">
			<div class="cha" id="cha">
					×
			</div>
			<div class="Info-top" id="Info-top">
				
			</div>
			<div class="Info-bottom" id="Info-bottom">

			</div>
		</div>
		<header>
		</header>
		<div class="banxin">
			<div class="mainregister">
				<ul>
					<li><span>用户名</span><input type="text" id="username" /><span class="infomation" id="errusername"></span></li>
					<li><span>密&nbsp;&nbsp;&nbsp;码</span><input type="password" id="pw" /><span class="infomation" id="errpassword"></span></li>
					<li><span>确认密码</span><input type="password" id="querenpw" class="again" /><span class="infomation" id="errrepeatpassword"></span></li>
					<li><span>手机号</span><input type="text" id="phonenumber" /><span class="infomation" id="errphone"></span></li>
					<li><input type="button" class="square" id="square"/> <span class="agree">我已阅读并同意 <a href="#">《用户注册协议》</a></span><span class="infomation" id="errxieyi"></span></li>
					<li><input type="button" class="registerbtn" value="注册" id="register"/> </li>
				</ul>

			</div>
		</div>
	</body>
		<script src="/js/register.js" type="text/javascript" charset="utf-8"></script>
</html>