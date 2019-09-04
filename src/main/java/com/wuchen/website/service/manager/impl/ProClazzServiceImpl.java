package com.wuchen.website.service.manager.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wuchen.website.dao.manager.ProClazzDao;
import com.wuchen.website.entity.ProductMenuTree;
import com.wuchen.website.service.manager.ProClazzService;

@Service
public class ProClazzServiceImpl implements ProClazzService{

	@Autowired
	private ProClazzDao proClazzDao;
	
	@Override
	public List getProClazzList() {
		
		return proClazzDao.getProClazzList();
	}

	@Override
	public void saveProClazz(Map par) {
		proClazzDao.saveProClazz(par);
	}

	@Override
	public void deleteProClazz(String[] idList) {
		proClazzDao.deleteProClazz(idList);
	}

	@Override
	public List getProClazzListForAddLight() {
		List clazzList = proClazzDao.getProClazzListForAddLight();
		return clazzList;
	}

}
