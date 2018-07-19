var count = 1;
window.onload = function()// 用window的onload事件，窗体加载完毕的时候
{
	ajax("/seller", function(result) {
		shuchu(result);

	});
}
var all;
function add(type1) {
	var surl;
	if (type1 == "" || type1 == "1") {
		surl = "/seller";
	} else {
		surl = "/seller/" + type1.substr(0, type1.length - 1);
	}
	count++;

	ajax(
			surl,
			function(result) {
				var obj1 = JSON.parse(result);
				if (obj1.data.length > 8 * count) {
					var divinfo = document.getElementsByClassName("loadmore");
					divinfo[0].innerHTML = "<font color='#333333'>点击加载更多商家<font>";
				} else {
					var divinfo = document.getElementsByClassName("loadmore");
					divinfo[0].innerHTML = "<font color='#333333'>没有更多了<font>";
				}
				if (all == obj1.data.length) {
					var divinfo = document.getElementsByClassName("loadmore");
					divinfo[0].innerHTML = "<font color='#333333'>没有更多了<font>";
				}
				var div = document.getElementById("banner");
				var tet = "<ul>";
				var i = 0;
				if (obj1.data.length < 8 * count) {
					while (i < obj1.data.length) {
						tet += "<li>";
						tet += "<div class='dian'>";
						tet += "<a href='restaurant.html?sid="+obj1.data[i].sid+"'>";
						tet += "<img src='/images/" + obj1.data[i].src + "'"
								+ " width='208px' height='156px'/>";
						tet += "<div class='dianming'>" + obj1.data[i].sname
								+ "</div>";
						tet += "<div class='pingjiarank'><img src='/images/star_03.png'/><img src='/images/star_03.png'/><img src='/images/star_03.png'/><img src='/images/star_03.png'/><img src='/images/star_03.png'/><span>4.6分</span> </div>"
						tet += "<div class='price'>起送：<span>￥20</span>  配送费：<span>￥6</span> <span class='time'>40分钟</span></div>";
						tet += "</a>";
						tet += "</div>";
						tet += "</li>";
						i++;
					}
					all = i;

					tet += "</ul>";
					div.innerHTML = tet;
				} else {
					while (i < 8 * count) {
						tet += "<li>";
						tet += "<div class='dian'>";
						tet += "<a href='restaurant.html?sid="+obj1.data[i].sid+"'>";
						tet += "<img src='/images/" + obj1.data[i].src + "'"
								+ " width='208px' height='156px'/>";
						tet += "<div class='dianming'>" + obj1.data[i].sname
								+ "</div>";
						tet += "<div class='pingjiarank'><img src='/images/star_03.png'/><img src='/images/star_03.png'/><img src='/images/star_03.png'/><img src='/images/star_03.png'/><img src='/images/star_03.png'/><span>4.6分</span> </div>"
						tet += "<div class='price'>起送：<span>￥20</span>  配送费：<span>￥6</span> <span class='time'>40分钟</span></div>";
						tet += "</a>";
						tet += "</div>";
						tet += "</li>";
						i++;
					}

					tet += "</ul>";
					div.innerHTML = tet;
				}
			});
}

function f(type) {
	
	var divinfo = document.getElementsByClassName("loadmore");
	divinfo[0].innerHTML = "<font color='#333333'>点击加载更多商家<font>";
	count = 1;
	all = 0;
	var load = document.getElementsByClassName("loadmore");
	load[0].id = type + "1";
	var surl;
	if (type == "") {
		surl = "/seller";
	} else {
		surl = "/seller/" + type;
	}
	ajax(surl, function(result) {

		shuchu(result);

	});
	var ul=document.getElementById("ul");
	var lis=ul.getElementsByTagName("li");
	for(var j=0;j<lis.length;j++){
		var li=lis[j];
		li.onclick=function(){
			for(var j=0;j<lis.length;j++){
				var lili=lis[j];
				lili.className="";
			}
			this.className="selected";
		}
	}
	
}

function shuchu(result) {
	var obj1 = JSON.parse(result);
	if (obj1.status == "200") {
		var div = document.getElementById("banner");
		var tet = "<ul>";
		var i = 0;
		if (obj1.data.length < 8) {
			while (i < obj1.data.length) {
				tet += "<li>";
				tet += "<div class='dian'>";
				tet += "<a href='restaurant.html?sid="+obj1.data[i].sid+"'>";
				tet += "<img src='/images/" + obj1.data[i].src
						+ "' width='208px' height='156px'/>";
				tet += "<div class='dianming'>" + obj1.data[i].sname + "</div>";
				tet += "<div class='pingjiarank'><img src='/images/star_03.png'/><img src='/images/star_03.png'/><img src='/images/star_03.png'/><img src='/images/star_03.png'/><img src='/images/star_03.png'/><span>4.6分</span> </div>"
				tet += "<div class='price'>起送：<span>￥20</span>  配送费：<span>￥6</span> <span class='time'>40分钟</span></div>";
				tet += "</a>";
				tet += "</div>";
				tet += "</li>";
				i++;
			}
			tet += "</ul>";
			div.innerHTML = tet;
		} else {
			while (i < 8) {
				tet += "<li>";
				tet += "<div class='dian'>";
				tet += "<a href='restaurant.html?sid="+obj1.data[i].sid+"'>";
				tet += "<img src='/images/" + obj1.data[i].src
						+ "' width='208px' height='156px'/>";
				tet += "<div class='dianming'>" + obj1.data[i].sname + "</div>";
				tet += "<div class='pingjiarank'><img src='/images/star_03.png'/><img src='/images/star_03.png'/><img src='/images/star_03.png'/><img src='/images/star_03.png'/><img src='/images/star_03.png'/><span>4.6分</span> </div>"
				tet += "<div class='price'>起送：<span>￥20</span>  配送费：<span>￥6</span> <span class='time'>40分钟</span></div>";
				tet += "</a>";
				tet += "</div>";
				tet += "</li>";
				i++;
			}
			tet += "</ul>";
			div.innerHTML = tet;
		}
	} else {
		var div = document.getElementById("banner");
		div.innerHTML = "<div style='text-align:center;'>附近无商家信息</div>";
		var divinfo = document.getElementsByClassName("loadmore");
		divinfo[0].innerHTML="";
	}
}


