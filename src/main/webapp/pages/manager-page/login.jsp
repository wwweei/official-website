<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String res = basePath + "pages/manager-page/";
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="<%=res %>easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=res %>easyui/themes/icon.css">
    <script type="text/javascript" src="<%=res %>easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=res %>easyui/jquery.easyui.min.js"></script>
<title>登录</title>
</head>
<body>
	<form name="fr" id="fr" method="post" action="#" style="text-align: center">
		<div>
			<input class="easyui-textbox" data-options="iconCls:'icon-search'" style="width:300px">
	 	</div>
	 	<div>
			<input class="easyui-textbox" data-options="iconCls:'icon-search', type: 'password'" style="width:300px">
	 	</div>
	 	<div>
	 		<input type="submit" name="loginBtn">
	 		<input type="button" name="resetBtn" onclick="javascript:$('#resetBtn').click(function(){$('#fr').form('reset')});">
	 	</div>
	</form>
</body>
</html>