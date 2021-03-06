package com.wuchen.website.controller.manager;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.jdbc.Blob;
import com.wuchen.website.entity.User;
import com.wuchen.website.util.ActionUtil;

@Controller
@RequestMapping("caseAction")
public class CaseAction extends ManagerHTAMLAction {
	
	@ResponseBody
	@RequestMapping("uploadCasePic")
	public Map casePicUpload(HttpServletRequest request) {
		Date now = new Date();
		Map par = new HashMap();
		
		String imgPath = "pages"+File.separator+"official-website"+File.separator+"images"+File.separator+"casePic"+File.separator;
		String filepath=request.getServletContext().getRealPath("/")+imgPath;
		String fileName = "";
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            List<FileItem> items= upload.parseRequest(request);
            for(FileItem item: items) {
                if(!item.isFormField()) {
            		String suffix = item.getName().substring(item.getName().lastIndexOf("."));
            		if (!ActionUtil.isImg(suffix)) {
            			return ActionUtil.getError("请上传.gif,jpeg,jpg,png格式图片文件。");
            		}
                	SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
            		fileName = "casePic_" + fmt.format(now).toString() + suffix;
                	File file = new File(filepath+fileName);
                	if (!file.createNewFile()) {
                		throw new RuntimeException();
                	}
                    item.write(file);
                    par.put("url", imgPath + fileName);
                }
            }
        } catch (RuntimeException e) {
        	e.printStackTrace();
        	return ActionUtil.getError("上传文件失败。");
        } catch (Exception e) {
        	e.printStackTrace();
        	return ActionUtil.getError("上传文件失败。");
		}
        Map json = new HashMap();
        json.put("error", 0);
        json.put("url", "http://localhost:8080/official-website/"+imgPath + fileName);
		return json;
	}
	
	@ResponseBody
	@RequestMapping("saveCase")
	public String saveCase(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		Map par = new HashMap();
		Date now = new Date();
		String status = request.getParameter("status");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		User user = (User) request.getSession().getAttribute("user");
		par.put("title", title);
		par.put("content", content);
		par.put("status", status);
		par.put("author", 1);
		par.put("saveTime", now);
		Integer id = getManagerServiceLocator().getCaseService().saveCase(par);
		if (id != null && id != 0) {
			return "save success";
		} else {
			return "save faild";
		}
	}
	@ResponseBody
	@RequestMapping("allCaseList")
	public Map allCaseList(HttpServletRequest request) {
		Map toJson = new HashMap();
		Map par = new HashMap();
		int pageNum = Integer.parseInt(request.getParameter("page"));
		int pageSize = Integer.parseInt(request.getParameter("rows"));
		par.put("caseIndex", (pageNum-1)*pageSize);
		par.put("pageSize", pageSize);
		toJson.put("rows", getManagerServiceLocator().getCaseService().getCaseList(par));
		toJson.putAll(getManagerServiceLocator().getCaseService().getTotalCaseNum(par));
		return toJson;
	}
	
	@ResponseBody
	@RequestMapping("updateCase")
	public String updateCase(HttpServletRequest request) {
		Map par = new HashMap();
		String id = request.getParameter("ID");
		String status = request.getParameter("status");
		par.put("id", id);
		par.put("status", status);
		Integer elRow = getManagerServiceLocator().getCaseService().updateCase(par);
		if (elRow > 0) {
			return "update success";
		} else {
			return "update faild";
		}
		
	}
	
	@ResponseBody
	@RequestMapping("deleteCase")
	public String deleteCase(HttpServletRequest request) {
		String ids = request.getParameter("IDs");
		String[] idList = ids.split(",");
		Integer elRow = getManagerServiceLocator().getCaseService().deleteCase(idList);
		if (elRow > 0) {
			return "delete success";
		} else {
			return "delete faild";
		}
	}
}
