package com.meituan.portal.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.meituan.common.Utils.MeituanResult;
import com.meituan.portal.service.IMenuService;

@Controller
public class MenuController {
	@Autowired
	private IMenuService menuservice;
	
	@RequestMapping("/menutype/{id}")
	@ResponseBody
	public MeituanResult getMenuType(@PathVariable long id) {
		return menuservice.getMenuType(id);
	}
	
	@RequestMapping("/menu")
	@ResponseBody
	public MeituanResult getMenu(@RequestParam("sid") long sid,@RequestParam("cid")long cid) {
		return menuservice.getMenu(sid,cid);
	}
}
