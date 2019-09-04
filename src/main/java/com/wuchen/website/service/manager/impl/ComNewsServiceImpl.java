package com.wuchen.website.service.manager.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wuchen.website.dao.manager.ComNewsDao;
import com.wuchen.website.service.manager.ComNewsService;

@Service
public class ComNewsServiceImpl implements ComNewsService {
	@Autowired
	private ComNewsDao comNewsDao;
	@Override
	public List getComNewsList(Map par) {
		return comNewsDao.getComNewsList(par);
	}

	@Override
	public Map getTotalComNewsNum(Map par) {
		return comNewsDao.getTotalComNewsNum(par);
	}

	@Override
	public Integer saveComNews(Map par) {
		return comNewsDao.saveComNews(par);
	}

	@Override
	public Integer updateComNews(Map par) {
		return comNewsDao.updateComNews(par);
	}

	@Override
	public Integer deleteComNews(String[] ids) {
		return comNewsDao.deleteComNews(ids);
	}

}
