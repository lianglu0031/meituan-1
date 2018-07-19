package com.meituan.portal.service.Impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meituan.common.Utils.MeituanResult;
import com.meituan.mapper.SellerMapper;
import com.meituan.pojo.Seller;
import com.meituan.pojo.SellerExample;
import com.meituan.pojo.SellerExample.Criteria;
import com.meituan.portal.service.ISellerService;

@Service
public class SellerServiceImpl implements ISellerService {
	@Autowired
	private SellerMapper sellerMapper;
	@Override
	public MeituanResult CreateSeller(Seller seller) {
		try {
			Date date = new Date();
			seller.setCreated(date);
			seller.setUpdated(date);
			sellerMapper.insert(seller);
		} catch (Exception e) {
			e.printStackTrace();
			return  MeituanResult.build(400,"入驻失败");
		}
		return new MeituanResult("入驻成功");
	}
	@Override
	public MeituanResult ShowSeller() {
		SellerExample example = new SellerExample();
		List<Seller> list = sellerMapper.selectByExample(example);
		if (list == null || list.size() == 0) {
			return MeituanResult.build(400, "附近无商家信息");
		}else {
		return MeituanResult.ok(list);
		}
	}
	@Override
	public MeituanResult ShowSeller(String type) {
		SellerExample example = new SellerExample();
		Criteria criteria = example.createCriteria();
		criteria.andTypeEqualTo(type);
		List<Seller> list = sellerMapper.selectByExample(example);
		if (list == null || list.size() == 0) {
			return MeituanResult.build(400, "附近无商家信息");
		}else {
		return MeituanResult.ok(list);
		}
	}
	@Override
	public MeituanResult FindSeller(long sid) {
		SellerExample example = new SellerExample();
		Criteria criteria = example.createCriteria();
		criteria.andSidEqualTo(sid);
		Seller seller = sellerMapper.selectByPrimaryKey(sid);
		return MeituanResult.ok(seller);
	}

}
