package com.wuchen.website.dao.manager;

import java.util.List;
import java.util.Map;

import com.wuchen.website.entity.ProductLight;

public interface ProductLightDao {

	public ProductLight getLightDetail(String id);
	
	public List getLightList(Map par);
	
	public int deleteLight(String id);
	
	public int saveLight(ProductLight light);
	
	public int updateLight(ProductLight light);
}
