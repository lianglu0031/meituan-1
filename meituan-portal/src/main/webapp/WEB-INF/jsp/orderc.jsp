<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>美团外卖-确认订单</title>
		<link rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
		<link rel="stylesheet" type="text/css" href="css/order.css"/>
		
		<script src="/js/ajax.js" type="text/javascript" charset="utf-8"></script>
		<script src="/js/order.js" type="text/javascript" charset="utf-8"></script>
		<script src="/js/jquery-1.6.4.js" type="text/javascript" charset="utf-8"></script>
		<script src="/js/jquery.cookie.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>
		<!--遮盖页面层-->
		
		<div class="hidePage" id="hidePage">
			
		</div>
		<!--遮盖页面层结束-->
		
		
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
					<a href="#" class="register" id="register">注册</a>
					<i id="fenge">丨</i>
					<a href="#" class="login" id="login">登录</a>
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
		
		<!--店名  > 确认购买部分-->
		<div class="banxin sure">

			<span class="restName" id="sname">尊宝比萨（江湾店）</span>

			<span><span>></span>确认购买</span>
		</div>
		<!--店名  > 确认购买部分结束-->
		
		<!--主体内容部分-->
		<div class="banxin main">
			
			<!--菜品---价格/份数部分-->
			<div class="main-left">
				<ul id="cart">
					<li>
						<span>菜品</span>
						<span style='float: right'>价格/份数</span>
					</li>
					
					<li>
						<span class="caipin">超级苏丹王黄金果肉榴莲比萨</span>
						<span class="jiage"   style='float: right'>￥118</span>
					</li>
					
					<li>
						<span class="caipin">配送费</span>
						<span class="jiage"   style='float: right'>￥6</span>
					</li>
					
					<li>
						<span class="heji">合计</span>
						<span class="totalprice"   style='float: right'>￥123</span>
					</li>
				</ul>
				
				<div class="youhuiquan">
						
					<span class='gudi'>优惠券&nbsp;&nbsp;:</span>
					<input type="text" readonly="readonly" id="selectquan" value="选择优惠券"/>
					<div class="arrow-down" id="arrowdown">
						▼
					</div>
					
					<div class="quan-info" id="quaninfo">
						
					
					<input type="text" readonly="readonly"  value="没有可用的优惠券"/>
				
					</div>
				
				</div>

			</div>
			
			
			<!--送餐详情部分-->
			
			<div class="main-right">
				<!--送餐-付款方式部分-->
				<div class="main-right-top">
					<h3 id="h3">送餐详情</h3>
					
					<!--放地址的容器-->
					<div class="Address-container" id="Address-container" >
						
						<div class="addAddress" id="addAddress">
							<span class="addjia">+</span>
							<span >添加新地址</span>
						</div>
						
						<!--遍历出来的地址-->
						<ul class="dizhikuang" id="dizhikuang">
						
							
							<!--显示所有地址▼-->
							<div class="showall" id="showall">
								<span >显示所有地址 &nbsp;▽</span>
							</div>
							
							<!--显示所有地址结束-->
							
						
							
							
							
						</ul>
						<!--遍历出来的地址结束-->
					</div>
					<!--放地址的容器-->
					
					<div class="message">
						<label for="message">给商家留言:</label>
						<input type="text" name="ps" id="ps" placeholder="不要辣,多放盐等口味要求" />
					</div>
					
					
					
				</div>
				
				<div class="howtopay" >
					<span>期望送达时间：</span>
					<select name="time" id="time">
						<option value="">立即送出</option>
						<option value="">10:00</option>
						<option value="">10:20</option>
						<option value="">10:40</option>
						<option value="">11:00</option>
					</select>
				</div>
				
				<div class="pay">
					<span>您需支付:</span>
					<span class="tprice" id="tprice"></span>
					
					<span class="gotopay" onclick="createorder();">去付款</span>
				</div>
			</div>
			
			<!--送餐详情部分结束-->
			
			
		</div>
		
		
		<!--主体内容部分结束-->
		
		
		
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
		
		
		<!--点添加新地址然后弹出的框部分-->
		<div class="addAddress-hidden" id="addAddress-hidden">
			<div class="cha">
				<span>添加新地址</span>
				<span class="chaBtn" id="chaBtn" >×</span>
			</div>
		<form id="deliver" method="POST" onsubmit="return false;">
			<div class="shouhuoxinxi" >
				<!--联系人大框-->
				<div class="contactName">
					<span>
						<span class="orange" >*</span><span class="family">联系人：</span>
					</span>
					<input class="xingminkuang" type="text" name="dname" id="dname" placeholder="请输入姓名" />
					
					<div class="xingbie" >
						<span class="orange" >*</span>
						<input type="radio" name="dgender" id="man"  value="先生" />先生
						<input type="radio" name="dgender" id="women"  value="女士" />女士
					</div>
				</div>
				<!--联系人大框结束-->
				
				<!--手机号-->
				<div class="phoneNumber">
					<span>
						<span class="orange" >*</span><span class="family">手机号码：</span>
					</span>
					<input class="shoujikuang" maxlength="11" type="text" name="dphone" id="dphone" placeholder="请输入11位手机号码" />
					
					
				</div>
				<!--手机号结束-->
				
				<!--收餐地址-->
				<div class="shoucan">
					<span>
						<span class="orange" >*</span><span class="family">收餐地址：</span>
					</span>
					<input class="shoujikuang"  type="text" name="daddress" id="daddress" placeholder="学校/小区/街道" />
					
					
				</div>
				<!--收餐地址结束-->
				
				<!--详细地址-->
				<div class="shoucan">
					<span>
						<span class="aaaaa">详细地址：</span>
					</span>
					<input class="shoujikuang"  type="text" name="address" id="address" placeholder="您可以填写门牌号,宿舍楼等信息" />
					
					
				</div>
				<!--详细地址结束-->
				
				<div id="Info-" class="oo" >
					<span >*为必填项,填写完整再提交吧</span>
				</div>
				
				<!--保存---取消按钮-->
				<div class="btnTwo">
					<span class="save" id="save" >保存</span>
					<span class="cancel" id="cancel">取消</span>
				</div>
				
				<!--保存---取消按钮结束-->
				
			</div>
			</form>
		</div>
		
		<!--点添加新地址然后弹出的框部分结束-->
		
		<!--点添加新地址然后弹出的框部分二二-->
		<div class="addAddress-hidden-two" id="addAddress-hidden-two">
			<div class="cha">
				<span>添加新地址</span>
				<span class="chaBtn" id="chaBtnTwo" >×</span>
			</div>
			
			<div class="shouhuoxinxi">
				<!--联系人大框-->
				<div class="contactName">
					<span>
						<span class="orange" >*</span><span class="family">联系人：</span>
					</span>
					<input class="xingminkuang" type="text" name="dname" id="dnameTwo" placeholder="请输入姓名" />
					
					<div class="xingbie" >
						<span class="orange" >*</span>
						<input type="radio" name="dgenderTwo" id="manTwo"  value="先生" />先生
						<input type="radio" name="dgenderTwo" id="womenTwo"  value="女士" />女士
					</div>
				</div>
				<!--联系人大框结束-->
				
				<!--手机号-->
				<div class="phoneNumber">
					<span>
						<span class="orange" >*</span><span class="family">手机号码：</span>
					</span>
					<input class="shoujikuang" maxlength="11" type="text" name="dphone" id="dphoneTwo" placeholder="请输入11位手机号码" />
					
					
				</div>
				<!--手机号结束-->
				
				<!--收餐地址-->
				<div class="shoucan">
					<span>
						<span class="orange" >*</span><span class="family">收餐地址：</span>
					</span>
					<input class="shoujikuang"  type="text" name="daddress" id="daddressTwo" placeholder="学校/小区/街道" />
					
					
				</div>
				<!--收餐地址结束-->
				
				<!--详细地址-->
				<div class="shoucan">
					<span>
						<span class="aaaaa">详细地址：</span>
					</span>
					<input class="shoujikuang"  type="text" name="address" id="addressTwo" placeholder="您可以填写门牌号,宿舍楼等信息" />
					
					
				</div>
				<!--详细地址结束-->
				
				<div id="Info-Two" class="oo" >
					<span >*为必填项,填写完整再提交吧</span>
				</div>
				
				<!--保存---取消按钮-->
				<div class="btnTwo">
					<span class="save" id="saveTwo" >保存</span>
					<span class="cancel" id="cancelTwo">取消</span>
				</div>
				
				<!--保存---取消按钮结束-->
				
			</div>
			
		</div>
		
		<!--点添加新地址然后弹出的框部分结束-->
		
	</body>
	<script type="text/javascript">
		var sid=<%=request.getParameter("sid") %>;
	    var uid=<%=request.getAttribute("user") %>;
