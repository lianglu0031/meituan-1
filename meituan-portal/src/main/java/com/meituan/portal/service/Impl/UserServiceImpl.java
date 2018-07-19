package com.meituan.portal.service.Impl;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import com.meituan.common.Utils.CookieUtils;
import com.meituan.common.Utils.JsonUtils;
import com.meituan.common.Utils.MeituanResult;
import com.meituan.mapper.MtUserMapper;
import com.meituan.pojo.MtUser;
import com.meituan.pojo.MtUserExample;
import com.meituan.pojo.MtUserExample.Criteria;
import com.meituan.portal.service.IUserService;

@Service
public class UserServiceImpl implements IUserService {

	@Autowired
	private MtUserMapper userMapper;

	@Value("${USER_SESSION_KEY}")
	private String USER_SESSION_KEY;

	@Override
	public MeituanResult createUser(MtUser user) throws Exception {
		Date date = new Date();
		user.setCreated(date);
		user.setUpdated(date);
		user.setPassword(DigestUtils.md5DigestAsHex(user.getPassword().getBytes()));
		userMapper.insert(user);
		return new MeituanResult("注册成功");
	}

	// 用户名校验
	@Override
	public MeituanResult checkDate(String content) {
		MtUserExample example = new MtUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(content);
		List<MtUser> list = userMapper.selectByExample(example);
		if (list == null || list.size() == 0) {
			return MeituanResult.ok(true);
		}
		return MeituanResult.ok(false);
	}

	// 手机检验
	@Override
	public MeituanResult checkDate1(String content) {
		MtUserExample example = new MtUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andPhoneEqualTo(content);
		List<MtUser> list = userMapper.selectByExample(example);
		if (list == null || list.size() == 0) {
			return MeituanResult.ok(true);
		}
		return MeituanResult.ok(false);
	}

	@Override
	public MeituanResult userLogin(String username, String password, HttpServletRequest request,
			HttpServletResponse response) {
		MtUserExample example = new MtUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUsernameEqualTo(username);
		List<MtUser> list = userMapper.selectByExample(example);
		// 如果没有此用户名
		if (null == list || list.size() == 0) {
			return MeituanResult.build(400, "用户名或密码错误");
		}
		MtUser user = list.get(0);
		// 比对密码
		if (!DigestUtils.md5DigestAsHex(password.getBytes()).equals(user.getPassword())) {
			return MeituanResult.build(400, "用户名或密码错误");
		}
		// 生成token
		String token = UUID.randomUUID().toString();
		// 保存用户之前，把用户对象中的密码清空。
		user.setPassword(null);
		// 将用户信息写入session
		HttpSession session = request.getSession();
		session.setAttribute(USER_SESSION_KEY + ":" + token, JsonUtils.objectToJson(user));
		// 添加写cookie的逻辑，cookie的有效期是关闭浏览器就失效。
		CookieUtils.setCookie(request, response, "MT_TOKEN", token);

		// 返回token
		return MeituanResult.ok(token);
	}

	@Override
	public MeituanResult getUserByToken(String token,HttpServletRequest request) {
		// 根据token从session中查询用户信息
		String json = (String) request.getSession().getAttribute(USER_SESSION_KEY + ":" + token);
		// 判断是否为空
		if (StringUtils.isBlank(json)) {
			return MeituanResult.build(400, "此session已经过期，请重新登录");
		}
		// 返回用户信息
		return MeituanResult.ok(JsonUtils.jsonToPojo(json, MtUser.class));
	}

}
