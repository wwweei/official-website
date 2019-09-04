package com.wuchen.website.service.official.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wuchen.website.dao.official.SuccessFulCaseDao;
import com.wuchen.website.service.official.SuccessFulCaseService;

@Service
public class SuccessFulCaseServiceImpl implements SuccessFulCaseService {

	@Autowired
	private SuccessFulCaseDao successFulCaseDao;
	
	@Override
	public List getCaseList(Map par) {
		return successFulCaseDao.getCaseList(par);
	}

}
