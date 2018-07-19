package com.meituan.portal.service;

import com.meituan.common.Utils.MeituanResult;
import com.meituan.pojo.SellerClassify;
import com.meituan.pojo.SellerMenu;

public interface IMenuService {
	MeituanResult getMenuType(long sid);
	MeituanResult getMenu(long sid,long cid);
	MeituanResult AddMenu(SellerMenu sellerMenu);//fang
	MeituanResult UpdateMenu(SellerMenu sellerMenu);//fang
	MeituanResult DeleteMenu(long cid);//fang
	MeituanResult AddType(SellerClassify classify,long sid);//fang
}
