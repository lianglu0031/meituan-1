package com.meituan.portal.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.meituan.common.Utils.MeituanResult;
import com.meituan.pojo.MtUser;

public interface IUserService {
	MeituanResult createUser(MtUser user) throws Exception;
	MeituanResult checkDate(String content);
	MeituanResult checkDate1(String content);
	MeituanResult userLogin(String username,String password, HttpServletRequest request, HttpServletResponse response);
	MeituanResult getUserByToken(String token,HttpServletRequest request);
}
