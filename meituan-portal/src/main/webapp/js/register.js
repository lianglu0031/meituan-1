var username = document.getElementById("username");
var phone = document.getElementById("phonenumber");
var pw = document.getElementById("pw");
var querenpw = document.getElementById("querenpw");
var errusername = document.getElementById("errusername");
var errphone = document.getElementById("errphone");
var errpw = document.getElementById("errpassword");
var errquerenpw = document.getElementById("errrepeatpassword");
username.onblur = checkusername
phone.onblur = checkphone;
pw.onblur = checkpassword;
querenpw.onblur = checkpasswordagain;

function checkusername() {
	if (username.value == "") {
		errusername.innerHTML = "用户名不能为空";
		return false;
	} else if (username.value.length > 15) {
		errusername.innerHTML = "用户名长度不能超过15个字符";
		return false;
	} else {
		ajax("/user/checkname?username=" + username.value, function(result) {
			var obj1 = JSON.parse(result);
			if (obj1.data == true) {
				errusername.innerHTML = "<span class='circle'>√</span>";
			} else {
				errusername.innerHTML = "用户名已注册";
				return false;
			}
		});
		return true;
	}
}

function checkphone() {
	if (phone.value == "") {
		errphone.innerHTML = "请输入您的手机号码";
		return false;
	} else if (phone.value.length < 6 || phone.value.length > 11) {
		errphone.innerHTML = "请输入11位手机号码";
		return false;
	} else {
		ajax("/user/checkphone?phone=" + phone.value, function(result) {
			var obj1 = JSON.parse(result);
			if (obj1.data == true) {
				errphone.innerHTML = "<span class='circle'>√</span>";
			} else {
				errphone.innerHTML = "手机号已注册";
				return false;
			}
		});
		return true;
	}
}

function checkpassword() {
	if (pw.value == "") {
		errpw.innerHTML = "请填写密码";
		return false;
	} else if (pw.value.length < 6) {
		errpw.innerHTML = "密码少于6个字符";
		return false;
	} else if (pw.value.length > 15) {
		errpw.innerHTML = "密码多于15个字符";
		return false;
	} else {
		errpw.innerHTML = "<span class='circle'>√</span>";
		return true;
	}
}

function checkpasswordagain() {
	if (querenpw.value == "") {
		errquerenpw.innerHTML = "请再次输入密码";
		return false;
	} else if (pw.value == querenpw.value) {
		errquerenpw.innerHTML = "<span class='circle'>√</span>";
		return true;
	} else {
		errquerenpw.innerHTML = "两次输入密码不一致";
		return false;
	}
}

var square = document.getElementById("square");
var state = 1;
square.onclick = checkxieyi;

var register = document.getElementById("register");
register.onclick = checkall;

function checkxieyi() {
	if (state == 1) {
		square.value = "√";
		state = 2;
		var errxieyi = document.getElementById("errxieyi");
		errxieyi.innerHTML = "";
		return true;
	} else if (state == 2) {
		square.value = "";
		state = 1;
		var errxieyi = document.getElementById("errxieyi");
		errxieyi.innerHTML = "您未同意《用户注册协议》";
		return false;
	}
}

function checkall() {

	if (checkusername() && checkpassword() && checkpasswordagain()
			&& checkphone() && square.value != "") {
		var xmlHttp;
		if (window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		} else if (window.XMLHttpRequest) {
			xmlHttp = new XMLHttpRequest();
		}
		xmlHttp.open("POST", '/user/register', true);
		xmlHttp.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded");
		xmlHttp.send('username=' + username.value + '&password=' + pw.value
				+ '&phone=' + phone.value);
		xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4) {
				if (xmlHttp.status == 200) {
					var result = xmlHttp.responseText;// 在页面上显示返回的结果
					var obj = JSON.parse(result);
					if (obj.status == 400) {
						var Info=document.getElementById("Info");
     		    		var Info_top=document.getElementById("Info-top");
     		    		var Info_bottom=document.getElementById("Info-bottom");
     		    		var cha=document.getElementById("cha");
     		    		cha.onclick=function(){
     		    			Info.style.visibility="hidden";
     		    		}
     		    		Info.style.visibility="visible";
     		    		Info_top.innerHTML="注册失败";
     		    		Info_top.style.backgroundColor="#BBB";
     		    		Info_bottom.innerHTML="(╯﹏╰) 服务器出现错误，请稍后再试！";
					} else if (obj.status == 200) {
						var Info=document.getElementById("Info");
     		    		var Info_top=document.getElementById("Info-top");
     		    		var Info_bottom=document.getElementById("Info-bottom");
     		    		var cha=document.getElementById("cha");
     		    		cha.onclick=function(){
     		    			Info.style.visibility="hidden";
     		    		}
     		    		Info.style.visibility="visible";
     		    		Info_top.innerHTML="注册成功";
     		    		Info_bottom.innerHTML="(๑❛ᴗ❛๑) 欢迎您的到来！";
     		    		window.setTimeout("window.location='login.html'",2000); 
					}
				}
			}
		}
	} else if (checkusername() && checkpassword() && checkpasswordagain()
			&& checkphone() && square.value == "") {
		var errxieyi = document.getElementById("errxieyi");
		errxieyi.innerHTML = "您未同意《用户注册协议》";
	}
}
