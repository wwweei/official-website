package com.wuchen.website.controller.official;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wuchen.website.entity.ProductLight;
import com.wuchen.website.util.ActionUtil;

@Controller
@RequestMapping("productLightAction")
public class LightProductAction extends OfficialHTMLAction{
	@ResponseBody
	@RequestMapping("getBanner")
	public List getBanner(HttpServletRequest request) {
		List banner = getOfficialServiceLocator().getIndexService().getMainPic(new HashMap());
		return banner;
	}
	
	@ResponseBody
	@RequestMapping("getProductClazz")
	public List getProductClazz(HttpServletRequest request) {
		
		List menuTree = getOfficialServiceLocator().getLightProductService().getProductMenuTree();
		
		return menuTree;
	}
	
	@ResponseBody
	@RequestMapping("getProductListList")
	public List getProductLightList(HttpServletRequest request) {
		Map par = new HashMap();
		String clazzIds = request.getParameter("clazzIds");
		String[] clazzIdList = clazzIds == null ? null : ActionUtil.splitArray(clazzIds);
		par.put("clazzIdList", clazzIdList);
		List lightList = getOfficialServiceLocator().getLightProductService().getProductLightList(par);
		return lightList;
	}
	
	@ResponseBody
	@RequestMapping("getLightDetail")
	public ProductLight getLightDetail(HttpServletRequest request) {
		Map par = new HashMap();
		String id = request.getParameter("productId");
		par.put("id", id);
		ProductLight lightList = getOfficialServiceLocator().getLightProductService().getLightDetail(par);
		return lightList;
	}
	
}
