package com.wuchen.website.controller.manager;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wuchen.website.util.ActionUtil;

@Controller
@RequestMapping("proClazz")
public class ProClazzAction extends ManagerHTAMLAction {

	@ResponseBody
	@RequestMapping("getClazzMap")
	public Map getClazzMap(HttpServletRequest request) {
		Map toPage = new HashMap();
		List proClazzList = getManagerServiceLocator().getProClazzService().getProClazzList();
		toPage.put("rows", proClazzList);
		return toPage;
	}
	
	@ResponseBody
	@RequestMapping("saveProClazz")
	public void saveProClazz(HttpServletRequest request) {
		 String parentId = request.getParameter("parentId");
		 String clazzName = request.getParameter("clazzName");
		 Date now = new Date();
		 Map par = new HashMap();
		 par.put("parentId", parentId);
		 par.put("clazzName", clazzName);
		 par.put("saveTime", now);
		 getManagerServiceLocator().getProClazzService().saveProClazz(par);;
	}
	
	@ResponseBody
	@RequestMapping("deleteProClazz")
	public void deleteProClazz(HttpServletRequest request) {
		 String ids = request.getParameter("ids");
		 String[] idList = ActionUtil.splitArray(ids);
		 getManagerServiceLocator().getProClazzService().deleteProClazz(idList);;
	}
	
	/**
	 * @author 一世无辰
	 * @param request
	 * @return
	 * 添加商品页面时查询商品分类
	 */
	@ResponseBody
	@RequestMapping("getClazzList")
	public List getClazzList(HttpServletRequest request) {
		Map toPage = new HashMap();
		List proClazzList = getManagerServiceLocator().getProClazzService().getProClazzListForAddLight();
		return proClazzList;
	}
}
