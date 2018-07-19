package com.meituan.portal.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meituan.common.Utils.MeituanResult;
import com.meituan.pojo.DeliverInf;
import com.meituan.pojo.Orders;

public interface IOrderService {
	MeituanResult addCartDishes(long id,Integer num,HttpServletRequest req,HttpServletResponse res);
	MeituanResult deleteCartDishes(long id,Integer num,HttpServletRequest req,HttpServletResponse res);
	MeituanResult deleteCart(HttpServletRequest req,HttpServletResponse res);
	MeituanResult addDeliverInformation(DeliverInf deliver,String ad,long id);
	MeituanResult findDeliverInformation(long id);
	MeituanResult findDel(long did);
	MeituanResult getCart(HttpServletRequest req);
	MeituanResult seletDel(long did,HttpServletRequest req,HttpServletResponse res);
	MeituanResult createOrder(Orders order,HttpServletRequest req,HttpServletResponse res);
	MeituanResult updateDel(DeliverInf deliverInf,long did,String ad);
	MeituanResult deleteDel(long did);
}
