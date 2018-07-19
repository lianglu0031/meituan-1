function getSeller(sid) {

	$.ajax({
		type : "get",
		url : "/seller/find/" + sid,
		dataType : "json",
		async : false,
		success : function(data) {
			if (data.status == 200) {

			}
		}
	});
}

function getOrder() {

	$.ajax({
		type : "get",
		url : "/seller/find/" + sid,
		dataType : "json",
		async : false,
		success : function(data) {
			if (data.status == 200) {

			}
		}
	});
}