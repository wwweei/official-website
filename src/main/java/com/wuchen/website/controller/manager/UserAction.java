package com.wuchen.website.controller.manager;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wuchen.website.entity.User;
import com.wuchen.website.util.ActionUtil;
import com.wuchen.website.util.MD5Util;

@Controller
@RequestMapping("userAction")
public class UserAction extends ManagerHTAMLAction {
	@RequestMapping("login")
	public String userLogin(HttpServletRequest request) {
		
		return "/official-website/pages/manager-page/mainPage.jsp";
	}
	@ResponseBody
	@RequestMapping("addUser")
	public Map addUser(HttpServletRequest request) {
		Map json = new HashMap();
		User user = new User();
		Date now = new Date();
		String account = request.getParameter("account");
		String userName = request.getParameter("userName");
		String userPwd = request.getParameter("userPwd");
		String userState = request.getParameter("userState");
		String userStatus = request.getParameter("userStatus");
		user.setAccount(account);
		user.setUserName(userName);
		user.setUserPwd(MD5Util.EncoderByMD5(userPwd));
		user.setUserStatus(userStatus);
		user.setUserState(userState);
		user.setCreateTime(now);
		getManagerServiceLocator().getUserService().addUser(user);
		json.put("msg", "success");
		return json;
	}
	
	@ResponseBody
	@RequestMapping("checkAccount")
	public Map checkAcntExist(HttpServletRequest request) {
		Map json = new HashMap();
		String account = request.getParameter("account");
		json = getManagerServiceLocator().getUserService().checkAcntExist(account);
		return json;
	}
	
	@ResponseBody
	@RequestMapping("allUserList")
	public Map allUserList(HttpServletRequest request) {
		Map toPage = new HashMap();
		List userList = getManagerServiceLocator().getUserService().getUserList();
		toPage.putAll(getManagerServiceLocator().getUserService().getTotalUserNum());
		toPage.put("rows", userList);
		return toPage;
	}
	@ResponseBody
	@RequestMapping("deleteUser")
	public String deleteUser(HttpServletRequest request) {
		String ids = request.getParameter("IDs");
		String[] idList = ids.split(",");
		Integer elRows = getManagerServiceLocator().getUserService().deleteUser(idList);
		if (elRows > 0) {
			return "delete success";
		} else {
			return "delete faild";
		}
	}
	
	@ResponseBody
	@RequestMapping("updateUser")
	public String updateUser(HttpServletRequest request) {
		Map par = new HashMap();
		String id = request.getParameter("ID");
		String userState = request.getParameter("userState");
		String userStatus = request.getParameter("userStatus");
		par.put("id", id);
		par.put("userState", userState);
		par.put("userStatus", userStatus);
		Integer elRows = getManagerServiceLocator().getUserService().updateUser(par);
		if (elRows > 0) {
			return "update success";
		} else {
			return "update faild";
		}
	}
}
