package com.wuchen.website.dao.official;

import java.util.List;
import java.util.Map;

import com.wuchen.website.entity.ProductLight;

public interface LightProductDao {
	
	public List getLightListForIndex();
	
	public List getProClazzList();
	
	public List getProductLightList(Map par);
	
	public ProductLight getLightDetail(Map par);
}
