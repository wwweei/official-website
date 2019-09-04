package com.wuchen.website.controller.official;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("successCaseAction")
public class SuccessFulCaseAction extends OfficialHTMLAction {
	
	@RequestMapping("successfulList")
	public String getSuccessCaseList(HttpServletRequest request) {
		Map bannerPar = new HashMap();
		Map casePar = new HashMap();
		
		List banner_pic = getOfficialServiceLocator().getIndexService().getMainPic(bannerPar);
		List caseList = getOfficialServiceLocator().getSuccessFulCaseService().getCaseList(casePar);
		
		request.setAttribute("banner_pic", banner_pic);
		request.setAttribute("caseList", caseList);
		
		return "pages/official-website/successfulCase.jsp";
	}
}
