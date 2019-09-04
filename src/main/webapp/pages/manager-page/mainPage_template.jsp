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
<title>后台主页</title>
<link rel="stylesheet" type="text/css" href="<%=res %>easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=res %>easyui/themes/icon.css">
<script type="text/javascript" src="<%=res %>easyui/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="<%=res %>easyui/jquery.easyui.min.js"></script>

</head>
<body>

<div id="sm" data-toggle="topjui-sidemenu" data-options="data:data">

</div>

</body>
</html>