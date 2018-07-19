package com.meituan.portal.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.meituan.common.Utils.MeituanResult;
import com.meituan.portal.service.IPayService;

@Controller
public class PayController {
	@Autowired
	private IPayService payservice;
	@RequestMapping("/pay/{token}")
	@ResponseBody
	public Object getOrderByToken(@PathVariable String token,HttpServletRequest req) {
		MeituanResult result = null;
		try {
			result = payservice.getOrderByToken(token, req);
		} catch (Exception e) {
			e.printStackTrace();
			result = MeituanResult.build(500, ExceptionUtils.getStackTrace(e));
		}
		return result;
	}
}
