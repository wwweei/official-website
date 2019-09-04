package com.wuchen.website.service.manager;

import java.util.List;
import java.util.Map;

public interface ScrollService {
	
	/**
	 * @author 一世无辰
	 * @param par
	 * @return
	 */
	public List getScrollPic(Map par);
	
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
	 * @param idList
	 */
	public void deletePic(String[] idList);
	
	/**
	 * @author 一世无辰
	 * @return
	 */
	public String getTotalPicSize();
}
