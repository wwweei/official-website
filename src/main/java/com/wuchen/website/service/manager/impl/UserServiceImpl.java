package com.wuchen.website.service.manager.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wuchen.website.dao.manager.UserDao;
import com.wuchen.website.entity.User;
import com.wuchen.website.service.manager.UserService;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;
	@Override
	public void addUser(User user) {
		userDao.addUser(user);
	}
	
	@Override
	public User userLogin(User user) {
		return userDao.userLogin(user);
	}

	@Override
	public Map checkAcntExist(String acnt) {
		Map result = userDao.checkAcntExist(acnt);
		Map msg = new HashMap();
		Long flag = (Long) result.get("acntCount");
		if (flag == 0) {
			msg.put("msg", "success");
		} else {
			msg.put("msg", "failed");
		}
		return msg;
	}

	@Override
	public List getUserList() {
		return userDao.getUserList();
	}

	@Override
	public Map getTotalUserNum() {
		return userDao.getTotalUserNum();
	}

	@Override
	public Integer deleteUser(String[] idList) {
		return userDao.deleteUser(idList);
	}

	@Override
	public Integer updateUser(Map par) {
		return userDao.updateUser(par);
	}

}
