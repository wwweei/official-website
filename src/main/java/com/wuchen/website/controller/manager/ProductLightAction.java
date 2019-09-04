package com.wuchen.website.controller.manager;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wuchen.website.entity.ProductLight;
import com.wuchen.website.util.ActionUtil;

@Controller
@RequestMapping("lightAction")
public class ProductLightAction extends ManagerHTAMLAction{
	
	@ResponseBody
	@RequestMapping("getLightList")
	public Map getLightList(HttpServletRequest request) {
		Map toPage = new HashMap();
		List LightList = getManagerServiceLocator().getProductLightService().getLightList(new HashMap());
		toPage.put("rows", LightList);
		return toPage;
	}
	
	@RequestMapping("lightDetail")
	public String printLightDetailPanel(HttpServletRequest request) {
		String id = request.getParameter("id");
		ProductLight lightDetail = getManagerServiceLocator().getProductLightService().getLightDetail(id);
		request.setAttribute("lightDetail", lightDetail);
		return "pages/manager-page/lightDetailPanel.jsp";
	}
	
	@ResponseBody
	@RequestMapping("deleteLight")
	public Map deleteLight(HttpServletRequest request) {
		Map toPage = new HashMap();
		String id = request.getParameter("id");
		int fag = getManagerServiceLocator().getProductLightService().deleteLight(id);
		if (fag > 0) {
			toPage.put("msg", "delete success");
		} else if (fag <= 0) {
			toPage.put("msg", "delete failed");
		}
		return toPage;
	}
	
	@ResponseBody
	@RequestMapping("saveLight")
	public Map saveLight(HttpServletRequest request) {
		Date now = new Date();
		ProductLight light = new ProductLight();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
        try {
			List<FileItem> items= upload.parseRequest(request);
			for(FileItem item: items) {
				if(!item.isFormField()) {
					if (item.getName() == null || "".equals(item.getName())) {
						continue;
					}
 					String fieldName = item.getFieldName();
					String imgPath = "";
					String fileName = "";
					String filepath=request.getServletContext().getRealPath("/");
            		String suffix = item.getName().substring(item.getName().lastIndexOf("."));
                	SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
                	
					if ("productPic".equals(fieldName)) {
						imgPath = "pages"+File.separator+"official-website"+File.separator+"images"+File.separator+"productLightPic"+File.separator;
						fileName = "productPic_" + fmt.format(now).toString() + suffix;
						light.setProduct_pic(imgPath + fileName);
					} else if ("productDetailPic".equals(fieldName)) {
						imgPath = "pages"+File.separator+"official-website"+File.separator+"images"+File.separator+"lightDetailPic"+File.separator;
						fileName = "lightDetailPic_" + fmt.format(now).toString() + suffix;
						light.setProduct_detail_pic(imgPath + fileName);
					}
                	File file = new File(filepath + imgPath + fileName);
                	if (!file.createNewFile()) {
                		throw new RuntimeException();
                	}
                    item.write(file);
				}
				if(item.isFormField()){
                	ActionUtil.lightParPackage(light, item.getFieldName(), item.getString());
                }
			}
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        light.setSaveTime(now);
        int fag = getManagerServiceLocator().getProductLightService().saveLight(light);
        Map toPage = new HashMap();
        if (fag > 0) {
			toPage.put("msg", "save success");
		} else if (fag <= 0) {
			toPage.put("msg", "save failed");
		}
		return toPage;
	}
	
	@RequestMapping("getLightforupdate")
	public String getLightforupdate(HttpServletRequest request) {
		String id = request.getParameter("id");
		ProductLight light = getManagerServiceLocator().getProductLightService().getLightDetail(id);
		request.setAttribute("light", light);
		return "pages/manager-page/add_productLight.jsp";
	}
	
	@ResponseBody
	@RequestMapping("updateLight")
	public Map updateLight(HttpServletRequest request) {
		Date now = new Date();
		ProductLight light = new ProductLight();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
        try {
			List<FileItem> items= upload.parseRequest(request);
			for(FileItem item: items) {
				if(!item.isFormField()) {
					if (item.getName() == null || "".equals(item.getName())) {
						continue;
					}
 					String fieldName = item.getFieldName();
					String imgPath = "";
					String fileName = "";
					String filepath=request.getServletContext().getRealPath("/");
            		String suffix = item.getName().substring(item.getName().lastIndexOf("."));
                	SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
                	
					if ("productPic".equals(fieldName)) {
						imgPath = "pages"+File.separator+"official-website"+File.separator+"images"+File.separator+"productLightPic"+File.separator;
						fileName = "productPic_" + fmt.format(now).toString() + suffix;
						light.setProduct_pic(imgPath + fileName);
					} else if ("productDetailPic".equals(fieldName)) {
						imgPath = "pages"+File.separator+"official-website"+File.separator+"images"+File.separator+"lightDetailPic"+File.separator;
						fileName = "lightDetailPic_" + fmt.format(now).toString() + suffix;
						light.setProduct_detail_pic(imgPath + fileName);
					}
                	File file = new File(filepath + imgPath + fileName);
                	if (!file.createNewFile()) {
                		throw new RuntimeException();
                	}
                    item.write(file);
				}
				if(item.isFormField()){
                	ActionUtil.lightParPackage(light, item.getFieldName(), item.getString());
                }
			}
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        int fag = getManagerServiceLocator().getProductLightService().updateLight(light);
        Map toPage = new HashMap();
        if (fag > 0) {
			toPage.put("msg", "update success");
		} else if (fag <= 0) {
			toPage.put("msg", "update failed");
		}
		return toPage;
	}
	
}
