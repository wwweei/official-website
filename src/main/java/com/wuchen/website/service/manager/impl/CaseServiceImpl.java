package com.wuchen.website.service.manager.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wuchen.website.dao.manager.CaseDao;
import com.wuchen.website.service.manager.CaseService;

@Service
public class CaseServiceImpl implements CaseService {
	@Autowired
	private CaseDao caseDao;
	@Override
	public List getCaseList(Map par) {
		return caseDao.getCaseList(par);
	}

	@Override
	public Map getTotalCaseNum(Map par) {
		return caseDao.getTotalCaseNum(par);
	}

	@Override
	public Integer saveCase(Map par) {
		return caseDao.saveCase(par);
	}

	@Override
	public Integer updateCase(Map par) {
		return caseDao.updateCase(par);
	}

	@Override
	public Integer deleteCase(String[] ids) {
		return caseDao.deleteCase(ids);
	}

}
