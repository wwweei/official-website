package com.wuchen.website.controller.official;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.wuchen.website.service.official.OfficialServiceLocator;

@Controller
public class OfficialHTMLAction {
	
	@Autowired
	private OfficialServiceLocator officialServiceLocator;

	public OfficialServiceLocator getOfficialServiceLocator() {
		return officialServiceLocator;
	}
	
	
}
