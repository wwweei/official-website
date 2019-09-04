package com.wuchen.website.service.manager;

import java.util.List;
import java.util.Map;

import com.wuchen.website.entity.ProductLight;

/**
 * @author 一世无辰
 *
 */
public interface ProductLightService {
	
	public ProductLight getLightDetail(String id);
	
	public List getLightList(Map par);
	
	public int deleteLight(String id);
	
	public int saveLight(ProductLight light);
	
	public int updateLight(ProductLight light);
}
