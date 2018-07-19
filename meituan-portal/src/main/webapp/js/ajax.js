function ajax(url,callback){
	 		var xmlHttp ;
			if(window.ActiveXObject){
      			 xmlHttp = new ActiveXObject("Microsoft.XMLHTTP") ;
     		 }
      		else if(window.XMLHttpRequest){
       			 xmlHttp = new XMLHttpRequest() ;
     		 }
      		 xmlHttp.open("GET",url,true) ;
     		 
     		 xmlHttp.send(null) ;
			
			xmlHttp.onreadystatechange =function(){
				if(xmlHttp.readyState == 4){
  		        	if(xmlHttp.status == 200){
        				var result = xmlHttp.responseText;//在页面上显示返回的结果
	  					callback(result);
   		}
 }
			}
}

function ajax1(url,callback){
	 		var xmlHttp ;
			if(window.ActiveXObject){
      			 xmlHttp = new ActiveXObject("Microsoft.XMLHTTP") ;
     		 }
      		else if(window.XMLHttpRequest){
       			 xmlHttp = new XMLHttpRequest() ;
     		 }
      		 xmlHttp.open("GET",url,false) ;
     		 
     		 xmlHttp.send(null) ;
			
			xmlHttp.onreadystatechange =function(){
				if(xmlHttp.readyState == 4){
  		        	if(xmlHttp.status == 200){
        				var result = xmlHttp.responseText;//在页面上显示返回的结果
	  					callback(result);
   		}
 }
			}
}