//		点击优惠券部分的js
		var quaninfo=document.getElementById("quaninfo");
		var arrowdown=document.getElementById("arrowdown");
		var selectquan=document.getElementById("selectquan");
		arrowdown.onclick=function(){
			quaninfo.style.visibility="visible";
			setTimeout("codefans()",2000);
		}
		function codefans(){
			quaninfo.style.visibility="hidden";
		}
		
		
		selectquan.onfocus=function(){
			
			quaninfo.style.visibility="visible";
		}
		selectquan.onblur=function(){

			quaninfo.style.visibility="hidden";
		}
		
//点击优惠券部分的JS代码结束
		
//		点击添加新地址后的js
  		var addAddress=document.getElementById("addAddress");
  		var addAddressHidden=document.getElementById("addAddress-hidden");
  		var hidePage=document.getElementById("hidePage");
  		addAddress.onclick=show;
  		
  		function show(){
  			var hidePage=document.getElementById("hidePage");
  			var addAddressHidden=document.getElementById("addAddress-hidden");
  			addAddressHidden.style.visibility="visible";
  			hidePage.style.visibility="visible";
  		}
  		function hide(){
  			addAddressHidden.style.visibility="hidden";
  			hidePage.style.visibility="hidden";
  		}
  		
  		var chaBtn=document.getElementById("chaBtn");
  		var cancel=document.getElementById("cancel");
  		chaBtn.onclick=hide;
  		cancel.onclick=hide;
  		
  		
  		
