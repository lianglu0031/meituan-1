package com.meituan.portal.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.meituan.common.Utils.MeituanResult;
import com.meituan.portal.service.ISManagerService;

@Controller
public class SMController {
	@Autowired
	private ISManagerService sm;
	
	@RequestMapping("/orders/setState1/{oid}")
	@ResponseBody
	public MeituanResult getMenu(@PathVariable long oid) {
		return sm.PayOrder(oid);
	}
	
	
	@RequestMapping(value="/Sellerlogin", method=RequestMethod.POST)
	@ResponseBody
	public MeituanResult getMenu(String username, String password,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			MeituanResult result = sm.sellerLogin(username, password, request, response);
			return result;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return MeituanResult.build(500, ExceptionUtils.getStackTrace(e));
		}
	}
	
	@RequestMapping("/Seller/login/{token}")
	@ResponseBody
	public Object getUserByToken(@PathVariable String token,HttpServletRequest request) {
		MeituanResult result = null;
		try {
			result = sm.getSellerByToken(token, request);
		} catch (Exception e) {
			e.printStackTrace();
			result = MeituanResult.build(500, ExceptionUtils.getStackTrace(e));
		}
		return result;
	}
	
	@RequestMapping ("/orders/getstate")
	@ResponseBody
	public MeituanResult getState1Order(@RequestParam long sid,@RequestParam String type){
		MeituanResult result;
		try {
			result = sm.getStateOrder(sid,type);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = MeituanResult.build(500, ExceptionUtils.getStackTrace(e));
		}
		return result;
		
	}
	
	@RequestMapping("/orders/accept/{oid}")
	@ResponseBody
	public MeituanResult acceptOrder(@PathVariable long oid) {
		MeituanResult result=sm.acceptOrder(oid);
		return result;
	}
	
	@RequestMapping("/orders/send/{oid}")
	@ResponseBody
	public MeituanResult sendOrder(@PathVariable long oid) {
		MeituanResult result=sm.sendOrder(oid);
		return result;
	}
	
	@RequestMapping("/orders/complete/{oid}")
	@ResponseBody
	public MeituanResult completeOrder(@PathVariable long oid) {
		MeituanResult result=sm.completeOrder(oid);
		return result;
	}
	
	@RequestMapping("/orders/getall")
	@ResponseBody
	public MeituanResult getAlllOrder() {
		MeituanResult result=sm.getAllorder();
		return result;
	}
}
