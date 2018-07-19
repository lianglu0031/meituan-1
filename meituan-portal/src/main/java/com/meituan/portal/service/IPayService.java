package com.meituan.portal.service;

import javax.servlet.http.HttpServletRequest;

import com.meituan.common.Utils.MeituanResult;

public interface IPayService {
	MeituanResult getOrderByToken(String token,HttpServletRequest req);
}
