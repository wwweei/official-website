<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="com.wuchen.website.entity.ProductLight" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String res = basePath + "pages/manager-page/";
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
ProductLight lightDetail = (ProductLight)request.getAttribute("lightDetail");

	out.print("		<table class=\"dv-table\" border=\"0\" style=\"width:100%;\">																							");
	out.print("			<tr>																																				");
	out.print("				<td rowspan=\"7\" style=\"width:120px\">"+ "<img src=\" "+ lightDetail.getProduct_pic() + " \"  alt=\"实物图\" />" +"</td>							");
	out.print("				<td rowspan=\"7\" style=\"width:120px\">"+"<img src=\" "+ lightDetail.getProduct_detail_pic() + " \"  alt=\"比例尺寸图\" />"+"</td>				");
	
	out.print("				<td class=\"dv-label\" >商品ID:</td>																												");
	out.print("				<td>"+lightDetail.getId()+"</td>																												");
	out.print("				<td class=\"dv-label\" >商品名称:</td>																											");
	out.print("				<td>"+lightDetail.getProductName()+"</td>																										");
	out.print("				<td class=\"dv-label\" >商品编号:</td>																											");
	out.print("				<td>"+lightDetail.getProductNo()+"</td>																											");

	out.print("			</tr>																																				");

	out.print("			<tr>																																				");
	out.print("				<td class=\"dv-label\" >商品分类:</td>																											");
	out.print("				<td>"+lightDetail.getProductClazz()+"</td>																										");
	out.print("				<td class=\"dv-label\" >反射器:</td>																												");
	out.print("				<td>"+lightDetail.getReflector()+"</td>																											");
	out.print("				<td class=\"dv-label\" >天花板开孔:</td>																											");
	out.print("				<td>"+lightDetail.getCeiling()+"</td>																											");
	out.print("			</tr>																																				");
	
	out.print("			<tr>																																				");
	out.print("				<td class=\"dv-label\" >光源:</td>																												");
	out.print("				<td>"+lightDetail.getLampSource()+"</td>																										");
	out.print("				<td class=\"dv-label\" >流明输出:</td>																											");
	out.print("				<td>"+lightDetail.getLumenOutput()+"</td>																										");
	out.print("				<td class=\"dv-label\" >色温:</td>																												");
	out.print("				<td>"+lightDetail.getColourTemperature()+"</td>																									");
	out.print("			</tr>																																				");
	
	out.print("			<tr>																																				");
	out.print("				<td class=\"dv-label\" >功率:</td>																												");
	out.print("				<td>"+lightDetail.getPower()+"</td>																												");
	out.print("				<td class=\"dv-label\" >系统效率:</td>																											");
	out.print("				<td>"+lightDetail.getSystem_efficiency()+"</td>																									");
	out.print("				<td class=\"dv-label\" >平均寿命:</td>																											");
	out.print("				<td>"+lightDetail.getAverage_life()+"</td>																										");
	out.print("			</tr>																																				");

	out.print("			<tr>																																				");
	out.print("				<td class=\"dv-label\" >显色指数:</td>																											");
	out.print("				<td>"+lightDetail.getCRI()+"</td>																												");
	out.print("				<td class=\"dv-label\" >最佳工作温度:</td>																										");
	out.print("				<td>"+lightDetail.getOptimumWorkingTemperature()+"</td>																							");
	out.print("				<td class=\"dv-label\" >散热器:</td>																												");
	out.print("				<td>"+lightDetail.getHeatSink()+"</td>																											");
	out.print("			</tr>																																				");

	out.print("			<tr>																																				");
	out.print("				<td class=\"dv-label\" >电缆:</td>																												");
	out.print("				<td>"+lightDetail.getCable()+"</td>																												");
	out.print("				<td class=\"dv-label\" >绝缘:</td>																												");
	out.print("				<td>"+lightDetail.getInsulation()+"</td>																										");
	out.print("				<td class=\"dv-label\" >保护:</td>																												");
	out.print("				<td>"+lightDetail.getProtection()+"</td>																										");
	out.print("			</tr>																																				");

	out.print("			<tr>																																				");
	out.print("				<td class=\"dv-label\" >保存时间:</td>																											");
	out.print("				<td>"+sdf.format(lightDetail.getSaveTime())+"</td>																								");
	out.print("			</tr>																																				");
	
	out.print("		</table>																																				");

%>