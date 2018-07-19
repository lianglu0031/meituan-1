
//点击"+"时调用
function addcart(id){
	ajax("/order/add/"+id,function(result){
		var obj1 = JSON.parse(result);
		cart(obj1);
	});
}

//点击"-"时调用
function deletecart(id){
	ajax("/order/delete/"+id,function(result){
		var obj1 = JSON.parse(result);
		cart(obj1);
	});
}

//点击"清空菜单"时调用
function deleteallcart(){
	ajax("/order/deletes",function(result){
		var obj1 = JSON.parse(result);
		cart(obj1);
	});
}

//遍历后端返回json购物车的函数，购物车为空时，data为null;不空时，data为数组。
function cart(obj1){
		var dishcart=document.getElementById("dishcart");
		var cartbottom = document.getElementById("cartbottom");//当总价低于起送价(因为无起送价就弄个固定的起送价）时，是灰色的，且无法触发点击；
		                                                       //当高于或等于起送价时，橙色，可点击。
		var buy=document.getElementById("buy");
		var qsprice = 20;//起送价
		var carthtml = "";//购物栏html代码
		var bottonhtml = "<div class='buycart-bottom-left'>❤</div>";//底部html代码
		
		carthtml+="<div class='dishcart-top'><span>购物车</span><span class='cleardish' onclick='deleteallcart();' style='cursor:pointer; '>清空菜品</span></div>";
		carthtml+="<ul class='dishcart-middle' >";
		var sum = 6;//总价
		var i = 0;
		var num=0;
		if(obj1.status == 200){
			if(obj1.data != null){
				while(obj1.data.length > i){
				carthtml += "<li><span class='name' >"+obj1.data[i].dname+ "</span>";
				carthtml += "<div class='button'>";
				carthtml += "<span class='jian' onclick='deletecart("+obj1.data[i].did+");'"  +  ">-</span>";
				carthtml += "<span class='cainumber' >"+obj1.data[i].num+ "</span>";
				carthtml += "<span class='jia' onclick='addcart("+obj1.data[i].did+");'"  +  ">+</span>";
				carthtml += "</div>";
				carthtml += "<div class='caiprice'>￥"+obj1.data[i].price+ "</div>";
				carthtml += "</li>";
				num += parseInt(obj1.data[i].num);
				sum += parseInt(obj1.data[i].price)*parseInt(obj1.data[i].num);//计算总价
				i++;
				
				}
				carthtml+="<li><span class='name' >配送费</span>";
				carthtml += "<div class='caiprice'>￥6</div></li></ul>";
				carthtml += "<div class='dishcart-bottom'>";
				carthtml += "<p><span>共</span><span class='totalnumber' >"+num+ "</span>";
				carthtml += "<span>份,</span><span>总计</span><span class='totalprice' >￥" +sum+ "</span></p>";
				
				carthtml += "</div>";//把总价放入html
				if(qsprice > sum){
					
					var a=qsprice-sum;
					bottonhtml += "<div class='buycart-bottom-right' id='buy'><span class='panduan' >差"+a +"元起送</span></div>";
				}else{
					
					bottonhtml += "<div class='buycart-bottom-right' id='buy' style='background-color:red;cursor:pointer; ' onclick='order();'><span class='panduan' style=' font-weight:700; ' >立即下单</span></div>";
					
					
				}
				dishcart.innerHTML=carthtml;
				cartbottom.innerHTML=bottonhtml;
			}else{
				carthtml+="<li><span class='name' >配送费</span>";
				carthtml += "<div class='caiprice'>￥6</div></li></ul>";
				carthtml += "<div class='dishcart-bottom'>";
				carthtml += "<p><span>共</span><span class='totalnumber' >"+num+ "</span>";
				carthtml += "<span>份,</span><span>总计</span><span class='totalprice' >￥" +sum+ "</span></p>";
				bottonhtml += "<div class='buycart-bottom-right' id='buy'><span class='panduan' >差"+qsprice +"元起送</span></div>";
				dishcart.innerHTML=carthtml;
				cartbottom.innerHTML=bottonhtml;
			}
		}
}
function order(){
	location.href='/orderc?sid='+sid;
}