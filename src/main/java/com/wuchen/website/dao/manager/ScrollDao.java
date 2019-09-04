package com.wuchen.website.dao.manager;

import java.util.List;
import java.util.Map;

/**
 * @author 一世无辰
 *
 */
public interface ScrollDao {
	/**
	 * @author 一世无辰
	 * @param par
	 * @return
	 */
	public List getScrollPicList(Map par);
	
	/**
	 * @author 一世无辰
	 * @param id
	 * @return
	 */
	public Map getPicUrl(String id);
	
	/**
	 * @author 一世无辰
	 * @param par
	 */
	public void updatePic(Map par);
	
	/**
	 * @author 一世无辰
	 * @param par
	 */
	public void addPic(Map par);
	
	/**
	 * @author 一世无辰
	 * @param ids
	 */
	public void deletePic(String[] ids);
	
	public String getTotalPicSize();
}
