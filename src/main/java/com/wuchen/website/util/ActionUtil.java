package com.wuchen.website.util;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.wuchen.website.entity.ProductLight;

public class ActionUtil {
	
	/**
	 * @author 一世无辰
	 * @param par
	 * @param parName
	 * @param parValue
	 * @throws UnsupportedEncodingException 
	  * 添加商品时封装参数
	 */
	public static void lightParPackage(ProductLight light, String parName, String parValue) throws UnsupportedEncodingException {
		if ("productNo".equals(parName)) {
			light.setProductNo(new String(parValue.getBytes("iso-8859-1"), "utf-8"));
		} else if ("productName".equals(parName)) {
			light.setProductName(new String(parValue.getBytes("iso-8859-1"), "utf-8"));
		} else if ("reflector".equals(parName)) {
			light.setReflector(new String(parValue.getBytes("iso-8859-1"), "utf-8"));
		} else if ("ceiling".equals(parName)) {
			light.setCeiling(new String(parValue.getBytes("iso-8859-1"), "utf-8"));
		} else if ("lampSource".equals(parName)) {
			light.setLampSource(new String(parValue.getBytes("iso-8859-1"), "utf-8"));
		} else if ("lumenOutput".equals(parName)) {
			light.setLumenOutput(new String(parValue.getBytes("iso-8859-1"), "utf-8"));
		} else if ("colourTemperature".equals(parName)) {
			light.setColourTemperature(new String(parValue.getBytes("iso-8859-1"), "utf-8"));
		} else if ("power".equals(parName)) {
			light.setPower(new String(parValue.getBytes("iso-8859-1"), "utf-8"));
		} else if ("system_efficiency".equals(parName)) {
			light.setSystem_efficiency(new String(parValue.getBytes("iso-8859-1"), "utf-8"));
		} else if ("average_life".equals(parName)) {
			light.setAverage_life(new String(parValue.getBytes("iso-8859-1"), "utf-8"));
		} else if ("CRI".equals(parName)) {
			light.setCRI(new String(parValue.getBytes("iso-8859-1"), "utf-8"));
		} else if ("optimumWorkingTemperature".equals(parName)) {
			light.setOptimumWorkingTemperature(new String(parValue.getBytes("iso-8859-1"), "utf-8"));
		} else if ("heatSink".equals(parName)) {
			light.setHeatSink(new String(parValue.getBytes("iso-8859-1"), "utf-8"));
		} else if ("cable".equals(parName)) {
			light.setCable(new String(parValue.getBytes("iso-8859-1"), "utf-8"));
		} else if ("insulation".equals(parName)) {
			light.setInsulation(new String(parValue.getBytes("iso-8859-1"), "utf-8"));
		} else if ("protection".equals(parName)) {
			light.setProtection(new String(parValue.getBytes("iso-8859-1"), "utf-8"));
		} else if ("productClazz".equals(parName)) {
			light.setProductClazz(new String(parValue.getBytes("iso-8859-1"), "utf-8"));
		} else if ("id".equals(parName)) {
			light.setId(Integer.parseInt(parValue));
		}
	}
	
	/**
	 * @author 一世无辰
	 * @param par
	 * @param parName
	 * @param parValue
	 * @throws UnsupportedEncodingException 
	 * 首页滚动图片添加时获取表单元素
	 */
	public static void getParMap(Map par, String parName, String parValue) throws UnsupportedEncodingException {
		if ("picName".equals(parName)) {
			par.put("picName", new String(parValue.getBytes("iso-8859-1"), "utf-8"));
		} else if ("isShow".equals(parName)) {
			par.put("isShow", parValue);
		} else if ("weight".equals(parName)) {
			par.put("weight", parValue);
		}
	}
	
	/**
	 * @author 一世无辰
	 * @param ids
	 * @return
	 * 返回id数组
	 */
	public static String[] splitArray(String ids) {
		String[] idsList = ids.split(",");
		return idsList;
	}
	
	/**
	 * @author 一世无辰
	 * @param message
	 * @return
	 * 富文本框上传图片出错信息
	 */
	public static Map getError(String message) {
		Map obj = new HashMap();
		obj.put("error", 1);
		obj.put("message", message);
		return obj;
	}
	
	
	/**
	 * @author 一世无辰
	 * @param suffix
	 * @return
	 * .gif,jpeg,jpg,png
	 */
	public static boolean isImg(String suffix) {
		if(".jpg".equals(suffix) || ".jpeg".equals(suffix) || ".gif".equals(suffix) || ".png".equals(suffix)) {
			return true;
		}
		
		return false;
	}
	
}
