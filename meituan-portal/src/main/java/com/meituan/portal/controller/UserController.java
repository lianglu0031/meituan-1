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
import com.meituan.pojo.MtUser;
import com.meituan.portal.service.IUserService;

@Controller
public class UserController {
	
	
	@Autowired
	private IUserService userservice;
	
	@RequestMapping(value="/user/register",method=RequestMethod.POST)
	@ResponseBody
	public MeituanResult createUser(MtUser user) {
		try {
			MeituanResult result = userservice.createUser(user);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return MeituanResult.build(400, "注册失败");
		}
	}
	//用户名检测
	@RequestMapping("/user/checkname")
	@ResponseBody
	public MeituanResult checkDate(@RequestParam String username) {
		MeituanResult result = userservice.checkDate(username);
		return result;
	}
	
	//手机检测
	@RequestMapping("/user/checkphone")
	@ResponseBody
	public MeituanResult checkDate1(@RequestParam("phone") String phone) {
		System.out.println(phone);
		MeituanResult result = userservice.checkDate1(phone);
		return result;
	}
	
	//用户登录
	@RequestMapping(value="/user/login", method=RequestMethod.POST)
	@ResponseBody
	public MeituanResult userLogin(String username, String password,
			HttpServletRequest request, HttpServletResponse response) {
		try {
			
			MeituanResult result = userservice.userLogin(username, password, request, response);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return MeituanResult.build(500, ExceptionUtils.getStackTrace(e));
		}
	}
	
	//获取token
	@RequestMapping("/token/{token}")
	@ResponseBody
	public Object getUserByToken(@PathVariable String token,HttpServletRequest request) {
		MeituanResult result = null;
		try {
			result = userservice.getUserByToken(token,request);
		} catch (Exception e) {
			e.printStackTrace();
			result = MeituanResult.build(500, ExceptionUtils.getStackTrace(e));
		}
		return result;
	}
}
