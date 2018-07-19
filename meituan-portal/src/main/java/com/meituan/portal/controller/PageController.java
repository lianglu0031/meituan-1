package com.meituan.portal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {
	
	@RequestMapping("/index")
	public String showIndex() {
		return "index";
	}
	@RequestMapping("/register")
	public String showRegister() {
		return "register";
	}
	@RequestMapping("/login")
	public String showLogin() {
		return "login";
	}
	@RequestMapping("/picture")
	public String showPicture() {
		return "picture";
	}
	@RequestMapping("/restaurant")
	public String showRestaurant() {
		return "restaurant";
	}
	@RequestMapping("/orderc")
	public String showOrder() {
		return "orderc";
	}
	@RequestMapping("/myorder")
	public String showmyorder() {
		return "myorder";
	}
	@RequestMapping("/confirmOrder")
	public String showconfirmOrder() {
		return "confirmOrder";
	}
	
	@RequestMapping("/test")
	public String showtest() {
		return "test";
	}
	
	@RequestMapping("/sellerc")
	public String showseller() {
		return "sellerc";
	}
	
	@RequestMapping("/manager")
	public String showmanager() {
		return "manager";
	}
	
	@RequestMapping("/home")
	public String showhome() {
		return "home";
	}
	@RequestMapping("/transaction")
	public String showtransaction() {
		return "transaction";
	}
	@RequestMapping("/Orderform")
	public String showOrderform() {
		return "Orderform";
	}
	@RequestMapping("/Amounts")
	public String showAmounts() {
		return "Amounts";
	}
	@RequestMapping("/Order_handling")
	public String showOrder_handling() {
		return "Order_handling";
	}
	@RequestMapping("/Cover_management")
	public String showCover_management() {
		return "Cover_management";
	}
	
}
