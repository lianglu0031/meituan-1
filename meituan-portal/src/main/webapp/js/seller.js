window.onload = function() {
	getSeller();
}

function getSeller() {
	var sellersrc = document.getElementById("sellersrc");
	var seller = document.getElementById("seller-top");
	var sellerhtml = "";
	var srcrhtml = "";
	var contain = document.getElementById("container");
	var html = "<div class='navName'>店铺信息</div>";
	ajax(
			"/seller/find/" + 1,
			function(result) {
				var obj1 = JSON.parse(result);
				srcrhtml += "<img src='images/" + obj1.data.src + "'/></div>";
				sellerhtml += "<span class='restaurant-name'>"
						+ obj1.data.sname
						+ "</span> <span class='arrow'></span>";
				sellerhtml += "<br/>";
				sellerhtml += "<span class='pingjiarank'><img src='images/star_03.png'/><img src='images/star_03.png'/><img src='images/star_03.png'/><img src='images/star_03.png'/><img src='images/star_03.png'/>";
				sellerhtml += "<span >4.6分</span> </span></div>";
				html += "<div class='aaaaaaaa'><div class='hideTime'><span>۞</span><span class='time'>营业时间</span><span>"
						+ obj1.data.businessTime + "</span></div>";
				html += "<div class='hideAddress'><span>◮</span><span class='time'>商家地址</span><span>"
						+ obj1.data.address + "</span></div>";
				html += "<div class='hideTel'><span>℡</span><span class='time'>商家电话</span><span>"
						+ obj1.data.pnumber + "</span></div>";
				html += "</div>";
				sellersrc.innerHTML = srcrhtml;
				contain.innerHTML = html;
				seller.innerHTML = sellerhtml;
			});
}

