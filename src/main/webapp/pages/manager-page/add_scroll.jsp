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
    <title>添加主页滚动广告</title>
    <link rel="stylesheet" type="text/css" href="<%=res %>easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=res %>easyui/themes/icon.css">
    <script type="text/javascript" src="<%=res %>easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=res %>easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript">
    function photoCheck(){
        var ff = $('#pic').textbox('getText');
       	alert(ff);

        if (ff == null || ff == ""){
            alert('请选择文件');
            return ;
        } else if(!/.(gif|jpg|jpeg|png|gif|jpg|png)$/.test(ff)) {
            alert("图片类型必须是.gif,jpeg,jpg,png中的一种");
            return ;
        }
       
        var from = document.getElementById("fr");
        var formData = new FormData(from);
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            url: "/official-website/scroll/addPic.action",//url
            data: formData,
            processData: false,
            contentType: false,
            success: function () {
                alert("成功");
                window.opener.location.reload();
                window.close();
            },
            error: function() {
                alert("异常！");
            }
        });
        // document.fr.submit();
    }
    </script>
</head>
<body>
    <form name="fr" id="fr" action="/official-website/scroll/addPic.action" method="post" enctype="multipart/form-data">
        <div>
            <label for="picName">图片别名：</label>
            <br/>
            <input name="picName" id="picName" class="easyui-textbox" style="width:300px">
        </div>
        <div>
            <label for="isShow">是否显示：</label>
            <br/>
            <select name="isShow" id="isShow" class="easyui-combobox" name="dept" style="width:200px;">
                <option value="1">是</option>
                <option value="0">否</option>
            </select>
        </div>
        <div>
            <label for="weight">显示权重：</label>
            <br/>
            <input name="weight" id="weight" class="easyui-numberbox" style="width:300px" data-optin="min=0, precision:0">
        </div>
        <div>
            <label for="pic">选择图片:</label>
            <br/>
            <input name="pic" id="pic" class="easyui-filebox" style="width:300px">
        </div>
        <hr>
        <div style="text-align: center">
            <input type="button" id="send" value="提交" onclick="photoCheck();"/>
            <input type="button" id="cancel" value="重置" onclick="javascript:$('#cancel').click(function(){$('#fr').form('reset')});"/>
        </div>
    </form>
</body>
</html>