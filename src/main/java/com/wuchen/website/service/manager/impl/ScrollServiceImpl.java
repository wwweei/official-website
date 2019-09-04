package com.wuchen.website.service.manager.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wuchen.website.dao.manager.ScrollDao;
import com.wuchen.website.service.manager.ScrollService;

@Service
public class ScrollServiceImpl implements ScrollService {
	@Autowired
	private ScrollDao scroDao;
	
	@Override
	public List getScrollPic(Map par) {
		return scroDao.getScrollPicList(par);
	}

	public Map getPicUrl(String id) {
		return scroDao.getPicUrl(id);
	}

	@Override
	public void updatePic(Map par) {
		scroDao.updatePic(par);
	}

	@Override
	public void addPic(Map par) {
		scroDao.addPic(par);
	}

	@Override
	public void deletePic(String[] idList) {
		scroDao.deletePic(idList);
	}
	
	public String getTotalPicSize() {
		return scroDao.getTotalPicSize();
	}
	
}
