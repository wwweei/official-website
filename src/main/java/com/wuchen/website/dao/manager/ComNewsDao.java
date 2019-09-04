package com.wuchen.website.dao.manager;

import java.util.List;
import java.util.Map;

public interface ComNewsDao {
	
	public List getComNewsList(Map par);

	public Map getTotalComNewsNum(Map par);

	public Integer saveComNews(Map par);
	
	public Integer updateComNews(Map par);
	
	public Integer deleteComNews(String[] ids);
}
