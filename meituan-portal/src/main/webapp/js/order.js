var flag1;
window.onload = function() {
	if ($.cookie('DELIVER_INF') != null) {
		$.cookie('DELIVER_INF', null);
	}
	getSeller();
	getcart();
	getDelInf();
	getTime();
	
}
function getcart() {
	var cart = document.getElementById("cart");
	var tprice = document.getElementById("tprice");
	var carthtml = "";
	var sum = 6;
	var i = 0;
	carthtml += "<li><span>菜品</span><span style='float: right'>价格/份数</span></li>";
	ajax(
			"/order/cart",
			function(result) {
				var obj1 = JSON.parse(result);
				while (obj1.data.length > i) {
					carthtml += "<li><span class='caipin'>"
							+ obj1.data[i].dname + "</span>";
					carthtml += "<span class='jiage'   style='float: right'>"
							+ obj1.data[i].price + "*" + obj1.data[i].num
							+ "</span></li>";
					sum += parseInt(obj1.data[i].price)
							* parseInt(obj1.data[i].num);// 计算总价
					i++;
				}
				carthtml += "<li><span class='caipin'>配送费</span><span class='jiage'   style='float: right'>￥6</span></li>";
				carthtml += "<li><span class='heji'>合计</span>";
				carthtml += "<span class='totalprice'   style='float: right'>"
						+ sum + "</span></li>";
				cart.innerHTML = carthtml;
				tprice.innerText = "￥"+sum;
			});
}