//		点击添加新地址后的js结束

//		点击保存后的js
		var save=document.getElementById("save");
		var Infobitian=document.getElementById("Info-");
		var dname=document.getElementById("dname");
		var dgender;
		var dphone=document.getElementById("dphone");
		var daddress=document.getElementById("daddress");
		
		save.onclick=function(){
			var dgenders=document.getElementsByName("dgender");
			for(var r=0;r<dgenders.length;r++){
				if(dgenders[r].checked){
				dgender= dgenders[r].value;
				}
			
			}
			if(dname.value=="" || dgender==undefined || dphone.value=="" || daddress.value==""){
				Infobitian.style.display="block";
			}else if(dname.value!="" && dgender!=undefined && dphone.value.length<11 && daddress.value!=""){
				Infobitian.style.display="block";
				Infobitian.innerHTML="请输入正确的11位手机号"
			}else {
				addDelInf();
				hide();
				setTimeout("getDelInf();",500);
				
			}
		}
		
		
//		点击保存后的js结束
	
	
	
		var MT = MEITUAN = {
			checkLogin : function() {
			var _ticket = $.cookie("MT_TOKEN");
			if (!_ticket) {
				return;
			}
			$.ajax({
				type : "get",
				url : "/token/" + _ticket,
				dataType : "json",
				async : true,
				success : function(data) {
				if (data.status == 200) {
					var username = data.data.username;
					var html = username;
					$("#uname").html(html);
					var name = document.getElementById("name");
					var register = document.getElementById("register");
					var fenge = document.getElementById("fenge");
					var login = document.getElementById("login");
					var down = document.getElementById("down");
					down.style.visibility = "visible";
					name.style.visibility = "visible";
					register.style.visibility = "hidden";
					fenge.style.visibility = "hidden";
					login.style.visibility = "hidden";

				}
			}
		});
	}

}
			$(function() {
				MT.checkLogin();
			});
			function exit() {
				var name = document.getElementById("name");
				var register = document.getElementById("register");
				var fenge = document.getElementById("fenge");
				var login = document.getElementById("login");
				var down = document.getElementById("down");
				down.style.visibility = "hidden";
				name.style.visibility = "hidden";
				register.style.visibility = "visible";
				fenge.style.visibility = "visible";
				login.style.visibility = "visible";
			}
		
	</script>

</html>