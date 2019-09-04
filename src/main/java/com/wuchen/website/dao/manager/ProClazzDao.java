package com.wuchen.website.dao.manager;

import java.util.List;
import java.util.Map;

public interface ProClazzDao {
	
	public List getProClazzList();
	
	public void saveProClazz(Map par);
	
	public void deleteProClazz(String[] idList);
	
	public List getProClazzListForAddLight();
}
