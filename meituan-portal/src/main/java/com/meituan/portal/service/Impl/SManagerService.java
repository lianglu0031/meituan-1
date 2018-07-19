package com.meituan.portal.service.Impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.meituan.common.Utils.CookieUtils;
import com.meituan.common.Utils.JsonUtils;
import com.meituan.common.Utils.MeituanResult;
import com.meituan.mapper.OrdersMapper;
import com.meituan.mapper.SellerMapper;
import com.meituan.mapper.SellerloginMapper;
import com.meituan.pojo.Orders;
import com.meituan.pojo.OrdersExample;
import com.meituan.pojo.OrdersExample.Criteria;
import com.meituan.pojo.Seller;
import com.meituan.pojo.SellerExample;
import com.meituan.pojo.Sellerlogin;
import com.meituan.pojo.SellerloginExample;
import com.meituan.portal.service.ISManagerService;

@Service
public class SManagerService implements ISManagerService{
	@Autowired
	private OrdersMapper orderMapper;
	@Autowired
	private SellerMapper sellerMapper;
	@Autowired
	private SellerloginMapper loginMapper;

	@Override
	public MeituanResult userComment(Orders orders, short grade, String comment) {
		orders.setGrade(grade);
		orders.setComment(comment);
		OrdersExample example = new OrdersExample();
		Criteria criteria = example.createCriteria();
		criteria.andOidEqualTo(orders.getOid());
		orderMapper.updateByExample(orders, example);
		return new MeituanResult("提交成功");
	}

	// 得到未接单的订单
	@Override
	public MeituanResult getStateOrder(long sid,String type) {
		OrdersExample example = new OrdersExample();
		Criteria criteria = example.createCriteria();
		criteria.andSidEqualTo(sid);
		criteria.andStateEqualTo(type);
		List<Orders> list = orderMapper.selectByExample(example);
		MeituanResult result = MeituanResult.ok(list);
		return result;
	}


	// 付款订单，把状态改成1；
		@Override
		public MeituanResult PayOrder(long oid) {
			try {
				Orders order = orderMapper.selectByPrimaryKey(oid);
				order.setState("1");
				OrdersExample example = new OrdersExample();
				Criteria criteria = example.createCriteria();
				criteria.andOidEqualTo(oid);
				orderMapper.updateByExample(order, example);
			} catch (Exception e) {
				e.printStackTrace();
				return new MeituanResult("付款失败");
			}
			return new MeituanResult("付款成功");
		}
	// 接受订单，把状态改成2；
	@Override
	public MeituanResult acceptOrder(long oid) {
		try {
			Orders order = orderMapper.selectByPrimaryKey(oid);
			order.setState("2");
			OrdersExample example = new OrdersExample();
			Criteria criteria = example.createCriteria();
			criteria.andOidEqualTo(oid);
			orderMapper.updateByExample(order, example);
		} catch (Exception e) {
			e.printStackTrace();
			return new MeituanResult("接单失败");
		}
		return new MeituanResult("接单成功");
	}

	// 该表状态为3；
	@Override
	public MeituanResult sendOrder(long oid) {
		try {
			Orders order = orderMapper.selectByPrimaryKey(oid);
			order.setState("3");
			OrdersExample example = new OrdersExample();
			Criteria criteria = example.createCriteria();
			criteria.andOidEqualTo(oid);
			orderMapper.updateByExample(order, example);
		} catch (Exception e) {
			e.printStackTrace();
			return new MeituanResult("设置派送状态失败");
		}
		return new MeituanResult("派送中");
	}
	
	@Override
	public MeituanResult completeOrder(long oid) {
		try {
			Orders order = orderMapper.selectByPrimaryKey(oid);
			order.setState("4");
			order.setEndtime(new Date());
			OrdersExample example = new OrdersExample();
			Criteria criteria = example.createCriteria();
			criteria.andOidEqualTo(oid);
			orderMapper.updateByExample(order, example);
		} catch (Exception e) {
			e.printStackTrace();
			return new MeituanResult("设置完成状态失败");
		}
		return new MeituanResult("订单已完成");
	}
	//修改商家信息
		@Override
		public MeituanResult UpdateSellerMessage(Seller seller) {
			SellerExample example=new SellerExample();
			com.meituan.pojo.SellerExample.Criteria criteria = example.createCriteria();
			criteria.andSidEqualTo(seller.getSid());
			sellerMapper.updateByExample(seller, example);
			return new MeituanResult("修改商家信息");
		}
		@Override
		public MeituanResult checkName(String name) {
			SellerloginExample example=new SellerloginExample();
			com.meituan.pojo.SellerloginExample.Criteria criteria=example.createCriteria();
			criteria.andSellernameEqualTo(name);
			List<Sellerlogin> list=loginMapper.selectByExample(example);
			if (list == null || list.size() == 0) {
				return MeituanResult.ok(true);
			}
			return MeituanResult.ok(false);
		}
		@Override
		public MeituanResult checkPhone(String phone) {
			SellerloginExample example=new SellerloginExample();
			com.meituan.pojo.SellerloginExample.Criteria criteria=example.createCriteria();
			criteria.andSellernameEqualTo(phone);
			List<Sellerlogin> list=loginMapper.selectByExample(example);
			if (list == null || list.size() == 0) {
				return MeituanResult.ok(true);
			}
			return MeituanResult.ok(false);
		}
		@Override
		public MeituanResult sellerLogin(String username, String password, HttpServletRequest request,
				HttpServletResponse response) {
			SellerloginExample example = new SellerloginExample();
			com.meituan.pojo.SellerloginExample.Criteria criteria = example.createCriteria();
			criteria.andSellernameEqualTo(username);
			List<Sellerlogin> list =loginMapper.selectByExample(example);
			// 如果没有此用户名
			if (null == list || list.size() == 0) {
				return MeituanResult.build(400, "用户名或密码错误");
			}
			Sellerlogin seller = list.get(0);
			// 比对密码
			if (!DigestUtils.md5DigestAsHex(password.getBytes()).equals(seller.getPasswor())) {
				return MeituanResult.build(400, "用户名或密码错误");
			}
			// 生成token
			String token = UUID.randomUUID().toString()+"5201314";
			// 保存用户之前，把用户对象中的密码清空。
			seller.setPasswor(null);
			// 将用户信息写入session
			HttpSession session = request.getSession();
			session.setAttribute("SELLER_SESSION" + ":" + token, JsonUtils.objectToJson(seller));
			// 添加写cookie的逻辑，cookie的有效期是关闭浏览器就失效。
			CookieUtils.setCookie(request, response, "MT_SELLER_TOKEN", token);

			// 返回token
			return MeituanResult.ok(token);
		}

		@Override
		public MeituanResult getSellerByToken(String token, HttpServletRequest request) {
			// 根据token从session中查询用户信息
			String json = (String) request.getSession().getAttribute("MT_SELLER_TOKEN" + ":" + token);
			// 判断是否为空
			if (StringUtils.isBlank(json)) {
				return MeituanResult.build(400, "此session已经过期，请重新登录");
			}
			// 返回用户信息
			return MeituanResult.ok(JsonUtils.jsonToPojo(json, Seller.class));
		}

		@Override
		public MeituanResult getAllorder() {
			OrdersExample example = new OrdersExample();
			List<Orders> list = orderMapper.selectByExample(example);
			return MeituanResult.ok(list);
		}

		
}
