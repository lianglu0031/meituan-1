package com.meituan.portal.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.meituan.common.Utils.MeituanResult;
import com.meituan.pojo.DeliverInf;
import com.meituan.pojo.Orders;
import com.meituan.portal.service.IOrderService;

@Controller
public class OrderController {
	@Autowired
	private IOrderService orderservice;

	@RequestMapping("/order/add/{id}")
	@ResponseBody
	public MeituanResult addCartDish(@PathVariable long id, HttpServletRequest req, HttpServletResponse res) {
		MeituanResult result = orderservice.addCartDishes(id, 1, req, res);
		return result;
	}

	@RequestMapping("/order/delete/{id}")
	@ResponseBody
	public MeituanResult deleteCartDish(@PathVariable long id, HttpServletRequest req, HttpServletResponse res) {
		MeituanResult result = orderservice.deleteCartDishes(id, 1, req, res);
		return result;
	}

	@RequestMapping("/order/deletes")
	@ResponseBody
	public MeituanResult deleteCartDish(HttpServletRequest req, HttpServletResponse res) {
		MeituanResult result = orderservice.deleteCart(req, res);
		return result;
	}

	@RequestMapping(value = "/order/adddel/{id}", method = RequestMethod.POST)
	@ResponseBody
	public MeituanResult addDel(DeliverInf deliver, String address, @PathVariable long id) {
		MeituanResult result = orderservice.addDeliverInformation(deliver, address, id);
		return result;
	}

	@RequestMapping("/order/del/{id}")
	@ResponseBody
	public MeituanResult Del(@PathVariable long id) {
		MeituanResult result = orderservice.findDeliverInformation(id);
		return result;
	}

	@RequestMapping("/order/finddel/{did}")
	@ResponseBody
	public MeituanResult findDel(@PathVariable long did) {
		MeituanResult result = orderservice.findDel(did);
		return result;
	}

	@RequestMapping("/order/cart")
	@ResponseBody
	public MeituanResult getCart(HttpServletRequest req) {
		MeituanResult result = orderservice.getCart(req);
		return result;
	}

	@RequestMapping("/order/seletdel/{did}")
	@ResponseBody
	public MeituanResult seletDel(@PathVariable long did, HttpServletRequest req, HttpServletResponse res) {
		MeituanResult result = orderservice.seletDel(did, req, res);
		return result;
	}

	@RequestMapping(value = "/order/create", method = RequestMethod.POST)
	@ResponseBody
	public MeituanResult createOrder(Orders order, HttpServletRequest req, HttpServletResponse res) {
		MeituanResult result = orderservice.createOrder(order, req, res);
		return result;
	}

	@RequestMapping(value = "/order/updatedel/{did}", method = RequestMethod.POST)
	@ResponseBody
	public MeituanResult updateDel(DeliverInf deliverInf, @PathVariable long did, String address) {
		MeituanResult result = orderservice.updateDel(deliverInf, did, address);
		return result;
	}

	@RequestMapping("/order/deletedel/{did}")
	@ResponseBody
	public MeituanResult deleteDel(@PathVariable long did) {
		MeituanResult result = orderservice.deleteDel(did);
		return result;
	}
	

}
