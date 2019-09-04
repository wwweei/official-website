package com.wuchen.website.controller.official;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("newsCenterAction")
public class NewsCenterAction extends OfficialHTMLAction {
	
	@RequestMapping("browseNewsDetail")
	public String browseNewsDetail(HttpServletRequest request) {
		String kind = request.getParameter("kind");
		String newsId = request.getParameter("newsId");
		
		Map par = new HashMap();
		
		par.put("kind", kind);
		par.put("newsId", newsId);
		
		Map news = getOfficialServiceLocator().getNewsCenterService().getNewsDetail(par);
		List banner_pic = getOfficialServiceLocator().getIndexService().getMainPic(new HashMap());
		
		request.setAttribute("news", news);
		request.setAttribute("banner_pic", banner_pic);
		
		return "pages/official-website/newsCenter_detail.jsp";
	}
	
	@RequestMapping("getNewsList")
	public String getNewsList(HttpServletRequest request) {
		Map par = new HashMap();
		String kind = request.getParameter("kind");
		
		par.put("kind", kind);
		
		List newsList = getOfficialServiceLocator().getNewsCenterService().getNewsList(par);
		List banner_pic = getOfficialServiceLocator().getIndexService().getMainPic(new HashMap());
		
		request.setAttribute("newsList", newsList);
		request.setAttribute("banner_pic", banner_pic);
		
		return "pages/official-website/newsCenter.jsp";
	}
}
