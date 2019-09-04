package com.wuchen.website.controller.manager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.wuchen.website.service.manager.ManagerServiceLocator;

@Controller
public class ManagerHTAMLAction {
	@Autowired
	private ManagerServiceLocator managerServiceLocator;

	public ManagerServiceLocator getManagerServiceLocator() {
		return managerServiceLocator;
	}
	
	
}
