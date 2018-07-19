<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
		<script src="/js/ajax.js" type="text/javascript" charset="utf-8"></script>
		<script src="/js/jquery-1.6.4.js" type="text/javascript" charset="utf-8"></script>
		<script src="/js/jquery.cookie.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
				* {
			margin: 0;
			padding: 0;
		}
		ul {
			list-style: none;
		}
		a{
			text-decoration: none;
		}
		body {
			background-color: #f5f5f5;
		}
		.banxin {
			width: 980px;
			margin: 0 auto;
		}
		/*页面头部分样式开始*/
		#name {
				display:inline-block;
				height:32px;
				color: #d7d7dd;
				font-size: 14px;
				position: relative;
				cursor: pointer;
				visibility: hidden;
			}
		#name #down {
			visibility: hidden;
		}
			#name:hover #xialikuang{
				
				visibility: visible;
			}
			#xialikuang {
			z-index: 1;
			position: absolute;
			background-color: #FFFFFF;
			visibility:hidden;
		}
		#xialikuang:hover {
			visibility: visible;
		}
		#xialikuang li a {
			font-size: 12px;
			display: block;
			width: 58px;
			padding-left: 8px;
			color: #898989;
		}
		#xialikuang a:hover {
			background-color: rgba(0,0,0,.1);
		}
		#down {
				color: #d7d7dd;
				font-size: 8px;
			}
			
		header {
			height: 32px;
			line-height: 32px;
			background-color: #333;
		}
		.top-nav {
			height: 32px;
			font-size: 9px;
			
		}
		.top-left .addressimg{
			font-family: "icomoon";
			color:#D7D7D7 ;
			font-size: 10px;

		}
		.address {
			color: #d7d7d7;
			padding-right: 5px;
		}
		.top-left {
			float: left;
		}
		.top-left a{
			color: #f8cc5c;
			padding-left: 3px;

		}	
		.top-left i {
			font-size: 10px;
			font-style: normal;
			color: #61574c;
		}
		/*顶部右部分开始*/
		.top-right {
			float: right;
		}
		.top-right .register {
			margin-right: 2px;
			color: #d7d7dd;
		}
		.login {
			margin-left: 1px;
			color: #D7D7DD;
			margin-right: 43px;
		}
		
		.top-right i {
			font-size: 10px;
			font-style: normal;
			color: #d7d7dd;
		}
		.mobileVer, .meituanwang,.contact{
			font-family: "icomoon";
			margin-right: 15px;
			color: #D7D7DD;

		}
		.contact {
			margin-right: 0;
		}
		/*页面头部分样式结束*/
		/*导航栏部分样式开始*/
		.nav {
			height: 85px;
			background-color: #fff;
			margin-bottom: 30px;
		}
		.nav-in {
			height: 85px;
			line-height: 85px;

			position: relative;
		}
		.logo a img {
			position: absolute;
			left: 0;
			top: 20px;
			
		}
		/*小导航栏部分样式*/
		.navitem li{
			float: left;
			margin-right: 64px;
		}
		.navitem li:first-child {
			margin-left: 300px;
		}
		.navitem li a{
			color: #333;
		}
		.navitem li a:hover {
			color: #ffa765;
		}
		/*搜索框样式*/
		.search {
			width: 300px;
			height: 42px;
			line-height: 0;
			background-color: purple;
			position: absolute;
			right: 0;
			top: 50%;
			transform: translateY(-50%);
		}
		.search input {
			width: 250px;
			height: 42px;
			outline: none;
			box-sizing: border-box;
			border: 2px solid #e5e5e5;
			float: left;
			padding-left: 8px;
		}
		.search button {
			outline: none;
			float:left;
			width: 50px;
			height: 42px;
			box-sizing: border-box;
			border: 2px solid #E5E5E5;
			border-left: 0;
			background-color: #fff;
			cursor: pointer;
		}
		.search button span {
			font-family: "icomoon";
			font-size: 20px;
		}
		
		/*导航栏部分样式结束*/
		
				footer {
			margin-top: 40px;
			height: 185px;
			background-color: #fff;
			margin-bottom: 12px;
		}
		.footer-in {
			padding: 32px 0;

		}
		.col1 {
			width: 146px;
			float: left;
		}
		.col1 li {
			line-height:33px ;
		}
		.col1 li a {
			color: #666666;
			font-size: 14px;
		}
		.col1 li a:hover {
			color: #000000;
		}
		.telephone {
			float: left;
			width: 250px;
			height: 114px;
			margin-top: 10px;

			border-left: 1px dashed #333333;
			border-right: 1px dashed #333;
		}
		.telephone h4 {
			margin-left: 48px;
			color: #333;
			font-size: 20px;
		}
		.telephone p {
			margin-left: 48px;
			margin-top: 10px;
			color: #666;
			font-size: 14px;
		}
		
		
		.erweima img{
			float: left;
			margin-left: 50px;
			margin-right: 15px;

		}
		.erweima h4 {
			color: #2a2a2a;
			margin-top: 10px;
		}
		.erweima p {
			margin-top: 10px;
			color: #666;
			font-size: 12px;
		}
		
		/*版权样式*/
		.copyright {
			width: 500px;
			height: 42px;
			margin: 0 auto;

		}
		.copyright img {
			vertical-align: middle;
		}
		.copyright span {
			color: #999;
			font-size: 12px;
			margin-left: 20px;
		}
		
		
		.Main {
			overflow:hidden;

		}
		/*左部导航栏样式*/
		.Main-left {
			background-color: #fff;
			float: left;
			width:170px;
			padding-top: 15px;
			padding-bottom: 1300px;	
		}
		.Main-left li {
			line-height: 56px;
			box-sizing: border-box;
			width: 170px;
			height: 56px;
			padding-left: 20px;
		}

		.Main-left li:hover {
			background-color: rgba(0,0,0,.1);
		}
		.Main-left li:first-child {
			background-color: rgba(0,0,0,.1);
		}
		
		.Main-right {
			float: right;
			width: 796px;
			padding-left: 30px;
			padding-right: 30px;
			background-color: #fff;
			box-sizing: border-box;
		}
		.Main-right-top {
			height: 51px;
			line-height: 51px;
			border-bottom: 1px solid #999;
		}
		.Main-right-top span {
			font-family: "微软雅黑";
			font-size: 14px;


		}
		.Main-right-top span:first-child {
			margin-right: 270px;
		}
		.Main-right-top span:nth-child(2){
			margin-right: 100px;
		}
		.Main-right-top span:nth-child(3){
			margin-right: 90px;
		}
		
		.Main-right-bottom li {
			overflow: hidden;
			cursor: pointer;
			width: 736px;
			height: 131px;
			border-bottom: 1px solid #999;
		}
		.Main-right-bottom li:hover {
			background-color: #EEEEEE;
		}
		.DingdanNeirong {
			float: left;
			box-sizing: border-box;
			height: 100%;
			width: 326px;
			padding-top: 20px;

		}
		.yyyyy {
			font-size: 14px;
			font-family: "微软雅黑";
			margin-top: 10px;
			box-sizing: border-box;

			margin-right: 10px;
			float: right;
			width: 180px;
			height: 70px;
			
		}
		.yyyyy p {
			margin-top: 10px;
			font-size: 12px;
		}
		
		.ShangjiaTel {
			float: left;
			margin-top: 55px;


		}
		.zhifujiner {
			font-size: 20px;
			color: red;
			float: left;
			margin-left: 70px;
			margin-top: 54px;
		
		}
		.caozuo {
			font-size: 14px;
			float: left;
			width: 100px;
			height: 40px;
			text-align: center;
			line-height: 40px;
			border: 1px solid #999;
			cursor: pointer;
			margin-top: 42px;
			margin-left: 60px;
		}
		.caozuo:hover {

			background-color: #F8CC5C;
		}
		.da {
			overflow: hidden;

		}
		
		.OrderXiangQing {
			cursor: auto;
			margin-top: 17px;
			width: 319px;
			height: 520px;
			box-sizing: border-box;
			border: 1px solid #999;

			float: left;
			padding-left: 20px;
			padding-top: 40px;
			
		}
		
		.kaokaokao {
			font-weight: 700;
			height: 50px;
			font-family: "微软雅黑";
			font-size: 18px;

		}
		
		.Dishlist {
			width: 260px;
			height: 139px;
			margin-right: 38px;
			border-bottom: 1px solid #C4C4C4;
		}
		.DishName {
			display: inline-block;

			width: 160px;
			overflow: hidden;
			white-space: nowrap;
			text-overflow: ellipsis;
		}
		.Dishlist p {

			height: 50px;
			font-size: 14px;
			font-family: "微软雅黑";
		}
		.Dishlist p span{
			display: inline-block;
		}
		
		.num {
			padding-top: 2px;
			vertical-align: top;
			margin-left: 10px;

		}
		.pppppp {
			padding-top: 2px;
			vertical-align: top;
			margin-left: 30px;
		}
		.pppppppppp {
			margin-left: 55px;
		}
		.allallall {

			margin-left: 140px;
		}
		
		.ShangjiaAddress {
			font-family: "微软雅黑";
			font-size: 14px;
			margin-top: 20px;
			height: 140px;
			border-bottom: 1px solid #C4C4C4;

		}
		.ShangjiaAddress p {
			color: #999999;
			height: 24px;
		}
		.kefu {
			margin-top: 20px;
			font-size: 14px;
			color: #999999;
		}
		.kefu p {
			height: 25px;
		}
		
		.orderStatus {
			cursor: auto;
			margin-top: 17px;
			width: 417px;
			height: 520px;
			box-sizing: border-box;
			border: 1px solid #999;

			float: left;
			padding-left: 20px;
			padding-top: 40px;


		}
		.Status{
			padding-left: 40px;

		}
		.Status p {
			font-size: 14px;
			height: 60px;
		}
		.HighLight {
			color: #FA9700;
		}
		.conment {
			margin-left: 260px;
			background-color: #06C1AE;
			cursor: pointer;
			font-family: "微软雅黑";
			border-radius: 20px;
			text-align: center;
			line-height: 40px;
			height: 40px;

			width: 100px;
		}
		</style>
	
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
					<li><a href="/index">首页</a></li>
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
		
		
		<div class="banxin Main">
			
			<!--左部导航栏-->
			<div class="Main-left">
					<ul>
						<li onclick="orderNumber();">✿ &nbsp;&nbsp;&nbsp;三个月订单</li>
						<li>✪ &nbsp;&nbsp;&nbsp;我的账号</li>
						<li>❤ &nbsp;&nbsp;&nbsp;我的收藏</li>
					</ul>	
			</div>
			
			<!--右部导航栏-->
			<div class="Main-right">
				<!--右部上部分（订单内容，电话，支付金额，操作）-->
				<div class="Main-right-top">
					<span>订单内容</span>
					<span>商家电话</span>
					<span>支付金额</span>
					<span>操作</span>
				</div>
				
				<!--右部下面遍历所有订单-->
				<div class="Main-right-bottom" >
					<ul id="CunfangOrder">
						<!--这里的li都是遍历的-->
						<li id="dianji">
							<div class="da">
								<!--订单内容部分-->
							<div class="DingdanNeirong">
								<img src="images/restaurant_03.png" alt="" width="118px" height="90px"/>
								<span class="yyyyy">
									<h4>尊宝比萨</h4>
									<p><span>2018-06-22  10:40</span></p>
									<p><span>订单号：</span><span>189291910101019</span></p>
								</span>
							</div>
							
							<!--商家电话部分-->
							<div class="ShangjiaTel">
								<span>020-112345909</span>
							</div>
							
							<!--支付金额部分-->
							<div class="zhifujiner">
								<span>￥</span><span>118</span>
							</div>
							
							<!--操作部分-->
							<div class="caozuo">
								<span>再来一单</span>
							</div>
						</div>
						
						
						<!--下面订单详情和订单状态部分-->
							
							<div class="OrderXiangQing">
								<div class="kaokaokao">订单详情</div>
								
								<!--遍历菜品部分-->
								<div class="Dishlist">
									<p>
										<span class="DishName" >苏丹王榴莲比萨比萨比萨比萨</span>
										<span class="num">1</span>
										<span class="pppppp">￥98</span>
									</p>
									
									<p>
										<span class="DishName" >配送费:</span>

										<span class="pppppppppp">￥6</span>
									</p>
									
									<p >
										<span>实际支付：</span>
										<span class="allallall"> ￥113</span>
									</p>
								</div>
								
								
								<!--商家地址部分-->
								<div class="ShangjiaAddress">
									<p>
										<span>地址：</span>
										<span>仲恺农业工程学院海珠校区6709</span>
									</p>
									
									<p>
										<span>姓名：</span>
										<span>杨德龙</span>
										<span>(</span>
										<span>先生</span>
										<span>)</span>
									</p>
									
									<p >
										<span>电话：</span>
										<span>13609736632</span>
									</p>
									
									<p >
										<span>备注：</span>
										<span>无</span>
									</p>
									
									<p >
										<span>本订单由 尊宝比萨 提供外卖服务</span>

									</p>
								</div>
								
								
								<!--本外卖由哪个店提供服务部分-->


								<div class="kefu">
									<p>
								
										<span>尊宝比萨</span>
										<span>客服电话：</span>
										<span>020-84384887</span>
									</p>
									
									<p>
									本餐厅所列商家所有信息、服务均来自合作方，其信息的真实性、准确性、
									合法性和服务的质量由信息拥有者(
									<span>尊宝比萨</span>
									)负责。
										
									</p>
									
									
								</div>
							</div>
							
							
							<!--订单状态部分-->
							<div class="orderStatus">
								<div class="kaokaokao">订单状态</div>
								
								<div class="Status">
									<p><span class="HighLight">订单提交成功，等待付款</span></p>
									
									<p><span>已付款，等待商家接单</span></p>
									
									<p><span>商家已接单</span></p>
									
									<p><span>派送中</span></p>
									<p><span>订单已完成</span></p>
						
								</div>
								
								<div class="conment">评价</div>
							</div>
							
							
							
							
					    </li>
						
						
					</ul>
				</div>
				
			</div>
			
		</div>
		
		
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
	
	<script type="text/javascript">
	
	var dianji=document.getElementById("dianji");
	var s=1;
	dianji.onclick=function(){
		if(s==1){
			s=2;
			dianji.style.height="652px";
		}else {
			s=1;
			dianji.style.height="131px";
		}
		
	}
	
	function orderNumber(){
		var CunOrder=document.getElementById("CunfangOrder");
		var html="";
		var i=0;
		var j=0;
		while(i<3){
			html+="<li>";
			html+="<div class='da'><div class='DingdanNeirong'><img src='images/restaurant_03.png'  width='118px' height='90px'/>";
			html+="<span class='yyyyy'><h4>尊宝比萨</h4><p><span>2018-06-22  10:40</span></p><p><span>订单号：</span><span>189291910101019</span></p></span>";
			html+="</div><div class='ShangjiaTel'><span>020-112345909</span></div>";
			html+="<div class='zhifujiner'><span>￥</span><span>118</span></div>";
			html+="<div class='caozuo'><span>再来一单</span></div></div>";
			html+="<div class='OrderXiangQing'><div class='kaokaokao'>订单详情</div><div class='Dishlist'>";
			//遍历点了多少个菜
			while (j<3){
				html+="<p><span class='DishName' >苏丹王榴莲比萨比萨比萨比萨</span><span class='num'>1</span><span class='pppppp'>￥98</span></p>";
				j++;
			}
			html+="<p><span class=‘DishName’ >配送费:</span><span class='pppppppppp'>￥6</span></p>"
			html+="<p><span>实际支付：</span><span class='allallall'> ￥113</span></p>";
			html+="</div><div class='ShangjiaAddress'><p><span>地址：</span><span>仲恺农业工程学院海珠校区6709</span></p>";
			html+="<p><span>姓名：</span><span>杨德龙</span><span>(</span><span>先生</span><span>)</span></p>";
			html+="<p ><span>电话：</span><span>13609736632</span></p><p ><span>备注：</span><span>无</span></p>";
			html+="<p ><span>本订单由 尊宝比萨 提供外卖服务</span></p></div>";
			html+="<div class='kefu'><p><span>尊宝比萨</span><span>客服电话：</span><span>020-84384887</span></p>";
			html+="<p>本餐厅所列商家所有信息、服务均来自合作方，其信息的真实性、准确性、合法性和服务的质量由信息拥有者(<span>尊宝比萨</span>)负责。</p></div></div>";
			html+="<div class='orderStatus'><div class='kaokaokao'>订单状态</div><div class='Status'>";
			html+="<p><span class='HighLight'>订单提交成功，等待付款</span></p><p><span>已付款，等待商家接单</span></p><p><span>商家已接单</span></p><p><span>派送中</span></p>";
			html+="<p><span>订单已完成</span></p></div><div class='conment'>评价</div></div>";
			html+="</li>";
		}
		
		CunOrder.innerHTML="";
	}
		
	</script>
</html>
