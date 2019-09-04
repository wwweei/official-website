package com.wuchen.website.service.manager.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wuchen.website.dao.manager.TradeNewsDao;
import com.wuchen.website.service.manager.TradeNewsService;

@Service
public class TradeNewsServiceImpl implements TradeNewsService {
	@Autowired
	private TradeNewsDao tradeNewsDao;
	@Override
	public List getTradeNewsList(Map par) {
		return tradeNewsDao.getTradeNewsList(par);
	}

	@Override
	public Map getTotalTradeNewsNum(Map par) {
		return tradeNewsDao.getTotalTradeNewsNum(par);
	}

	@Override
	public Integer saveTradeNews(Map par) {
		return tradeNewsDao.saveTradeNews(par);
	}

	@Override
	public Integer updateTradeNews(Map par) {
		return tradeNewsDao.updateTradeNews(par);
	}

	@Override
	public Integer deleteTradeNews(String[] ids) {
		return tradeNewsDao.deleteTradeNews(ids);
	}

}
