package com.wuchen.website.dao.manager;

import java.util.List;
import java.util.Map;

public interface TradeNewsDao {
	
	public List getTradeNewsList(Map par);

	public Map getTotalTradeNewsNum(Map par);

	public Integer saveTradeNews(Map par);
	
	public Integer updateTradeNews(Map par);
	
	public Integer deleteTradeNews(String[] ids);
}