function getDelInf() {
	var did = $.cookie('DELIVER_INF');
	ajax(
			"/order/del/" + uid,
			function(result) {
				var obj1 = JSON.parse(result);
				if (obj1.data.length == 0) {
					return;
				} else {
					var h3 = document.getElementById("h3");
					h3.innerHTML = "送餐详情<span style='float: right;' onclick='show();'><span class='addjia'>+</span> <span class='addnewAddress'>添加新地址</span></span> ";
					var AddressContainer = document
							.getElementById("Address-container");
					AddressContainer.innerHTML = "";
					var html = "";
					html += "<ul class='dizhikuang'>";
					var gender;
					var i = 0;
					var j = 0;
					var k = 0;
					while (obj1.data.length > i) { // 为了遍历是否有session中的did等于json中的did,当session的did存在则将配送信息放在第一个盒子。
						if (did == obj1.data[i].did) {
							k = 1;
							if (obj1.data[i].dgender == 0) {
								gender = "先生";
							} else
								gender = "女士";
							html += "<li class='userAddress' id='"
									+ obj1.data[i].did + "' >";
							html += "<p><span>"
									+ obj1.data[i].dname
									+ "</span><span>"
									+ gender
									+ "：</span><span>"
									+ obj1.data[i].dphone
									+ "</span><span class='Hide-ReviseOrDel'><span class='Revise' onclick='Del_inf("
									+ obj1.data[i].did
									+ ")'>修改</span><span class='Delete' onclick='deleteDel("
									+ obj1.data[i].did
									+ ")'>删除</span></span></p>";
							html += "<p><span>" + obj1.data[i].daddress
									+ "</span></p></li>";
							break;
						}
						i++;
					}
					while (obj1.data.length > j) { // 遍历剩下的盒子。
						if (obj1.data[j].dgender == 0) {
							gender = "先生";
						} else
							gender = "女士";
						if (did != obj1.data[j].did && k < 2) { // 当json中的did不等于session的did时，且盒子少于两个时（用k判断），不隐藏。
							html += "<li class='userAddress' id='"
									+ obj1.data[j].did + "' >";
							html += "<p><span>"
									+ obj1.data[j].dname
									+ "</span><span>"
									+ gender
									+ "：</span><span>"
									+ obj1.data[j].dphone
									+ "</span><span class='Hide-ReviseOrDel'><span class='Revise' onclick='Del_inf("
									+ obj1.data[j].did
									+ ")'>修改</span><span class='Delete' onclick='deleteDel("
									+ obj1.data[j].did
									+ ")'>删除</span></span></p>";
							html += "<p><span>" + obj1.data[j].daddress
									+ "</span></p></li>";
							k++;
						} else if (did != obj1.data[j].did && k >= 2) { // 当json中的did不等于session的did时，且盒子等于或大于于两个时（用k判断），隐藏。
							if (obj1.data[j].dgender == 0) {
								gender = "先生";
							} else
								gender = "女士";
							html += "<li class='userAddress' id='"
									+ obj1.data[j].did
									+ "' style='display: none;' >";
							html += "<p><span>"
									+ obj1.data[j].dname
									+ "</span><span>"
									+ gender
									+ "：</span><span>"
									+ obj1.data[j].dphone
									+ "</span><span class='Hide-ReviseOrDel'><span class='Revise' onclick='Del_inf("
									+ obj1.data[j].did
									+ ")'>修改</span><span class='Delete' onclick='deleteDel("
									+ obj1.data[j].did
									+ ")'>删除</span></span></p>";
							html += "<p><span>" + obj1.data[j].daddress
									+ "</span></p></li>";

						}
						j++;
					}
					if (j > 2) {
						html += "<div class='showall' id='showall' >";
						html += "<span id='showAll'>显示所有地址 &nbsp;▽</span></div>";
					} else {
						html += "<div class='showall' id='showall'   >";
						html += "<span id='showAll' style='display: none'>显示所有地址1 &nbsp;▽</span></div>";
					}
					html += "</ul>";
					AddressContainer.innerHTML = html;

					// 这里

				}

			});

	setTimeout("aaaa()", 100);
	flag1 = false;
}
function aaaa() {
	var AllLi = document.getElementsByClassName("userAddress");
	for (var r = 0; r < AllLi.length; r++) {
		AllLi[r].onclick = function() {
			seletDel(this.id);
		}
	}
	// 写点击展开框和点击收缩框。
	var showall = document.getElementById("showall");
	showall.style.display = "block";
	var showAll = document.getElementById("showAll");
	var state = 1;
	var lis = document.getElementsByClassName("userAddress");
	showAll.onclick = function() {
		if (state == 1) {
			state = 2;

			for (var q = 2; q < lis.length; q++) {
				lis[q].style.display = "block";
			}
			showAll.innerHTML = "收起所有地址 &nbsp;△";
			showAll.style.color = "#F79100";
			showAll.style.border = "1px solid #FF8A15";
			showAll.style.borderTop = "1px solid #FFF";
			showall.style.borderTop = "1px solid #FF8A15";
		}

		else {
			state = 1;
			for (var q = 2; q < lis.length; q++) {
				lis[q].style.display = "none";
			}
			showAll.innerHTML = "显示所有地址 &nbsp;▽";
			showAll.style.color = "";
			showAll.style.border = "1px solid #E5E5E5";
			showAll.style.borderTop = "1px solid #FFF";
			showall.style.borderTop = "1px solid #E5E5E5";
		}

	}
}

function addDelInf() {
	var dname = document.getElementById("dname");
	var dgender;
	var dphone = document.getElementById("dphone");
	var daddress = document.getElementById("daddress");
	var address = document.getElementById("address");
	var dgenders = document.getElementsByName("dgender");
	for (var r = 0; r < dgenders.length; r++) {
		if (dgenders[r].checked) {
			if (dgenders[r].value == "先生") {
				dgender = 0;
			} else
				dgender = 1;
		}
	}
	var xmlHttp;
	if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	} else if (window.XMLHttpRequest) {
		xmlHttp = new XMLHttpRequest();
	}
	xmlHttp.open("POST", '/order/adddel/' + uid, true);
	xmlHttp.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded");
	xmlHttp.send('dname=' + dname.value + '&dphone=' + dphone.value
			+ '&dgender=' + dgender + '&daddress=' + daddress.value
			+ '&address=' + address.value);
	xmlHttp.onreadystatechange = function() {
		if (xmlHttp.readyState == 4) {
			if (xmlHttp.status == 200) {
				var result = xmlHttp.responseText;// 在页面上显示返回的结果
				var obj = JSON.parse(result);
				if (obj.status == 200) {
				}
			}
			/*
			 * $.post("/order/adddel/"+uid,$("#deliver").serialize(),
			 * function(data){ if(data.status == 200){ alert("保存成功"); } else {
			 * alert("保存失败"); } });
			 */
		}
	}
}

