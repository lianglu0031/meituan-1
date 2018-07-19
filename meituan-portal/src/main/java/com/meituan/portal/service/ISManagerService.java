package com.meituan.portal.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meituan.common.Utils.MeituanResult;
import com.meituan.pojo.Orders;
import com.meituan.pojo.Seller;

public interface ISManagerService {
	MeituanResult userComment(Orders orders,short grade,String comment );//fang
	MeituanResult getStateOrder(long sid,String type);//fang
	MeituanResult acceptOrder(long oid);//fang
	MeituanResult sendOrder(long oid);//fang
	MeituanResult UpdateSellerMessage(Seller seller);//fang 修改商家信息
	MeituanResult checkName(String name);//fang
	MeituanResult checkPhone(String phone);//fang
	MeituanResult sellerLogin(String username,String password,HttpServletRequest request,
			HttpServletResponse response);//fang
	MeituanResult PayOrder(long id);
	MeituanResult getSellerByToken(String token,HttpServletRequest request);
	MeituanResult completeOrder(long oid);
	MeituanResult getAllorder();
}
