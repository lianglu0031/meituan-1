function allorder(){
	var tbody = document.getElementById("tbody123");
	var html = "";
	ajax("/orders/getall",function(result){
		var obj1 = JSON.parse(result);
		var i = 0;
		while(obj1.data.length>i){
		html = "<tr><td><label><input type='checkbox' class='ace'><span class='lbl'></span></label></td>";
		html = " <td>"+obj1.data[i].oid+"</td>";
		html = " <td class='order_product_name'><a href='#'>"+obj1.data[i].sid+"</a></td>";
		html = " <td><a href='#'>"+obj1.data[i].uid+"</a></td>";
		html = " <td><a href='#'>详情</a></td>";
		html = "<td>￥56</td><td><a href='#'>详情</a></td>";
		var starttime1 = new Date(obj1.data[i].starttime);
		var starttime = starttime1.toLocaleString();
		if(obj1.data[i].endtime == null){
		var endtime1 = new Date(obj1.data[i].endtime);
		var endtime = endtime1.toLocaleString();
		}else {
			var endtime = "无";
		}
		html = " <td>"+starttime+"</td><td>"+endtime+"</td>";
		if(obj1.data[i].status == "0"){
			var status = "未付款";
		}
		if(obj1.data[i].status == "1"){
			var status = "未接单";
		}
		if(obj1.data[i].status == "2"){
			var status = "未派送";
		}
		if(obj1.data[i].status == "3"){
			var status = "派送中";
		}
		if(obj1.data[i].status == "4"){
			var status = "已完成";
		}
		html = " <td class='td-status'><span class='label label-success radius'>"+status+"</span></td><td><a href='#'>周氏龙</a></td><td>";
		html = "<a title='订单详细'  href='order_detailed.html'  class='btn btn-xs btn-info order_detailed' ><i class='fa fa-list bigger-120'></i></a> ";
		html = " <a title='删除' href='javascript:;'  onclick='Order_form_del(this,'1')' class='btn btn-xs btn-warning' ><i class='fa fa-trash  bigger-120'></i></a></td></tr>";
		i++;
		}
		tbody.innerHTML = html;
	});
}