function getSeller() {
	var sname = document.getElementById("sname");
	ajax("/seller/find/" + sid, function(result) {
		var obj1 = JSON.parse(result);
		sname.innerHTML = obj1.data.sname;
	});
}
function getTime() {
	var time = document.getElementById("time");
	var timehtml = "";
	var i = 0;
	var j = 0;
	var myDate = new Date();
	var hour = myDate.getHours(); // 获取当前小时数(0-23)
	var min = myDate.getMinutes(); // 获取当前分钟数(0-59)
	timehtml += "<option value=''>立即送出</option>";
	if (min >= 30) {
		for (i = hour + 1; i <= 23; i++) {
			timehtml += "<option value=''>" + i + ":30</option>";
			j = i + 1;
			timehtml += "<option value=''>" + j + ":00</option>";
		}
	} else {
		for (i = hour + 1; i <= 23; i++) {
			timehtml += "<option value=''>" + i + ":00</option>";
			timehtml += "<option value=''>" + i + ":30</option>";
		}
	}

	time.innerHTML = timehtml;
}

// 新任务！！！！！！！！！！！！！！！
function seletDel(did1) {// 点击选择配送信息,修改
	ajax("/order/seletdel/" + did1, function(result) {
		var obj1 = JSON.parse(result);
		if (obj1.status == 200) {

			getDelInf();

		}
	});
	setTimeout("showSelectBorder(" + did1 + ")", 100);

}

function showSelectBorder(did1) {
	// 显示黄色选择框

	var Addresss = document.getElementsByClassName("userAddress");
	var temp = "1px solid #F5F5F5";
	for (var e = 0; e < Addresss.length; e++) {
		Addresss[e].style.border = temp;
	}

	var SelectedAddress = document.getElementById(did1 + "");
	SelectedAddress.style.border = "1px solid #FF9900";
	flag1=true;
}

function Del_inf(did1) {// 回调显示修改配送信息的信息
// 显示及隐藏JS
	var two = document.getElementById("addAddress-hidden-two");
	two.style.visibility = "visible";
	var chaBtnTwo = document.getElementById("chaBtnTwo");
	chaBtnTwo.onclick = function() {
		two.style.visibility = "hidden";
	}

	var cancelTwo = document.getElementById("cancelTwo");
	cancelTwo.onclick = function() {
		two.style.visibility = "hidden";
	}
	// 显示及隐藏JS结束

	ajax("/order/finddel/" + did1, function(result) {
		var obj1 = JSON.parse(result);
		if (obj1.status == 200) {
			var dnameTwo = document.getElementById("dnameTwo");
			dnameTwo.value = obj1.data.dname;
			var dgendersTwo = document.getElementsByName("dgenderTwo");
			if (obj1.data.dgender == 0) {
				dgendersTwo[0].checked = true;
			} else if (obj1.data.dgender == 1) {
				dgendersTwo[1].checked = true;
			}

			var dphoneTwo = document.getElementById("dphoneTwo");
			dphoneTwo.value = obj1.data.dphone;

			var addr = obj1.data.daddress.split(" ");
			var daddressTwo = document.getElementById("daddressTwo");
			daddressTwo.value = addr[0];
			var addressTwo = document.getElementById("addressTwo");
			addressTwo.value = addr[2];

		}
	});
	var saveTwo = document.getElementById("saveTwo");
	saveTwo.onclick = function() {
		SaveModidy(did1);
	}

}

