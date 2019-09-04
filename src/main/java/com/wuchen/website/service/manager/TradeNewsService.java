package com.wuchen.website.service.manager;

import java.util.List;
import java.util.Map;

public interface TradeNewsService {
	/**
	 * @author 一世无辰
	 * @param par
	 * @return
	 */
	public List getTradeNewsList(Map par);
	
	/**
	 * @author 一世无辰
	 * @return
	 */
	public Map getTotalTradeNewsNum(Map par);
	
	/**
	 * @author 一世无辰
	 * @param par
	 * @return id
	 */
	public Integer saveTradeNews(Map par);
	
	/**
	 * @author 一世无辰
	 * @param par
	 * @return
	 */
	public Integer updateTradeNews(Map par);
	
	/**
	 * @author 一世无辰
	 * @param par
	 * @return
	 */
	public Integer deleteTradeNews(String[] par);
}
