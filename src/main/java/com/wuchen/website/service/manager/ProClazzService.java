package com.wuchen.website.service.manager;

import java.util.List;
import java.util.Map;

public interface ProClazzService {
	
	public List getProClazzList();
	
	public void saveProClazz(Map par);
	
	public void deleteProClazz(String[] idList);
	
	public List getProClazzListForAddLight();
}
