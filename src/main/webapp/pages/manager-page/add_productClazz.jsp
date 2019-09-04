<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String res = basePath + "pages/manager-page/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加商品类别</title>
    <link rel="stylesheet" type="text/css" href="<%=res %>easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=res %>easyui/themes/icon.css">
    <script type="text/javascript" src="<%=res %>easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=res %>easyui/jquery.easyui.min.js"></script>
    
    <script type="text/javascript" charset="utf-8" src="<%=res %>kindeditor/kindeditor-all-min.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=res %>kindeditor/lang/zh-CN.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=res %>kindeditor/themes/default/default.css">
    
    <script type="text/javascript">
    	//获取url地址栏中参数
	    function getQueryVariable(){
           	var query = window.location.search.substring(1);
           	if (query == null || query == "") {
           		return null;
           	}
           	var map = new Map();
           	var vars = query.split("&");
	       	for (var i=0;i<vars.length;i++) {
	       	     var pair = vars[i].split("=");
	       	     map.set(pair[0], decodeURI(pair[1]))
	       	}
	       	return map;
	    }
	    
    	function parLoad(){
    		var parMap = getQueryVariable();
    		if (parMap != null) {
    			$('#parentId').textbox('setText', parMap.get('ID'));
    			$('#parentClazzName').textbox('setText', decodeURIComponent(parMap.get('clazzName')));
    		}
    		$('#parentId').textbox('readonly');
    		$('#parentClazzName').textbox('readonly');
    	}
    	
	    function closeWindow(){
			window.close();
		}
        function checkClazz(){
            if ($('#clazzName').val() == null || $('#clazzName').val() == '') {
                alert("请输入类别名称");
                return false;
            }
            return true;
        }
        function saveClazz(){
            if (!checkClazz()) {
            	return ;
            }
            var formData = $('#fr').serialize();
            $.ajax({
            	//几个参数需要注意一下
                type: "POST",//方法类型
                url: "/official-website/proClazz/saveProClazz.action",//url
                data: formData,
                success: function () {
                    alert("成功");
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
<body onload="parLoad()">
    <form name="fr" id="fr" action="#" method="post" style="text-align: center">
    	<div>
            <label for="parentId">父级ID：</label>
            <br/>
            <input name="parentId" id="parentId" class="easyui-textbox" style="width:300px">
        </div>
        <div>
            <label for="parentClazzName">父级类别名：</label>
            <br/>
            <input name="parentClazzName" id="parentClazzName" class="easyui-textbox" style="width:300px">
        </div>
   		<div>
            <label for="clazzName">类别名：</label>
            <br/>
            <input name="clazzName" id="clazzName" class="easyui-textbox" style="width:300px">
        </div>
        <hr>
        <div>
            <input type="button" id="saveBtn" value="确定" onclick="saveClazz();"/>&nbsp;&nbsp;|&nbsp;
            <input type="button" id="cancel" value="取消" onclick="closeWindow();"/>
        </div>
    </form>
</body>
</html>