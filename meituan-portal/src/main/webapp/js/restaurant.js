window.onload = function() {
	ajax(
			"/seller/find/" + sid,
			function(result) {
				var obj1 = JSON.parse(result);
				if (obj1.status == "200") {
					var hidebox = document.getElementById("hidebox");
					var tet = "";
					tet += "<div class='diantu'><img src='" + "/images/"
							+ obj1.data.src + "'"
							+ " width='106px' height='79px'/></div>";
					tet += "<div class='pingfen'><span class='restaurant-name'>"
							+ obj1.data.sname
							+ "</span> <span class='arrow'>▲</span>";
					tet += "<span class='pingjiarank'><img src='images/star_03.png'/><img src='images/star_03.png'/><img src='images/star_03.png'/><img src='images/star_03.png'/><img src='images/star_03.png'/><span >4.6分</span></span></div>";
					tet += "<div class='hideTime'><span>۞</span><span class='time'>营业时间</span><span>"
							+ obj1.data.businessTime + "</span></div>";
					tet += " <div class='hideAddress'><span>◮</span><span class='time'>商家地址</span><span>"
							+ obj1.data.address + "</span></div> ";
					tet += "<div class='hideTel'><span>℡</span><span class='time'>商家电话</span><span>"
							+ obj1.data.pnumber + "</span></div></div>";
					hidebox.innerHTML = tet;

					var visible = document.getElementById("visible");

					var tetvisible = "";
					tetvisible += "<div class='diantu'><img src='/images/"
							+ obj1.data.src + "'"
							+ " width='106px' height='79px'/></div>";
					tetvisible += "<div class='pingfen'><span class='restaurant-name'>"
							+ obj1.data.sname
							+ "</span> <span class='arrow'>▼</span>";
					tetvisible += "<span class='pingjiarank'><img src='images/star_03.png'/><img src='images/star_03.png'/><img src='images/star_03.png'/><img src='images/star_03.png'/><img src='images/star_03.png'/><span >4.6分</span></span></div>";
					visible.innerHTML = tetvisible;
				}

			}

	);
	ajax(
			"/menutype/" + sid,
			function(result) {
				var obj1 = JSON.parse(result);
				var dishtype = document.getElementById("dishtype");
				var type = "<ul>";
				var i = 0;
				var typeAndDish = document.getElementById("typeAndDish");
				var typeAndDishHtml = "";

				while (i < obj1.data.length) {
					if (i == 0) {
						type += "<li class='current'><a href='#type"+obj1.data[i].cid+ "'>";
					} else {
						type += "<li><a href='#type"+obj1.data[i].cid+ "'>";
					}

					type += "<span class='dianname' >" + obj1.data[i].cname
							+ "</span></a></li>";
					typeAndDishHtml += "<div class='dishbox'><div class='dishbox-top' id='dishbox-top'>";
					typeAndDishHtml += "<span id='type"+obj1.data[i].cid+"'>" + obj1.data[i].cname
							+ "</span></div>";
					typeAndDishHtml += "<div class='dishbox-bottom'><ul>";
					typeAndDishHtml = typedish(sid, obj1.data[i].cid,
							typeAndDishHtml);
					typeAndDishHtml += "</ul></div></div>";
					i++;
				}

				type += "</ul>";
				dishtype.innerHTML = type;
				typeAndDish.innerHTML = typeAndDishHtml;
			});

}
function typedish(sid, cid, typeAndDishHtml) {

	$.ajax({
				type : "get",
				url : "/menu?sid=" + sid + "&cid=" + cid,
				dataType : "json",
				async : false,
				success : function(data) {
					if (data.status == 200) {
						var i = 0;
						while (i < data.data.length) {
							typeAndDishHtml += "<li>";
							typeAndDishHtml += "<img src='/images/"
									+ data.data[i].src + "'"
									+ "  width='170px' height='127px' />";
							typeAndDishHtml += "<span class='dishname'>"
									+ data.data[i].mname + "</span>";
							typeAndDishHtml += "<div class='zan'>赞  <span>1</span></div>";
							typeAndDishHtml += "<span class='dishprice'>"
									+ data.data[i].price + "</span>";
							typeAndDishHtml += "<span class='jiabutton' onclick='addcart("
									+ data.data[i].id
									+ ");"
									+ "' "
									+ " >+</span></li>";
							i++;
						}
					}
				}
			});
	return typeAndDishHtml;
}

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