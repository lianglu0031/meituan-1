<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>越秀区仲恺农业工程学院(海珠校区)附近外卖送餐网站_电话-美团外卖</title>
		<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="/css/index.css"/>
		<script src="/js/ajax.js" type="text/javascript" charset="utf-8"></script>
		<script src="/js/index.js" type="text/javascript" charset="utf-8"></script>
		<script src="/js/jquery-1.6.4.js" type="text/javascript" charset="utf-8"></script>
		<script src="/js/jquery.cookie.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
		<!--页面头部分-->
		<header>
			<div class="top-nav banxin">
				<div class="top-left">
					<span class="addressimg"></span>
					<span class="address">越秀区&nbsp;&nbsp;仲恺农业工程学院(海珠校区)</span>
					<i>丨</i>
					<a href="#">切换地址</a>
				</div>
				<div class="top-right">
					<span id="name"><span id="uname"></span> <span id="down">▼</span>
					<div id="xialikuang">
						<ul>
							<li><a href="/myorder">我的订单</a></li>
							<li><a href="#">我的收藏</a></li>
							<li><a href="#" onclick="exit();">退出</a></li>
						</ul>
					</div>
					</span>
					<a href="register.html" class="register" id="register">注册</a>
					<i id="fenge">丨</i>
					<a href="login.html" class="login" id="login">登录</a>
					<a href="#" class="mobileVer">&nbsp;手机版</a>
					<a href="#" class="meituanwang">&nbsp;美团网</a>
					<a href="#" class="contact">&nbsp;联系我们</a>
				</div>
				
			</div>
		</header>
		<!--页面头部分结束-->
		<!--导航栏部分开始-->
		<div class="nav">
			<div class="nav-in banxin">
				<!--logo部分-->
				<div class="logo">
					<a href="#"><img src="/images/logo.png" height="42px" title="美团外卖"/></a>
				</div>
				<!--小导航栏部分-->
				<ul class="navitem">
					<li><a href="#">首页</a></li>
					<li><a href="/myorder">我的订单</a></li>
					<li><a href="#">入驻加盟</a></li>
				</ul>
				<!--搜索框部分-->
				<div class="search">
					<input type="text" name="" id="" placeholder="搜索商家、美食" />
					<button><span></span></button>
				</div>
			</div>
		</div>
		<!--导航栏部分结束-->
		<!--分类二部分开始-->
		<div class="sort2 banxin">
			<ul id="ul">
				<li ><img src="/images/icon_sort2.png"/>商家分类</li>
				<li class="selected" ><a href="javascript:void(0);" id="" onclick="f(this.id)" >全部</a></li>
				<li ><a href="javascript:void(0);" id="meishi" onclick="f(this.id)" >美食</a></li>
				<li ><a href="javascript:void(0);" id="zhengcan" onclick="f(this.id)">正餐优选</a></li>
				<li><a href="javascript:void(0);" id="chaoshi" onclick="f(this.id)">超市</a></li>
				<li><a href="javascript:void(0);" id="xiaochi" onclick="f(this.id)">精选小吃</a></li>
				<li><a href="javascript:void(0);" id="xianguo" onclick="f(this.id)">鲜果购</a></li>
				<li><a href="javascript:void(0);" id="xiawu" onclick="f(this.id)">下午茶</a></li>
				<li><a href="javascript:void(0);" id="yaopin" onclick="f(this.id)">药品</a></li>
			</ul>
		</div>
		<!--分类二部分结束-->
		
		<!--主体部分-->
		<div class="banner banxin" id="banner">
			
		</div>
		<div class="loadmore banxin"  id="" onclick="add(this.id);">
			点击加载更多商家
		</div>
		<!--主体部分结束-->
		
		<!--页面底部分开始-->
		<footer>
			<div class="footer-in banxin">
				<ul class="col1">
					<li><a href="#">开店申请</a></li>
					<li><a href="#">配送加盟</a></li>
					<li><a href="#">城市代理</a></li>
					<li><a href="#">零售加盟</a></li>
				</ul>
				<ul class="col1">
					<li><a href="#">开放平台</a></li>
					<li><a href="#">关于美团</a></li>
					<li><a href="#">媒体报道</a></li>
					<li><a href="#">平台制度</a></li>
				</ul>
				<ul class="col1">
					<li><a href="#">常见问题</a></li>
					<li><a href="#">用户举报</a></li>
					<li><a href="#">诚信举报</a></li>
					<li><a href="#">加入我们</a></li>
				</ul>
				<div class="telephone">
					<h4>1010-9777</h4>
					<p>周一至周日 9:00-23:00<br />
						客服不受理商务合作</p>
				</div>
				<div class="erweima">
					<img src="/images/erweima_07.png"/>
					<h4>小程序下单</h4>
					<p>更多商家，更多优惠</p>
				</div>
			</div>
		</footer>
		<!--页面底部分结束-->
		
		<!--版权信息-->
		<div class="copyright">
			<a href="#"><img src="/images/bq_16.png"/></a>
			<span>&copy;2015 meituan.com 京ICP证070791号 京公网安备11010502025545号</span>
		</div>
		<!--版权信息结束-->
		

	</body>
	<script>
	var MT=MEITUAN={
			checkLogin:function(){
				var _ticket= $.cookie("MT_TOKEN");
				if(!_ticket){
					return ;
				}
				$.ajax({
					type:"get",
					url:"/token/"+_ticket,
					dataType:"json",
					async:true,
					success:function(data){
						if(data.status==200){
							var username=data.data.username;
							var html=username;
							$("#uname").html(html);
							var name=document.getElementById("name");
							var register=document.getElementById("register");
							var fenge=document.getElementById("fenge");
							var login=document.getElementById("login");
							var down=document.getElementById("down");
							down.style.visibility="visible";
							name.style.visibility="visible";
							register.style.visibility="hidden";
							fenge.style.visibility="hidden";
							login.style.visibility="hidden";
							
						}
					}
				});
			}
			
		}
		$(function(){
			MT.checkLogin();
		});
		function exit(){
						var name=document.getElementById("name");
							var register=document.getElementById("register");
							var fenge=document.getElementById("fenge");
							var login=document.getElementById("login");
							var down=document.getElementById("down");
							down.style.visibility="hidden";
							name.style.visibility="hidden";
							register.style.visibility="visible";
							fenge.style.visibility="visible";
							login.style.visibility="visible";
		}

	</script>
	
</html>