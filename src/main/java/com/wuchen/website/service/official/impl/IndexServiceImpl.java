package com.wuchen.website.service.official.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wuchen.website.dao.official.IndexDao;
import com.wuchen.website.service.official.IndexService;

@Service
public class IndexServiceImpl implements IndexService {
	
	@Autowired
	private IndexDao indexDao;

	@Override
	public List getMainPic(Map par) {
		
		return indexDao.getMainPic(par);
		
	}

	@Override
	public List getComNews(Map par) {
		return indexDao.getComNews(par);
	}

	@Override
	public List getTradeNews(Map par) {
		return indexDao.getTradeNews(par);
	}

}
