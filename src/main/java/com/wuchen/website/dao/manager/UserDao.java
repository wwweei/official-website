package com.wuchen.website.dao.manager;

import java.util.List;
import java.util.Map;

import com.wuchen.website.entity.User;

public interface UserDao {
	public void addUser(User user);
	
	public User userLogin(User user);
	
	public Map checkAcntExist(String acnt);
	
	public List getUserList();
	
	public Map getTotalUserNum();
	
	public Integer deleteUser(String[] idList);
	
	public Integer updateUser(Map par);
}
