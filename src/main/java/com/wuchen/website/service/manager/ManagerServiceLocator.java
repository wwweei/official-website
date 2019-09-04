package com.wuchen.website.service.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ManagerServiceLocator {
	@Autowired
	private ScrollService scrollService;
	@Autowired
	private UserService userService;
	@Autowired
	private CaseService caseService;
	@Autowired
	private ComNewsService comNewsService;
	@Autowired
	private TradeNewsService tradeNewsService;
	@Autowired
	private ProClazzService proClazzService;
	@Autowired
	private ProductLightService productLightService;
	
	
	public ProductLightService getProductLightService() {
		return productLightService;
	}

	public ScrollService getScrollService() {
		return scrollService;
	}

	public UserService getUserService() {
		return userService;
	}

	public CaseService getCaseService() {
		return caseService;
	}

	public ComNewsService getComNewsService() {
		return comNewsService;
	}

	public TradeNewsService getTradeNewsService() {
		return tradeNewsService;
	}

	public ProClazzService getProClazzService() {
		return proClazzService;
	}
	
}
