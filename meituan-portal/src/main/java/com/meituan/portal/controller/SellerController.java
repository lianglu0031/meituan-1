package com.meituan.portal.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.meituan.common.Utils.MeituanResult;
import com.meituan.pojo.Seller;
import com.meituan.portal.service.ISellerService;

@Controller
public class SellerController {
	@Autowired
	private ISellerService sellerService;
	@RequestMapping(value="/seller/submit", method=RequestMethod.POST)
	@ResponseBody
	public  MeituanResult CreateSeller(Seller seller) {
		MeituanResult result = sellerService.CreateSeller(seller);
		return result;
	}
	
	@RequestMapping("/seller")
	@ResponseBody
	public MeituanResult ShowSeller() {
		MeituanResult result = sellerService.ShowSeller();
		return result;
	}
	
	@RequestMapping("/seller/find/{sid}")
	@ResponseBody
	public MeituanResult findSeller(@PathVariable long sid) {
		MeituanResult result = sellerService.FindSeller(sid);
		return result;
	}
	
	@RequestMapping("/seller/{type}")
	@ResponseBody
	public MeituanResult ShowSeller(@PathVariable String type) {
		MeituanResult result = sellerService.ShowSeller(type);
		return result;
	}
}
