package com.wuchen.website.service.official;

import java.util.List;
import java.util.Map;

import com.wuchen.website.entity.ProductLight;

public interface LightProductService {
	
	public List getLightListForIndex();
	
	public List getProductMenuTree();
	
	public List getProductLightList(Map par);
	
	public ProductLight getLightDetail(Map par);
}
