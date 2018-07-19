package com.meituan.portal.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meituan.common.Utils.MeituanResult;
import com.meituan.mapper.SellerClassifyMapper;
import com.meituan.mapper.SellerMenuMapper;
import com.meituan.pojo.SellerClassify;
import com.meituan.pojo.SellerClassifyExample;
import com.meituan.pojo.SellerMenu;
import com.meituan.pojo.SellerMenuExample;
import com.meituan.pojo.SellerMenuExample.Criteria;
import com.meituan.portal.service.IMenuService;

@Service
public class MenuServiceImpl implements IMenuService {

	@Autowired
	private SellerMenuMapper menuMapper;
	@Autowired
	private SellerClassifyMapper classifyMapper;

	@Override
	public MeituanResult getMenu(long sid, long cid) {
		SellerMenuExample example = new SellerMenuExample();
		Criteria criteria = example.createCriteria();
		criteria.andSidEqualTo(sid);
		criteria.andCidEqualTo(cid);
		List<SellerMenu> list = menuMapper.selectByExample(example);
		MeituanResult result = MeituanResult.ok(list);
		return result;
	}

	@Override
	public MeituanResult getMenuType(long sid) {
		SellerClassifyExample example = new SellerClassifyExample();
		com.meituan.pojo.SellerClassifyExample.Criteria criteria = example.createCriteria();
		criteria.andSidEqualTo(sid);
		List<SellerClassify> list = classifyMapper.selectByExample(example);
		MeituanResult result = MeituanResult.ok(list);
		return result;
	}
	// 添加菜单

	@Override
	public MeituanResult AddMenu(SellerMenu sellerMenu) {
		try {

			menuMapper.insert(sellerMenu);
		} catch (Exception e) {
			e.printStackTrace();
			return MeituanResult.build(400, "添加菜单失败");
		}
		return new MeituanResult("添加菜单成功");
	}

	@Override
	public MeituanResult UpdateMenu(SellerMenu sellerMenu) {
		try {
			SellerMenuExample example = new SellerMenuExample();
			Criteria criteria = example.createCriteria();
			criteria.andIdEqualTo(sellerMenu.getId());
			menuMapper.updateByExample(sellerMenu, example);
		} catch (Exception e) {
			e.printStackTrace();
			return MeituanResult.build(400, "修改菜单失败");
		}
		return new MeituanResult("修改菜单成功");
	}

	@Override
	public MeituanResult DeleteMenu(long cid) {
		try {
			menuMapper.deleteByPrimaryKey(cid);
		} catch (Exception e) {
			e.printStackTrace();
			return MeituanResult.build(400, "删除菜单失败");
		}
		return new MeituanResult("删除菜单成功");
	}

	// 添加菜单类型
	@Override
	public MeituanResult AddType(SellerClassify classify, long sid) {
		try {
			classify.setSid(sid);
			classifyMapper.insert(classify);
		} catch (Exception e) {
			e.printStackTrace();
			return MeituanResult.build(400, "增加菜单种类失败");
		}
		return null;
	}
}
