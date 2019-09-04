package com.wuchen.website.service.manager.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wuchen.website.dao.manager.ProductLightDao;
import com.wuchen.website.entity.ProductLight;
import com.wuchen.website.service.manager.ProductLightService;

@Service
public class ProductLightServiceImpl implements ProductLightService {

	@Autowired
	private ProductLightDao lightDao;
	
	@Override
	public ProductLight getLightDetail(String id) {
		return lightDao.getLightDetail(id);
	}

	@Override
	public List getLightList(Map par) {
		return lightDao.getLightList(par);
	}

	@Override
	public int deleteLight(String id) {
		return lightDao.deleteLight(id);
	}

	@Override
	public int saveLight(ProductLight light) {
		return lightDao.saveLight(light);
	}

	@Override
	public int updateLight(ProductLight light) {
		return lightDao.updateLight(light);
	}

}
