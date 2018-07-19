<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<<title>外卖订餐_地址_电话_环境(图)</title>
		<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="/css/restaurant.css"/>
		
		<script src="/js/ajax.js" type="text/javascript" charset="utf-8"></script>
		<script src="/js/jquery-1.6.4.js" type="text/javascript" charset="utf-8"></script>
		<script src="/js/jquery.cookie.js" type="text/javascript" charset="utf-8"></script>
		<script src="/js/restaurant.js" type="text/javascript" charset="utf-8"></script>
		<script src="/js/cart.js" type="text/javascript" charset="utf-8"></script>
		
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
							<li><a href="#">我的订单</a></li>
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
					<li><a href="#">我的订单</a></li>
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
		
		
		<div class="banxin restaurant">
			<div class="restaurant-left">
				<div class="restaurant-left-left" >
					<div class="hidebox" id="hidebox">
		
				    </div>
				
				     <div id="visible">
				     	
				     </div>
					
					
				</div>
				
				 <ul class="restaurant-right-right">
				 	<li>
				 		<p>平均送餐时间</p>
				 		<span class="shuzi">37</span><span>分钟</span>
				 	</li>
				 	<li>
				 		<p>起送</p>
				 		<span class="shuzi">30</span><span>元</span>
				 	</li>
				 	<li>
				 		<p>配送费</p>
				 		<span class="shuzi">5</span><span>元</span>
				 	</li>
				 </ul>
					
				
			</div>
			<div class="restaurant-right">
				<p>收藏本店</p>
				<span>♡</span>
			</div>
			
		</div>
		
		<div class="banxin">
			<div class="dishlist">
			<div class="dishlist-top">
				<ul>
					<li class="current">
						<span>菜单</span>
					</li>
					<li>
						<span>评价</span>
					</li>
					<li>
						<span>食品安全档案</span>
					</li>
					
				</ul>
			</div>
			<div class="dishlist-bottom" id="dishtype">
				
			</div>
		</div>
		</div>
		
	
		<!--店家菜品部分-->
		<div class="banxin" id="typeAndDish">

		</div>
		<!--店家菜品部分结束-->
	
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
					<img src="images/erweima_07.png"/>
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
		<!--购物车部分-->
		

		
			<div class="buycart">
				
				<div class="buycart-top">
						电脑下单不享优惠了哦,优惠活动手机专享~		
				</div>
				
				<div class="dishcart" id="dishcart">
					<div class="dishcart-top">
						<span>购物车</span>
						<span class="cleardish" >清空菜品</span>
					</div>
					
					<ul class="dishcart-middle" >
						
						
						<li>
							<span class="name" >配送费</span>
							
							
							<div class="caiprice">￥6</div>
							
						
						</li>
					
					</ul>
					
					<div class="dishcart-bottom">
						<p>
							<span>共</span>
							<span class="totalnumber" >0</span>
							<span>份,</span>
							<span>总计</span>
							<span class="totalprice" >￥6</span>
						</p >
					</div>
					
				</div>
				
				<div class="buycart-bottom" id="cartbottom">
					<div class="buycart-bottom-left">
					★
					</div>
					
					<div class="buycart-bottom-right" id="buy">
						<span class="panduan" onclick='order()'>差20元起送</span>
					</div>
				</div>
		
			</div>
		</div>
		
		
		<!--购物车部分结束-->
	</body>
	
	<script>
	var sid=<%=request.getParameter("sid") %>;

	</script>

	
</html>