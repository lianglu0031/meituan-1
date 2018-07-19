//		点击支付宝等/和个人支付付款方式的js
var personal = document.getElementById("personal");
var disan = document.getElementById("Dithree");
personal.onclick = function() {
	this.style.backgroundColor = "#fff";
	this.style.border = "1px solid #C4C4C4";
	this.style.borderBottom = "1px solid #fff";
	disan.style.border = "1px solid #fff";
	disan.style.backgroundColor = "#fff";
	disan.style.borderBottom = "1px solid #c4c4c4";
	var zhifukuang = document.getElementById("zhifukuang");
	var html = "";
	html += "<li><input type='radio' name='pay'  value='' /><img src='images/icbc.png'/></li>";
	html += "<li><input type='radio' name='pay'  value='' /><img src='images/cmb.png'/></li>";
	html += "<li><input type='radio' name='pay'  value='' /><img src='images/ccb.png'/></li>";
	html += "<li><input type='radio' name='pay'  value='' /><img src='images/abc.png'/></li>";
	html += "<li><input type='radio' name='pay'  value='' /><img src='images/boc.png'/></li>";
	html += "<li><input type='radio' name='pay'  value='' /><img src='images/bofc.png'/></li>";
	html += "<li><input type='radio' name='pay'  value='' /><img src='images/pspc.png'/></li>";
	html += "<li><input type='radio' name='pay'  value='' /><img src='images/spdb.png'/></li>";
	html += "<li><input type='radio' name='pay'  value='' /><img src='images/other.png'/></li>";
	zhifukuang.innerHTML = html;
}
disan.onclick = function() {
	personal.style.backgroundColor = "#fff";
	personal.style.border = "0";
	personal.style.borderBottom = "1px solid #c4c4c4";

	this.style.backgroundColor = "#fff";
	this.style.border = "1px solid #C4C4C4";

	this.style.borderBottom = "1px solid #fff";
	var zhifukuang = document.getElementById("zhifukuang");
	var html = "";
	html += "<li><input type='radio' name='pay'  value='' /><img src='images/pc_wxqrpay.png'/></li>";
	html += "<li><input type='radio' name='pay'  value='' /><img src='images/alipaypcnew.png'/></li>";
	html += "<li><input type='radio' name='pay'  value='' /><img src='images/tenpay2.png'/></li>";
	zhifukuang.innerHTML = html;
}

// 点击支付宝等/和个人支付付款方式的js结束

//		点击去付款弹出付款成功js
var PayMoney=document.getElementById("PayMoney");
		var cha=document.getElementById("cha");
		PayMoney.onclick=function(){
			
			var pays=document.getElementsByName("pay");
			var State=0;

			for (var r = 0; r < pays.length; r++) {
				if (pays[r].checked) {
					State=1;
				}
			}
			
			if(State==0){
				//弹出未选中付款方式
				var weixuanze=document.getElementById("weixuanze");
				weixuanze.style.display="block";
			}else {
				var weixuanze=document.getElementById("weixuanze");
				weixuanze.style.display="none";
				showPayMessage();
     			window.setTimeout("hidePayMessage()",3000); 
     			var oid = $.cookie("oid");
     			ajax("/orders/setState1/"+oid,function(result){
     				var obj1 = JSON.parse(result);
     				if(obj1.status == 200){
     					window.setTimeout("showindex()",3000); 
     				}
     			});
			}
			
			
		}
		
     	cha.onclick=function(){
     		 hidePayMessage();
     	}
     	function showPayMessage(){
     		var Info=document.getElementById("Info");
			Info.style.visibility="visible";
     	}
     	function hidePayMessage(){
     		var Info=document.getElementById("Info");
			Info.style.visibility="hidden";
     	}
     	
//   	点击去付款弹出付款成功js结束  

window.onload=function(){
	checkpay();
	getSeller();
	var daojishi=document.getElementById("daojishi");
                
    var time=900;//15分钟换算成900秒
                 
                
    Auto=  window.setInterval(function(){
    time=time-1;
    var minute=parseInt(time/60);
    var second=parseInt(time%60);
    if(minute<10){
      	minute = "0" + minute; 
    }
    if(second<10){
        second = "0" + second; 
    }
                   
        daojishi.innerHTML=minute+':'+second;
    if(second=="00"&&minute=="00"){
        clearInterval(Auto);  
        backorder();
    }
                
    },1000);
}


//判断是否有支付token
function checkpay(){
	var _ticket= $.cookie("MT_PAY_TOKEN");
	if(!_ticket){
		return ;
	}
	$.ajax({
		type:"get",
		url:"/pay/"+_ticket,
		dataType:"json",
		async:true,
		success:function(data){
			if(data.status==200){
				var order=document.getElementById("orderid");
				var price=document.getElementById("price");
				var zprice=document.getElementById("zprice");
				order.innerText="-"+data.data.oid;
				$.cookie('oid',data.data.oid+"");
				price.innerText=data.data.price;
				zprice.innerText=data.data.price;
			}
		}
	});
}
function getSeller() {
	var sname = document.getElementById("sname");
	ajax("/seller/find/" + sid, function(result) {
		var obj1 = JSON.parse(result);
		sname.innerHTML = obj1.data.sname;
	});
}

function backorder(){
	location.href="/orderc?sid="+sid;
}

function showindex(){
	location.href="/index";
}