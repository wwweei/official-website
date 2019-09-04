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
    <title>添加案例</title>
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
            editor.html("");
            $('#fr').form('reset');
    	}

        function checkTitle(){
            if ($('#title').val() == null || $('#title').val() == '') {
                alert("请输入标题");
                return false;
            }
            return true;
        }
        function saveCase(fag){
        	//kindeditor需要先同步后才能获取到html
        	editor.sync();
        	//var from = document.getElementById("fr");
            //var formData = new FormData(from);
            //alert($('#title').val());
            if ($('#title').val() == null || $('#title').val() == '') {
            	alert("请输入标题");
            	return ;
            }
            $('#status').val(fag);
            //表单提交不含文件类型用$('#').serialize()获得表单元素
        	var formData = $('#fr').serialize();
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                url: "/official-website/caseAction/saveCase.action",//url
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
    <script>
        KindEditor.ready(function(K) {
	        	var options = {
		                filterMode : true,
		                uploadJson: '/official-website/caseAction/uploadCasePic.action',//指定上传图片的服务器端程序
		                //fileManagerJson: '/official-website/caseAction/uploadCasePic.action',//指定浏览远程图片的服务器端程序
		                allowFileManager: false,
		                height: '700px',
                        width: '680px',
                        items: [
                    		'source', '|', 'undo', 'redo', '|', 'preview', 'print', 'template', 'cut', 'copy', 'paste',
                    		'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
                    		'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
                    		'superscript', 'clearhtml', 'quickformat', 'selectall', '|', 'fullscreen', '/',
                    		'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
                    		'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'image', 'multiimage',
                    		'table', 'hr', 'emoticons', 'baidumap', 'pagebreak',
                    		'anchor', 'link', 'unlink', '|', 'about'
                    	]
                };
                window.editor = K.create('#content', options);
         });
    </script>
</head>
<body>
    <form name="fr" id="fr" action="#" method="post" style="text-align: center">
   		<div>
            <label for="title"><font color="red">*</font>标题：</label>
            <br/>
            <input name="title" id="title" class="easyui-textbox" style="width:300px">
            <input name="status" id="status" type="text" style="display:none">
        </div>
        
        <div>
            <label for="content">详细内容：</label>
            <br/>
            <center>
                <textarea id="content" name="content"></textarea>
            </center>
        </div>
        <hr>
        <div>
            <input type="button" id="publishBtn" value="发表" onclick="saveCase('1');"/>&nbsp;&nbsp;|&nbsp;
            <input type="button" id="saveBtn" value="保存" onclick="saveCase('0');"/>&nbsp;&nbsp;|&nbsp;
            <input type="button" id="resetBtn" value="重置" onclick="formReset();"/>&nbsp;&nbsp;|&nbsp;
            <input type="button" id="cancel" value="取消" onclick="closeWindow();"/>
        </div>
    </form>
</body>
</html>