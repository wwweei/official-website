package com.wuchen.website.service.official;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class OfficialServiceLocator {
	@Autowired
	private IndexService indexService;

	@Autowired
	private NewsCenterService newsCenterService;
	
	@Autowired
	private LightProductService lightProductService;
	
	@Autowired
	private SuccessFulCaseService successFulCaseService;
	
	public IndexService getIndexService() {
		return indexService;
	}

	public NewsCenterService getNewsCenterService() {
		return newsCenterService;
	}

	public LightProductService getLightProductService() {
		return lightProductService;
	}

	public SuccessFulCaseService getSuccessFulCaseService() {
		return successFulCaseService;
	}
	
	
	
	
	
}
