<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>收银台</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<script src="/js/ajax.js" type="text/javascript" charset="utf-8"></script>
<script src="/js/jquery-1.6.4.js" type="text/javascript" charset="utf-8"></script>
<script src="/js/jquery.cookie.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="css/confirmOrder.css" />
</head>
<body>
	<!--logo-->
		<div class="logo banxin " >
			<a href="#"><img src="images/logo_03.png"/></a>
			<div>1.提交订单</div>
			<div>2.选择支付方式</div>
			<div>3.购买成功</div>
		</div>
	
	<!--倒计时-->
	<div class="top banxin">
		<p>
			<span class="icon">◔</span>请在<span class="daojishi" id="daojishi">15:00</span>内完成支付,超时订单会自动取消
		</p>
	</div>
	<!--倒计时结束-->

	<!--店名+订单号+应付金额-->
	<div class="middle banxin">
		<span>项目：</span> <span class="dianId" id="sname"></span> <span
			class="orderId" id="orderid"></span> <span class="fl"><span
			class="paypaypay">应付金额：</span><span class="price" id="price"></span></span>
	</div>

	<!--店名+订单号+应付金额结束-->


	<!--支付模块-->
	<div class="BigPay banxin">
		<div class="PayTop">
			<ul>
				<li id="Dithree">支付宝/财付通/微信</li>
				<li id="personal">个人网银支付</li>
			</ul>
		</div>

		<!--支付方式-->
		<ul class="zhifukuang" id="zhifukuang">
			<li><input type="radio" name="pay" value="" /> <img
				src="images/pc_wxqrpay.png" /></li>
			<li><input type="radio" name="pay" value="" /> <img
				src="images/alipaypcnew.png" /></li>
			<li><input type="radio" name="pay" value="" /> <img
				src="images/tenpay2.png" /></li>




		</ul>
		<!--支付方式结束-->

		<div class="PayBottom">
			<div>
				<span>支付￥</span><span class="price" id="zprice"></span>
			</div>
			<div class="goPay">
				<span class="return" onclick="backorder()">返回修改订单</span><span class="PayMoney" id="PayMoney">去付款</span>
			</div>
			<div class="weixuanze" id="weixuanze">你未选择付款方式</div>
		</div>


	</div>
	<!--支付模块结束-->
	
	<!--点去付款弹出付款成功-->
		<div class="Info" id="Info">
			<div class="cha" id="cha">
					×
			</div>
			<div class="Info-top" id="Info-top">
				付款成功
			</div>
			<div class="Info-bottom" id="Info-bottom">
				请耐心等待店铺接单   ๑*◡*๑
			</div>
		</div>
		
		<!--点去付款弹出付款成功结束-->
</body>
<script type="text/javascript">
		var sid=<%=request.getParameter("sid") %>;
</script>
<script src="js/confirmOrder.js" type="text/javascript" charset="utf-8"></script>
</html>