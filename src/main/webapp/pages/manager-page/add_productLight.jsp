<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.wuchen.website.entity.ProductLight" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String res = basePath + "pages/manager-page/";
ProductLight light = (ProductLight)request.getAttribute("light");
String method = request.getParameter("method");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加商品</title>
    <link rel="stylesheet" type="text/css" href="<%=res %>easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=res %>easyui/themes/icon.css">
    <script type="text/javascript" src="<%=res %>easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=res %>easyui/jquery.easyui.min.js"></script>
    
    <script type="text/javascript" charset="utf-8" src="<%=res %>kindeditor/kindeditor-all-min.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=res %>kindeditor/lang/zh-CN.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=res %>kindeditor/themes/default/default.css">
    
    <script type="text/javascript">
    	function closeWindow(){
    		window.close();
    	}
    
    	function formReset(){
            $('#fr').form('reset');
    	}

        function checkTitle(){
            if ($('#title').val() == null || $('#title').val() == '') {
                alert("请输入标题");
                return false;
            }
            return true;
        }
        function saveProduct(){
            var from = document.getElementById("fr");
            var formData = new FormData(from);
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                url: "/official-website/lightAction/saveLight.action",//url 
                data: formData,
                processData: false,  
                contentType: false,
                success: function (data) {
                    alert(data.msg);
                    window.opener.location.reload();
                    window.close();
                },
                error: function() {
                    alert("异常！");
                }
            });
        }
        
        function updateProduct(){
            var from = document.getElementById("fr");
            var formData = new FormData(from);
            var id = $('#id').val();
            formData.append("id", id);
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                url: "/official-website/lightAction/updateLight.action",//url
                data: formData,
                processData: false,  
                contentType: false,
                success: function (data) {
                    alert(data.msg);
                    window.opener.location.reload();
                    window.close();
                },
                error: function() {
                    alert("异常！");
                }
            });
        }
    </script>