function getOrder(type) {
	ajax(
			"/orders/getstate?sid=" + 1 + "&type=" + type,
			function(result) {
				var obj1 = JSON.parse(result);
				var i = 0;
				if (type == "1") {
					var contain = document.getElementById("container");
					var html = "<div class='navName'>订单管理</div>";
					html += "<div class='orderPart'><div class='orderPart-nav' id='orderPartNav'>";
					html += "<span class='Select' onclick='WeiJieDan();'>未接单</span><span onclick='WeiPaiSong();'>未派送</span><span onclick='YiPaiSong();'>已派送</span><span onclick='YiWanCheng();'>已完成</span></div>";
					if (obj1.data.length == 0) {
						html += "<div class='ordercontent' >无订单信息</div>";
					}
					while (i < obj1.data.length) {
						html += "<div class='ordercontent' >";
						html += "<div class='bianhao'><span>订单编号：</span><span class='IdforOrder'>"
								+ obj1.data[i].oid + "</span>";
						html = finddel(html, obj1.data[i].did);
						var starttime1 = new Date(obj1.data[i].starttime);
						var starttime = starttime1.toLocaleString();
						html += "<span>下单时间：</span><span class='xdshijian'>"
								+ starttime
								+ "</span><span>期望送达时间：</span><span class='shijian'>12:00</span></div>";
						html += "<ul><li><span>菜品</span><span class='jiange'>价格/份数</span></li>";
						var j = 0;
						var sum = 6;
						var obj2 = JSON.parse(obj1.data[i].dish);
						while (j < obj2.length) {
							html += "<li><span class='caipin'>" + obj2[j].dname
									+ "</span><span class='jiage jianjian'>￥"
									+ obj2[j].price + "*" + obj2[j].num
									+ "</span></li>";
							sum += parseInt(obj2[j].price)
									* parseInt(obj2[j].num);
							j++;
						}
						html += "<li><span class=‘caipin’>配送费</span><span class='jiage jiange'   >￥6</span></li>";
						html += "<li><span class='heji'>合计</span><span class='totalprice jiange'  >￥"
								+ sum + "</span></li></ul>";
						html += "<div class='bbbb'><span>备注信息：</span><textarea name='beizhu' rows='1' cols='80' class='beizhu' readonly='readonly'>"
								+ obj1.data[i].ps + "</textarea></div>";
						html += "<div style='overflow: hidden;'><div class='jiedan' id='jiedan"
								+ obj1.data[i].oid + "' onclick='JieDan("
								+ obj1.data[i].oid
								+ ");'>去接单</div></div></div>";
						i++;
					}

					contain.innerHTML = html;
				}
				if (type == "2") {
					var contain = document.getElementById("container");
					var html = "<div class='navName'>订单管理</div>";
					html += "<div class='orderPart'><div class='orderPart-nav' id='orderPartNav'>";
					html += "<span  onclick='WeiJieDan();'>未接单</span><span class='Select' onclick='WeiPaiSong();'>未派送</span><span onclick='YiPaiSong();'>已派送</span><span onclick='YiWanCheng();'>已完成</span></div>";
					if (obj1.data.length == 0) {
						html += "<div class='ordercontent' >无订单信息</div>";
					}
					while (i < obj1.data.length) {
						html += "<div class='ordercontent'>";
						html += "<div class='bianhao'><span>订单编号：</span><span class='IdforOrder'>"
								+ obj1.data[i].oid + "</span>";
						html = finddel(html, obj1.data[i].did);
						var starttime1 = new Date(obj1.data[i].starttime);
						var starttime = starttime1.toLocaleString();
						html += "<span>下单时间：</span><span class='xdshijian'>"
								+ starttime
								+ "</span><span>期望送达时间：</span><span class='shijian'>12:00</span></div>";
						html += "<ul><li><span>菜品</span><span class='jiange'>价格/份数</span></li>";
						var j = 0;
						var sum = 6;
						var obj2 = JSON.parse(obj1.data[i].dish);
						while (j < obj2.length) {
							html += "<li><span class='caipin'>" + obj2[j].dname
									+ "</span><span class='jiage jianjian' >￥"
									+ obj2[j].price + "*" + obj2[j].num
									+ "</span></li>";
							sum += parseInt(obj2[j].price)
									* parseInt(obj2[j].num);
							j++;
						}
						html += "<li><span class=‘caipin’>配送费</span><span class='jiage jiange'  >￥6</span></li>";
						html += "<li><span class='heji'>合计</span><span class='totalprice jiange' >￥"
								+ sum + "</span></li></ul>";
						html += "<div class='bbbb'><span>备注信息：</span><textarea name='beizhu' rows='1' cols='80' class='beizhu' readonly='readonly'>"
								+ obj1.data[i].ps + "</textarea></div>";
						html += "<div style='overflow: hidden;'><div class='jiedan' id='paisong"
								+ obj1.data[i].oid + "' onclick='PaiSong("
								+ obj1.data[i].oid + ");'>派送</div></div></div>"
						i++;
					}
					contain.innerHTML = html;
				}
				if (type == "3") {
					var contain = document.getElementById("container");
					var html = "<div class='navName'>订单管理</div>";
					html += "<div class='orderPart'><div class='orderPart-nav' id='orderPartNav'>";
					html += "<span  onclick='WeiJieDan();'>未接单</span><span onclick='WeiPaiSong();'>未派送</span><span class='Select' onclick='YiPaiSong();'>已派送</span><span onclick='YiWanCheng();'>已完成</span></div>";
					if (obj1.data.length == 0) {
						html += "<div class='ordercontent' >无订单信息</div>";
					}
					while (i < obj1.data.length) {
						html += "<div class='ordercontent'>";
						html += "<div class='bianhao'><span>订单编号：</span><span class='IdforOrder'>"
								+ obj1.data[i].oid + "</span>";
						html = finddel(html, obj1.data[i].did);
						var starttime1 = new Date(obj1.data[i].starttime);
						var starttime = starttime1.toLocaleString();
						html += "<span>下单时间：</span><span class='xdshijian'>"
								+ starttime
								+ "</span><span>期望送达时间：</span><span class='shijian'>12:00</span></div>";
						html += "<ul><li><span>菜品</span><span class='jiange'>价格/份数</span></li>";
						var j = 0;
						var sum = 6;
						var obj2 = JSON.parse(obj1.data[i].dish);
						while (j < obj2.length) {
							html += "<li><span class='caipin'>" + obj2[j].dname
									+ "</span><span class='jiage jianjian' >￥"
									+ obj2[j].price + "*" + obj2[j].num
									+ "</span></li>";
							sum += parseInt(obj2[j].price)
									* parseInt(obj2[j].num);
							j++;
						}
						html += "<li><span class=‘caipin’>配送费</span><span class='jiage jiange'   >￥6</span></li>";
						html += "<li><span class='heji'>合计</span><span class='totalprice jiange'  >￥"
								+ sum + "</span></li></ul>";
						html += "<div class='bbbb'><span>备注信息：</span><textarea name='beizhu' rows='1' cols='80' class='beizhu' readonly='readonly'>"
								+ obj1.data[i].ps + "</textarea></div>";
						html += "<div style='overflow: hidden;'><div class='jiedan' id='wait"
								+ obj1.data[i].oid + "' onclick='wait("
								+ obj1.data[i].oid
								+ ");'>正在派送中</div></div></div>";
						i++;
					}
					contain.innerHTML = html;
				}
				if (type == "4") {
					var contain = document.getElementById("container");
					var html = "<div class='navName'>订单管理</div>";
					html += "<div class='orderPart'><div class='orderPart-nav' id='orderPartNav'>";
					html += "<span onclick='WeiJieDan();'>未接单</span><span onclick='WeiPaiSong();'>未派送</span><span onclick='YiPaiSong();'>已派送</span><span  class='Select' onclick='YiWanCheng();'>已完成</span></div>";
					if (obj1.data.length == 0) {
						html += "<div class='ordercontent' >无订单信息</div>";
					}
					while (i < obj1.data.length) {
						html += "<div class='ordercontent'>";
						html += "<div class='bianhao'><span>订单编号：</span><span class='IdforOrder'>"
								+ obj1.data[i].oid + "</span>";
						html = finddel(html, obj1.data[i].did);
						var starttime1 = new Date(obj1.data[i].starttime);
						var starttime = starttime1.toLocaleString();
						var endtime1 = new Date(obj1.data[i].endtime);
						var endtime = endtime1.toLocaleString();
						html += "<span>下单时间：</span><span class='xdshijian'>"
								+ starttime
								+ "</span><span>期望送达时间：</span><span class='shijian'>12:00</span>"+"</div>";
						html+="<div class='peisong'><span>完成时间：</span><span class='shijian'>"+endtime+ "</span></div> ";
							
							
						
						
					
							
							
							
						html += "<ul><li><span>菜品</span><span class='jiange'>价格/份数</span></li>";
						var j = 0;
						var sum = 6;
						var obj2 = JSON.parse(obj1.data[i].dish);
						while (j < obj2.length) {
							html += "<li><span class='caipin'>" + obj2[j].dname
									+ "</span><span class='jiage jianjian'  >￥"
									+ obj2[j].price + "*" + obj2[j].num
									+ "</span></li>";
							sum += parseInt(obj2[j].price)
									* parseInt(obj2[j].num);
							j++;
						}
						html += "<li><span class=‘caipin’>配送费</span><span class='jiage jiange'  >￥6</span></li>";
						html += "<li><span class='heji'>合计</span><span class='totalprice jiange'   >￥"
								+ sum + "</span></li></ul>";
						html += "<div class='bbbb'><span>备注信息：</span><textarea name='beizhu' rows='1' cols='80' class='beizhu' readonly='readonly'>"
								+ obj1.data[i].ps + "</textarea></div>";
						html += "<div style='overflow: hidden;'><div class='jiedan' id='jiedan"
								+ obj1.data[i].oid + "'>订单已完成</div></div></div>";
						i++;
					}
					contain.innerHTML = html;
				}
			});
}
function finddel(html, did1) {
	$
			.ajax({
				type : "get",
				url : "/order/finddel/" + did1,
				dataType : "json",
				async : false,
				success : function(data) {
					if (data.status == 200) {
						var gender;
						if (data.data.dgender == 0) {
							gender = "先生";
						} else
							gender = "女士";
						html += "<span>联系人：</span><span class='contaceMan'>"
								+ data.data.dname + " &nbsp;&nbsp;&nbsp;"
								+ gender + "</span> ";
						html += "<span>联系电话：</span><span class='Tel'>"
								+ data.data.dphone
								+ "</span></div><div class='peisong'><span>配送地址：</span>";
						html += "<span class='dizhi'>" + data.data.daddress
								+ "</span>";
					}
				}
			});
	return html;
}

function accept(oid) {
	ajax("/orders/accept/" + oid, function(result) {
		var obj1 = JSON.parse(result);
		if (obj1.status == 200) {

		}
	});
}
