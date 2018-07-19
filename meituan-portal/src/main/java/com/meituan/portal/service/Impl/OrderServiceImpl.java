package com.meituan.portal.service.Impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.meituan.common.Utils.CookieUtils;
import com.meituan.common.Utils.IDUtils;
import com.meituan.common.Utils.JsonUtils;
import com.meituan.common.Utils.MeituanResult;
import com.meituan.mapper.DeliverInfMapper;
import com.meituan.mapper.OrdersMapper;
import com.meituan.mapper.SellerMenuMapper;
import com.meituan.pojo.DeliverInf;
import com.meituan.pojo.DeliverInfExample;
import com.meituan.pojo.Orders;
import com.meituan.pojo.SellerMenu;
import com.meituan.pojo.SellerMenuExample;
import com.meituan.pojo.SellerMenuExample.Criteria;
import com.meituan.portal.pojo.CartDishes;
import com.meituan.portal.service.IOrderService;

@Service
public class OrderServiceImpl implements IOrderService {
	@Autowired
	private SellerMenuMapper menumapper;

	@Autowired
	private DeliverInfMapper delivermapper;

	@Autowired
	private OrdersMapper ordermapper;

	@Override
	public MeituanResult addCartDishes(long id, Integer num, HttpServletRequest req, HttpServletResponse res) {
		CartDishes cartDishes = null;
		List<CartDishes> cartList = getCartList(req);
		for (CartDishes cartDishes1 : cartList) {
			if (cartDishes1.getDid() == id) {
				cartDishes1.setNum(cartDishes1.getNum() + num);
				cartDishes = cartDishes1;
				break;
			}
		}
		if (cartDishes == null) {
			cartDishes = new CartDishes();
			SellerMenuExample example = new SellerMenuExample();
			Criteria criteria = example.createCriteria();
			criteria.andIdEqualTo(id);
			SellerMenu cartdish = menumapper.selectByPrimaryKey(id);
			cartDishes.setDid(cartdish.getId());
			cartDishes.setDname(cartdish.getMname());
			cartDishes.setPrice(cartdish.getPrice());
			cartDishes.setNum(num);
			cartList.add(cartDishes);
		}
		CookieUtils.setCookie(req, res, "MT_CART", JsonUtils.objectToJson(cartList), -1, "utf-8");
		return MeituanResult.ok(cartList);
	}

	@Override
	public MeituanResult deleteCartDishes(long id, Integer num, HttpServletRequest req, HttpServletResponse res) {
		List<CartDishes> cartList = getCartList(req);
		for (CartDishes cartDishes1 : cartList) {
			if (cartDishes1.getDid() == id) {
				if (cartDishes1.getNum() == 1) {
					cartList.remove(cartDishes1);
					break;
				} else {
					cartDishes1.setNum(cartDishes1.getNum() - num);
					break;
				}
			}
		}
		if (cartList == null) {
			CookieUtils.deleteCookie(req, res, "MT_CART");
			return MeituanResult.ok();
		}
		CookieUtils.setCookie(req, res, "MT_CART", JsonUtils.objectToJson(cartList), -1, "utf-8");
		return MeituanResult.ok(cartList);
	}

	@Override
	public MeituanResult deleteCart(HttpServletRequest req, HttpServletResponse res) {
		CookieUtils.deleteCookie(req, res, "MT_CART");
		return MeituanResult.ok();
	}

	@Override
	public MeituanResult addDeliverInformation(DeliverInf deliver, String ad, long id) {
		deliver.setUid(id);
		deliver.setDaddress(deliver.getDaddress() + "  " + ad);
		delivermapper.insert(deliver);
		return MeituanResult.ok();
	}

	@Override
	public MeituanResult findDeliverInformation(long id) {
		DeliverInfExample example = new DeliverInfExample();
		com.meituan.pojo.DeliverInfExample.Criteria criteria = example.createCriteria();
		criteria.andUidEqualTo(id);
		List<DeliverInf> list = delivermapper.selectByExample(example);
		return MeituanResult.ok(list);
	}

	@Override
	public MeituanResult getCart(HttpServletRequest req) {
		return MeituanResult.ok(getCartList(req));
	}

	// 获取cookie中的购物车
	private List<CartDishes> getCartList(HttpServletRequest req) {
		String cartlist = CookieUtils.getCookieValue(req, "MT_CART", true);
		if (cartlist == null || cartlist == "") {
			return new ArrayList<>();
		}

		try {
			List<CartDishes> list = JsonUtils.jsonToList(cartlist, CartDishes.class);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<>();
		}

	}

	@Override
	public MeituanResult seletDel(long did, HttpServletRequest req, HttpServletResponse res) {
		try {
			CookieUtils.setCookie(req, res, "DELIVER_INF", did + "", -1, "utf-8");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return MeituanResult.ok();
	}

	@Override
	public MeituanResult createOrder(Orders order, HttpServletRequest req, HttpServletResponse res) {
		float sum = 6;
		String cartlist = CookieUtils.getCookieValue(req, "MT_CART", true);
		order.setDish(cartlist);
		long did = Long.parseLong(CookieUtils.getCookieValue(req, "DELIVER_INF", true));
		order.setDid(did);
		long oid = IDUtils.genOrderId();
		order.setOid(oid);
		order.setStarttime(new Date());
		List<CartDishes> list = getCartList(req);
		for (CartDishes dish : list) {
			sum += dish.getNum() * dish.getPrice();
		}
		order.setPrice(sum);
		order.setState("0");
		try {
			ordermapper.insert(order);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 生成token
		String token = UUID.randomUUID().toString();
		// 将用户信息写入session
		HttpSession session = req.getSession();
		session.setAttribute("PAY_SESSION" + ":" + token,JsonUtils.objectToJson(order));
		// 添加写cookie的逻辑，cookie的有效期是关闭浏览器就失效。
		CookieUtils.setCookie(req, res, "MT_PAY_TOKEN", token);
		System.out.println(token);
		return MeituanResult.ok();
	}

	@Override
	public MeituanResult updateDel(DeliverInf deliverInf, long did, String ad) {
		DeliverInfExample example = new DeliverInfExample();
		com.meituan.pojo.DeliverInfExample.Criteria criteria = example.createCriteria();
		criteria.andDidEqualTo(did);
		try {
			deliverInf.setDaddress(deliverInf.getDaddress() + "  " + ad);
			delivermapper.updateByExample(deliverInf, example);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return MeituanResult.ok();
	}

	@Override
	public MeituanResult deleteDel(long did) {
		try {
			delivermapper.deleteByPrimaryKey(did);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return MeituanResult.ok();
	}

	@Override
	public MeituanResult findDel(long did) {
		DeliverInf del = delivermapper.selectByPrimaryKey(did);
		return MeituanResult.ok(del);
	}


		

	
}
