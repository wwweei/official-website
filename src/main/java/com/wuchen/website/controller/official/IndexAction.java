package com.wuchen.website.controller.official;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wuchen.website.util.OutputResUtil;

@Controller
@RequestMapping("indexAction")
public class IndexAction extends OfficialHTMLAction{
	
	@RequestMapping("index")
	public String indexDraw(HttpServletRequest request, HttpServletResponse response) {
		Map mainPic = new HashMap();
		List banner_pic;
		
		mainPic.put("pageName", "index");
		mainPic.put("className", "banner_pic");
		banner_pic = getOfficialServiceLocator().getIndexService().getMainPic(mainPic);
		
		
		
		Map news = new HashMap();
		List comNewList = getOfficialServiceLocator().getIndexService().getComNews(news);
		List tradeNewList = getOfficialServiceLocator().getIndexService().getTradeNews(news);
		List product_light = getOfficialServiceLocator().getLightProductService().getLightListForIndex();
		
		request.setAttribute("banner_pic", banner_pic);
		request.setAttribute("comNewList", comNewList);
		request.setAttribute("tradeNewList", tradeNewList);
		request.setAttribute("lightList", product_light);
		return "pages/official-website/index.jsp";
	}
	
	@RequestMapping("test")
	public void toHtml(HttpServletRequest request, HttpServletResponse response) {
		OutputResUtil opr = new OutputResUtil();
		String fileName = "index";
		
		String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/indexAction/index.do";
		
		opr.getJspToHtml(url, fileName) ;
	}
	
	@RequestMapping("init")
	public String webInit(HttpServletRequest request, HttpServletResponse response) {
		
		toHtml(request, response);
		
		return "pages/official-website/index.html";
	}
	
}
 