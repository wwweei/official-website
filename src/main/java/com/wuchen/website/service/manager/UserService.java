package com.wuchen.website.service.manager;

import java.util.List;
import java.util.Map;

import com.wuchen.website.entity.User;

/**
 * @author 一世无辰
 *
 */
public interface UserService {
	public void addUser(User user);
	
	/**
	 * @author 一世无辰
	 * @param user
	 * @return
	 */
	public User userLogin(User user);
	
	/**
	 * @author 一世无辰
	 * @param acnt
	 * @return
	 */
	public Map checkAcntExist(String acnt);
	
	/**
	 * @author 一世无辰
	 * @return
	 */
	public List getUserList();
	
	/**
	 * @author 一世无辰
	 * @return
	 */
	public Map getTotalUserNum();
	
	/**
	 * @author 一世无辰
	 * @param idList
	 */
	public Integer deleteUser(String[] idList);
	
	/**
	 * @author 一世无辰
	 * @param par
	 */
	public Integer updateUser(Map par);
}
