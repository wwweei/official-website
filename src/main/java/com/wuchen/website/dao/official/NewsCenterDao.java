package com.wuchen.website.dao.official;

import java.util.List;
import java.util.Map;

public interface NewsCenterDao {
	
	public Map getComNewsDetail(Map par);
	
	public Map getTradeNewsDetail(Map par);
	
	public List getComNewsList(Map par);
	
	public List getTradeNewsList(Map par);
	
	public List getAllNewsList(Map par);
}