function SaveModidy(did1) {
	var Infobitian = document.getElementById("Info-Two");
	var dname = document.getElementById("dnameTwo");
	var dgender;
	var dphone = document.getElementById("dphoneTwo");
	var daddress = document.getElementById("daddressTwo");

	var dgenders = document.getElementsByName("dgenderTwo");
	for (var r = 0; r < dgenders.length; r++) {
		if (dgenders[r].checked) {
			dgender = dgenders[r].value;
		}

	}
	if (dname.value == "" || dgender == undefined || dphone.value == ""
			|| daddress.value == "") {
		Infobitian.style.display = "block";
	} else if (dname.value != "" && dgender != undefined
			&& dphone.value.length < 11 && daddress.value != "") {
		Infobitian.style.display = "block";
		Infobitian.innerHTML = "请输入正确的11位手机号"
	} else {
		updateDel(did1);
		var two = document.getElementById("addAddress-hidden-two");
		two.style.visibility = "hidden";
		setTimeout("getDelInf();", 500);

	}

}

function updateDel(did1) {// 点击确认修改配送信息
	var dname = document.getElementById("dnameTwo");
	var dgender;
	var dphone = document.getElementById("dphoneTwo");
	var daddress = document.getElementById("daddressTwo");
	var address = document.getElementById("addressTwo");
	var dgenders = document.getElementsByName("dgenderTwo");
	for (var r = 0; r < dgenders.length; r++) {
		if (dgenders[r].checked) {
			if (dgenders[r].value == "先生") {
				dgender = 0;
			} else
				dgender = 1;
		}
	}
	var xmlHttp;
	if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	} else if (window.XMLHttpRequest) {
		xmlHttp = new XMLHttpRequest();
	}
	xmlHttp.open("POST", '/order/updatedel/' + did1, true);
	xmlHttp.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded");
	xmlHttp.send('dname=' + dname.value + '&dphone=' + dphone.value
			+ '&dgender=' + dgender + '&daddress=' + daddress.value
			+ '&address=' + address.value + '&uid=' + uid);
	xmlHttp.onreadystatechange = function() {
		if (xmlHttp.readyState == 4) {
			if (xmlHttp.status == 200) {
				var result = xmlHttp.responseText;// 在页面上显示返回的结果
				var obj = JSON.parse(result);
				if (obj.status == 200) {
				}
			}
			/*
			 * $.post("/order/adddel/"+uid,$("#deliver").serialize(),
			 * function(data){ if(data.status == 200){ alert("保存成功"); } else {
			 * alert("保存失败"); } });
			 */
		}
	}
}

function deleteDel(did1) {// 删除配送信息
	ajax("/order/deletedel/" + did1, function(result) {
		var obj1 = JSON.parse(result);
		if (obj1.status == 200) {
			if ($.cookie('DELIVER_INF') == did1) {
				$.cookie('DELIVER_INF', null);
			}
			getDelInf();
		}
	});
}

function createorder() {// 生成订单
	if(flag1){
	var ps = document.getElementById("ps");
	var xmlHttp;
	if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	} else if (window.XMLHttpRequest) {
		xmlHttp = new XMLHttpRequest();
	}
	xmlHttp.open("POST", '/order/create', true);
	xmlHttp.setRequestHeader("Content-Type",
			"application/x-www-form-urlencoded");
	xmlHttp.send('ps=' + ps.value + '&uid=' + uid + '&sid=' + sid);
	xmlHttp.onreadystatechange = function() {
		if (xmlHttp.readyState == 4) {
			if (xmlHttp.status == 200) {
				var result = xmlHttp.responseText;// 在页面上显示返回的结果
				var obj = JSON.parse(result);
				if (obj.status == 200) {
					location.href="/confirmOrder?sid="+sid;
				}
			}
			/*
			 * $.post("/order/adddel/"+uid,$("#deliver").serialize(),
			 * function(data){ if(data.status == 200){ alert("保存成功"); } else {
			 * alert("保存失败"); } });
			 */
		}
	}
	}else alert("请选择配送地址");
}