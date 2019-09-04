package com.wuchen.website.service.manager;

import java.util.List;
import java.util.Map;

public interface ComNewsService {
	/**
	 * @author 一世无辰
	 * @param par
	 * @return
	 */
	public List getComNewsList(Map par);
	
	/**
	 * @author 一世无辰
	 * @return
	 */
	public Map getTotalComNewsNum(Map par);
	
	/**
	 * @author 一世无辰
	 * @param par
	 * @return id
	 */
	public Integer saveComNews(Map par);
	
	/**
	 * @author 一世无辰
	 * @param par
	 * @return
	 */
	public Integer updateComNews(Map par);
	
	/**
	 * @author 一世无辰
	 * @param par
	 * @return
	 */
	public Integer deleteComNews(String[] par);
}
