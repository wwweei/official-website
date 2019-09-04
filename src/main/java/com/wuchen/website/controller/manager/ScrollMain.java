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

import com.wuchen.website.entity.User;
import com.wuchen.website.util.ActionUtil;

@Controller
@RequestMapping("scroll")
public class ScrollMain extends ManagerHTAMLAction{
	
	@ResponseBody
	@RequestMapping("allScroll")
	public Map getScrollPicList(HttpServletRequest request) {
		List picList = getManagerServiceLocator().getScrollService().getScrollPic(new HashMap());
		String total = getManagerServiceLocator().getScrollService().getTotalPicSize();
		Map toPage = new HashMap();
		toPage.put("rows", picList);
		toPage.put("total", total);
		return toPage;
	}
	
	@ResponseBody
	@RequestMapping("ajaxPicUrl")
	public Map ajaxGetPicUrl(HttpServletRequest request) {
		String id = request.getParameter("ID");
		Map url = getManagerServiceLocator().getScrollService().getPicUrl(id);
		return url;
	}
	
	@ResponseBody
	@RequestMapping("updatePic")
	public String ajaxUpdatePic(HttpServletRequest request) {
		String id = request.getParameter("ID");
		String picName = request.getParameter("picName");
		String isShow = request.getParameter("isShow");
		String weight = request.getParameter("weight");
		
		Map par = new HashMap();
		par.put("id", id);
		par.put("picName", picName);
		par.put("isShow", isShow);
		par.put("weight", weight);
		
		getManagerServiceLocator().getScrollService().updatePic(par);
		
		return "update success";
	}
	
	@ResponseBody
	@RequestMapping("addPic")
	public String addPic(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		User user = new User();
		user.setUserName("admin");
		request.getSession().setAttribute("user", user);
		
		
		Date now = new Date();
		Map par = new HashMap();
        DiskFileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);
        try {
            List<FileItem> items= upload.parseRequest(request);
            for(FileItem item: items) {
                if(!item.isFormField()) {
                	String imgPath = "pages"+File.separator+"official-website"+File.separator+"images"+File.separator+"scrollPic"+File.separator;
            		String filepath=request.getServletContext().getRealPath("/")+imgPath;
            		String suffix = item.getName().substring(item.getName().lastIndexOf("."));
                	SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
            		String fileName = "scrollPic_" + fmt.format(now).toString() + suffix;
                	File file = new File(filepath+fileName);
                	if (!file.createNewFile()) {
                		throw new RuntimeException();
                	}
                    item.write(file);
                    par.put("url", imgPath + fileName);
                }
                if(item.isFormField()){
                	ActionUtil.getParMap(par, item.getFieldName(), item.getString());
                }
            }
        } catch (RuntimeException e) {
        	e.printStackTrace();
        	return "不可描述的错误导致上传失败";
        } catch (Exception e) {
        	e.printStackTrace();
        	return "添加失败，请联系";
		}
        par.put("author", request.getSession().getAttribute("user"));
        par.put("pageName", "index");
        par.put("className", "banner_pic");
        par.put("saveTime", now);
        getManagerServiceLocator().getScrollService().addPic(par);
        return "添加成功";
	}
	
	@ResponseBody
	@RequestMapping("deletePic")
	public String deletePic(HttpServletRequest request) {
		String ids = request.getParameter("IDs");
		String[] idList = ActionUtil.splitArray(ids);
		getManagerServiceLocator().getScrollService().deletePic(idList);
		return "delete success";
	}
}

