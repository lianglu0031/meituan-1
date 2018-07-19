package com.meituan.portal.service.Impl;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.meituan.common.Utils.JsonUtils;
import com.meituan.common.Utils.MeituanResult;
import com.meituan.pojo.Orders;
import com.meituan.portal.service.IPayService;

@Service
public class PayServiceImpl implements IPayService {

	@Override
	public MeituanResult getOrderByToken(String token, HttpServletRequest req) {
		// 根据token从session中查询用户信息
		String json = (String) req.getSession().getAttribute("PAY_SESSION" + ":" + token);
		// 判断是否为空
		if (StringUtils.isBlank(json)) {
			return MeituanResult.build(400, "此session已经过期，请重新登录");
		}
		// 返回订单信息
		return MeituanResult.ok(JsonUtils.jsonToPojo(json, Orders.class));
	}

}
