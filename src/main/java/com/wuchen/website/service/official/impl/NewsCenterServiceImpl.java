package com.wuchen.website.service.official.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wuchen.website.dao.official.NewsCenterDao;
import com.wuchen.website.service.official.NewsCenterService;
@Service
public class NewsCenterServiceImpl implements NewsCenterService {
	
	@Autowired
	private NewsCenterDao newsCenterdao;
	
	
	@Override
	public Map getNewsDetail(Map par) {
		if("1".equals(par.get("kind"))) {
			return newsCenterdao.getTradeNewsDetail(par);
		} else if ("0".equals(par.get("kind"))) {
			return newsCenterdao.getComNewsDetail(par);
		}
		return null;
	}


	@Override
	public List getNewsList(Map par) {
		//行业咨询列表
		if ("1".equals(par.get("kind"))) {
			
			return newsCenterdao.getTradeNewsList(par);
			
		//内部咨询列表
		}else if ("0".equals(par.get("kind"))) {
			return newsCenterdao.getComNewsList(par);
			 
		//全部新闻列表
		} else {
			return newsCenterdao.getAllNewsList(par);
		}
	}

}
