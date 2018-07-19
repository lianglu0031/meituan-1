<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商家管理页面</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="css/seller.css" />
<script src="/js/ajax.js" type="text/javascript" charset="utf-8"></script>
<script src="/js/seller.js" type="text/javascript" charset="utf-8"></script>
<script src="/js/jquery-1.6.4.js" type="text/javascript" charset="utf-8"></script>
<script src="/js/jquery.cookie.js" type="text/javascript"
	charset="utf-8"></script>
</head>
<body>
	<!--页面头部分-->
	<div class="top">
		<div class="diantu" id="sellersrc">
			<img src="images/restaurant_03.png" />
		</div>
		<div class="pingfen" id="seller-top">
			<span class="restaurant-name">尊宝比萨(江湾店)</span> <span class="arrow"></span>
			<br /> <span class="pingjiarank"><img
				src="images/star_03.png" /><img src="images/star_03.png" /><img
				src="images/star_03.png" /><img src="images/star_03.png" /><img
				src="images/star_03.png" /> <span>4.6分</span> </span>
		</div>

		<div class="biaoti">商家</div>
		<ul class="Login">
			<li>yangdelong</li>
			<li>帮助</li>
			<li>举报</li>
			<li>✉</li>
		</ul>

	</div>
	<!--页面头部分结束-->

	<!--商家管理部分-->
	<div class="sellerManage banxin">
		<div class="sellerManage-nav">
			<ul>
				<li><p>商家管理</p>
					<p class="qooqoqo">美团旗下餐饮商家</p></li>
				<li onclick="showRestaurant();"><span>✿</span>店铺信息</li>
				<li onclick=" WeiJieDan();"><span>❤</span>订单管理</li>
				<li><span>✚</span>添加菜单</li>
				<li><span>✘</span>删除菜单</li>
				<li><span>◮</span>修改菜单</li>
				<li><span>☛</span>添加菜品</li>
			</ul>
		</div>

		<div class="sellerManage-container" id="container">

			<div class="navName">店铺信息</div>

			<!--店铺信息部分-->
			<div class="aaaaaaaa">
				<div class="hideTime">
					<span>۞</span> <span class="time">营业时间</span> <span>09:00-23:00</span>
				</div>
				<div class="hideAddress">
					<span>◮</span> <span class="time">商家地址</span> <span>海珠区怡安路</span>
				</div>
				<div class="hideTel">
					<span>℡</span> <span class="time">商家电话</span> <span>020-84384444</span>
				</div>
			</div>

			<!--店铺信息部分结束-->

			<!--订单管理部分-->
			<div class="orderPart" style="display: none;">
				<div class="orderPart-nav">
					<span class="Select">未接单</span> <span>未派送</span> <span>已派送</span> <span>已完成</span>
				</div>

				<div class="ordercontent">
					<div class="bianhao">
						<span>订单编号：</span> <span class="IdforOrder">113410394109229299</span>
						<span>联系人：</span> <span class="contaceMan">杨德龙
							&nbsp;&nbsp;&nbsp;先生</span> <span>联系电话：</span> <span class="Tel">13609736632</span>
					</div>
					<div class="peisong">
						<span>配送地址：</span> <span class="dizhi">仲恺农业工程学院 7291</span> <span>期望送达时间：</span>
						<span class="shijian">12:00</span>
					</div>

					<ul>
						<li><span>菜品</span> <span style='float: right'>价格/份数</span></li>

						<li><span class="caipin">超级苏丹王黄金果肉榴莲比萨</span> <span
							class="jiage" style='float: right'>￥118</span></li>

						<li><span class="caipin">配送费</span> <span class="jiage"
							style='float: right'>￥6</span></li>

						<li><span class="heji">合计</span> <span class="totalprice"
							style='float: right'>￥123</span></li>
					</ul>

					<div class="bbbb">
						<span>备注信息：</span>
						<textarea name="beizhu" rows="1" cols="80" class="beizhu"
							readonly="readonly">不放辣，不放盐
								</textarea>
					</div>

					<div style="overflow: hidden;">
						<div class="jiedan" id="jiedan">去接单</div>

					</div>




				</div>

			</div>
			<!--订单管理部分结束-->

		</div>
	</div>
	<!--商家管理部分结束-->


</body>
<script type="text/javascript">
	var sid =<%=request.getParameter("sid")%>;
	function showRestaurant() {
		var contain = document.getElementById("container");
		var html = "<div class='navName'>店铺信息</div>";
		ajax("/seller/find/" + 1, function(result){
		var obj1 = JSON.parse(result);
		html += "<div class='aaaaaaaa'><div class='hideTime'><span>۞</span><span class='time'>营业时间</span><span>"+obj1.data.businessTime+"</span></div>";
		html += "<div class='hideAddress'><span>◮</span><span class='time'>商家地址</span><span>"+obj1.data.address+"</span></div>";
		html += "<div class='hideTel'><span>℡</span><span class='time'>商家电话</span><span>"+obj1.data.pnumber+"</span></div>";
		html += "</div>";
		contain.innerHTML = html;
	});
	}
	function JieDan(oid) {
		ajax("/orders/accept/"+oid,function(result){
			var obj1 = JSON.parse(result);
			if(obj1.status == 200){
		var jiedan = document.getElementById("jiedan"+oid);
		jiedan.innerHTML = "已接单";
		jiedan.style.backgroundColor = "#999999";
		setTimeout("WeiJieDan()", 2000);
			}
		});
	}
	function PaiSong(oid){
		ajax("/orders/send/"+oid,function(result){
			var obj1 = JSON.parse(result);
			if(obj1.status == 200){
		var jiedan = document.getElementById("paisong"+oid);
		jiedan.innerHTML = "已派送";
		jiedan.style.backgroundColor = "#999999";
		setTimeout("WeiPaiSong()", 2000);
			}
		});
	}
	function wait(oid){
		ajax("/orders/complete/"+oid,function(result){
			var obj1 = JSON.parse(result);
			if(obj1.status == 200){
		var jiedan = document.getElementById("wait"+oid);
		jiedan.innerHTML = "已完成";
		jiedan.style.backgroundColor = "#999999";
		setTimeout("YiPaiSong()", 2000);
			}
		});
	}

	function clearOrder() {
		var ordercontent = document.getElementById("ordercontent");
		ordercontent.innerHTML = "<p align='center'>未查询到订单信息</p>";
	}

	//		未接单调用函数
	function WeiJieDan() {
		getOrder("1");
	}

	//		点击未派送调用函数
	function WeiPaiSong() {
		getOrder("2");
	}

	//		点击已派送调用函数
	function YiPaiSong() {
		getOrder("3");
	}

	//		点击已完成调用函数
	function YiWanCheng() {
		getOrder("4");
	}
</script>
</html>