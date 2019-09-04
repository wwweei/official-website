package com.wuchen.website.entity;

import java.util.Date;

public class ProductLight {
	private int id;											//产品唯一标识ID
	private String productName;								//产品名称
	private String productNo;								//产品编号
	private String productClazz;							//产品所属分类
	private String productClazzId;							//产品所属分类id
	private String reflector;								//反射器
	private String ceiling;									//天花板开孔
	private String lampSource;								//光源
	private String lumenOutput;								//流明输出
	private String colourTemperature;						//色温
	private String power;									//功率
	private String system_efficiency;						//系统效率
	private String average_life;							//平均寿命
	private String CRI;										//显色指数
	private String optimumWorkingTemperature;				//最佳工作温度
	private String heatSink;								//散热器
	private String cable;									//电缆
	private String insulation;								//绝缘
	private String protection;								//保护
	private String product_pic;								//商品图片
	private String product_detail_pic;						//商品尺寸图片
	private Date saveTime;									//保存时间
	
	
	
	public String getProductClazzId() {
		return productClazzId;
	}
	public void setProductClazzId(String productClazzId) {
		this.productClazzId = productClazzId;
	}
	public String getProduct_pic() {
		return product_pic;
	}
	public void setProduct_pic(String product_pic) {
		this.product_pic = product_pic;
	}
	public String getProduct_detail_pic() {
		return product_detail_pic;
	}
	public void setProduct_detail_pic(String product_detail_pic) {
		this.product_detail_pic = product_detail_pic;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProductName() {
		return productName == null ? "":productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getProductNo() {
		return productNo == null ? "" : productNo;
	}
	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}
	public String getReflector() {
		return reflector == null ? "" : reflector;
	}
	public void setReflector(String reflector) {
		this.reflector = reflector;
	}
	public String getCeiling() {
		return ceiling==null ? "" : ceiling;
	}
	public void setCeiling(String ceiling) {
		this.ceiling = ceiling;
	}
	public String getLampSource() {
		return lampSource == null ? "" : lampSource;
	}
	public void setLampSource(String lampSource) {
		this.lampSource = lampSource;
	}
	public String getLumenOutput() {
		return lumenOutput == null ? "" : lumenOutput;
	}
	public void setLumenOutput(String lumenOutput) {
		this.lumenOutput = lumenOutput;
	}
	public String getColourTemperature() {
		return colourTemperature == null ? "" : colourTemperature;
	}
	public void setColourTemperature(String colourTemperature) {
		this.colourTemperature = colourTemperature;
	}
	public String getPower() {
		return power == null ? "" : power;
	}
	public void setPower(String power) {
		this.power = power;
	}
	public String getSystem_efficiency() {
		return system_efficiency == null ? "" : system_efficiency;
	}
	public String getProductClazz() {
		return productClazz == null ? "" : productClazz;
	}
	public void setProductClazz(String productClazz) {
		this.productClazz = productClazz;
	}
	public String getAverage_life() {
		return average_life == null ? "" : average_life;
	}
	public void setAverage_life(String average_life) {
		this.average_life = average_life;
	}
	public void setSystem_efficiency(String system_efficiency) {
		this.system_efficiency = system_efficiency;
	}
	public String getCRI() {
		return CRI == null ? "" : CRI;
	}
	public void setCRI(String cRI) {
		CRI = cRI;
	}
	public String getOptimumWorkingTemperature() {
		return optimumWorkingTemperature == null ? "" : optimumWorkingTemperature;
	}
	public void setOptimumWorkingTemperature(String optimumWorkingTemperature) {
		this.optimumWorkingTemperature = optimumWorkingTemperature;
	}
	public String getHeatSink() {
		return heatSink == null ? "" : heatSink;
	}
	public void setHeatSink(String heatSink) {
		this.heatSink = heatSink;
	}
	public String getCable() {
		return cable == null ? "" : cable;
	}
	public void setCable(String cable) {
		this.cable = cable;
	}
	public String getInsulation() {
		return insulation == null ? "" : cable;
	}
	public void setInsulation(String insulation) {
		this.insulation = insulation;
	}
	public String getProtection() {
		return protection == null ? "" : protection;
	}
	public void setProtection(String protection) {
		this.protection = protection;
	}
	public Date getSaveTime() {
		return saveTime;
	}
	public void setSaveTime(Date saveTime) {
		this.saveTime = saveTime;
	}
	
	
	
}