</head>
<body>
    <form name="fr" id="fr" action="#" method="POST" enctype="multipart/form-data">
		<table style="margin: auto">
			<tr>
				<td align="right" width="150px">
					<label for="productNo">商品编号：</label>
				</td>
				<td align="left">
					<input value="<%=light != null?light.getProductNo() : "" %>" name="productNo" id="productNo" class="easyui-textbox"
						data-options="events:{}" style="width:150px" >
				</td>
				
				<td align="right" width="150px">
					<label for="productName">商品名称：</label>
				</td>
				<td align="left">
					<input value="<%=light != null?light.getProductName():"" %>" name="productName" id="productName" class="easyui-textbox" 
						data-options="events:{}" style="width:150px" >
				</td>
			</tr>
			
			<tr>
				<td align="right">
					<label for="reflector">反射器：</label>
				</td>
				<td align="left">
					<input value="<%=light != null?light.getReflector():"" %>" name="reflector" id="reflector" class="easyui-textbox" 
						data-options="events:{}" style="width:150px" >
				</td>
				
				<td align="right">
					<label for="ceiling">天花板开孔：</label>
				</td>
				<td align="left">
					<input value="<%=light != null?light.getCeiling():"" %>" name="ceiling" id="ceiling" class="easyui-textbox"
						data-options="events:{}" style="width:150px" >
				</td>
			</tr>
			
			<tr>
				<td align="right">
					<label for="lampSource">光源：</label>
				</td>
				<td align="left">
					<input value="<%=light != null?light.getLampSource():"" %>" name="lampSource" id="lampSource" class="easyui-textbox" 
						data-options="events:{}" style="width:150px" >
				</td>
				
				<td align="right">
					<label for="lumenOutput">流明输出：</label>
				</td>
				<td align="left">
					<input value="<%=light != null?light.getLumenOutput():"" %>" name="lumenOutput" id="lumenOutput" class="easyui-textbox"
						data-options="events:{}" style="width:150px" >
				</td>
			</tr>
			
			<tr>
				<td align="right">
					<label for="colourTemperature">色温：</label>
				</td>
				<td align="left">
					<input value="<%=light != null?light.getColourTemperature():"" %>" name="colourTemperature" id="colourTemperature" class="easyui-textbox" 
						data-options="events:{}" style="width:150px" >
				</td>
				
				<td align="right">
					<label for="power">功率：</label>
				</td>
				<td align="left">
					<input value="<%=light != null?light.getPower():"" %>" name="power" id="power" class="easyui-textbox" 
						data-options="events:{}" style="width:150px" >
				</td>
			</tr>
			
			<tr>
				<td align="right">
					<label for="system_efficiency">系统效率：</label>
				</td>
				<td align="left">
					<input value="<%=light != null?light.getSystem_efficiency():"" %>" name="system_efficiency" id="system_efficiency" class="easyui-textbox" 
					data-options="events:{}" style="width:150px" >
				</td>
				
				<td align="right">
					<label  for="average_life">平均寿命：</label>
				</td>
				<td align="left">
					<input value="<%=light != null?light.getAverage_life():"" %>" name="average_life" id="average_life" class="easyui-textbox" 
						data-options="events:{}" style="width:150px" >
				</td>
			</tr>
			
			<tr>
				<td align="right">
					<label for="CRI">显色指数：</label>
				</td>
				<td align="left">
					<input value="<%=light != null?light.getCRI():"" %>" name="CRI" id="CRI" class="easyui-textbox" 
						data-options="events:{}" style="width:150px" >
				</td>
				
				<td align="right">
					<label for="optimumWorkingTemperature">最佳工作温度：</label>
				</td>
				<td align="left">
					<input value="<%=light != null?light.getOptimumWorkingTemperature():"" %>" name="optimumWorkingTemperature" id="optimumWorkingTemperature" class="easyui-textbox"
						data-options="events:{}" style="width:150px" >
				</td>
			</tr>
			
			<tr>
				<td align="right">
					<label for="heatSink">散热器：</label>
				</td>
				<td align="left">
					<input value="<%=light != null?light.getHeatSink():"" %>" name="heatSink" id="heatSink" class="easyui-textbox" 
						data-options="events:{}" style="width:150px" >
				</td>
				
				<td align="right">
					<label for="cable">电缆：</label>
				</td>
				<td align="left">
					<input value="<%=light != null?light.getCable():"" %>" name="cable" id="cable" class="easyui-textbox" 
						data-options="events:{}" style="width:150px" >
				</td>
			</tr>
			
			<tr>
				<td align="right">
					<label for="insulation">绝缘：</label>
				</td>
				<td align="left">
					<input value="<%=light != null?light.getInsulation():"" %>" name="insulation" id="insulation" class="easyui-textbox" 
						data-options="events:{}" style="width:150px" >
				</td>
				
				<td align="right">
					<label for="protection">保护：</label>
				</td>
				<td align="left">
					<input value="<%=light != null?light.getProtection():"" %>" name="protection" id="protection" class="easyui-textbox" 
						data-options="events:{}" style="width:150px" >
				</td>
			</tr>
			
			<tr>
				<td align="right">
					<label for="productPic">实物图限：</label>
				</td>
				<td align="left">
					<input name="productPic" id="productPic" class="easyui-filebox" style="width:150px" 
						data-options="accept:'image/gif,image/jpeg,image/png'">
				</td>
				<td align="right">
					<label for="productDetailPic">比例尺寸图：</label>
				</td>
				<td align="left">
					<input name="productDetailPic" id="productDetailPic" class="easyui-filebox" style="width:150px" 
						data-options="accept:'image/gif,image/jpeg,image/png'">
				</td>
				
			</tr>
			<%if (light != null ) {%>
			<script type="text/javascript">
				console.log('111');
				$('#productClazz').ready(function (){
					$('#productClazz').combotree('setValue','<%=light.getProductClazzId()%>');
				});
				$('#productPic').ready(function (){
					$('#productPic').filebox({prompt:'<%=light.getProduct_pic() %>'});
				});
				$('#productDetailPic').ready(function (){
					$('#productDetailPic').filebox({prompt:'<%=light.getProduct_detail_pic() %>'});
				});
				
				
			</script>
			<tr>
				<td align="center" colspan="2">
				<input type="text" id="id" name="id" value="<%=light.getId()%>" hidden/>
					<img width="150px" alt="实物图限" src="<%=basePath+light.getProduct_pic() %>">
				</td>
				<td align="center" colspan="2">
					<img width="150px" alt="比例尺寸图" src="<%=basePath+light.getProduct_detail_pic() %>">
				</td>
			</tr>
			<%} %>
			<tr style="text-align: center">
				<td align="right">
					<label for="productClazz">商品分类：</label>
				</td>
				<td align="left">
					<select required="true" name="productClazz" id="productClazz" class="easyui-combotree" url="/official-website/proClazz/getClazzList.action"  style="width:156px;">
					</select>
				</td>
			</tr>
			<tr style="text-align: center">
				<td align="center" colspan="4">
				<br/>
					<%if ("update".equals(method)) { %>
					<input type="button" id="updateBtn" value="修改" onclick="updateProduct();">
					<%} else{ %>
					<input type="button" id="addBtn" value="添加" onclick="saveProduct();">
					<%} %>
					<input type="button" id="resetBtn" value="重置" onclick="formReset();">
				</td>
			</tr>
			
		</table>
    </form>
</body>
</html>