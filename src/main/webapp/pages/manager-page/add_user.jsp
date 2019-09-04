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
	<title>添加用户</title>
	<link rel="stylesheet" type="text/css" href="<%=res %>easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=res %>easyui/themes/icon.css">
	<script type="text/javascript" src="<%=res %>easyui/jquery.min.js"></script>
	<script type="text/javascript" src="<%=res %>easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript">
	//校验加在控件的失焦事件的时候会导致取值是本次修改之前的值，easyui修改
	
	
	
		function resetFr(){
			$('#account').textbox('setValue','');
			$('#userName').textbox('setValue','');
			$('#userPwd').textbox('setValue', '');
			$('#verfyUserPwd').textbox('setValue', '');
			$('#userStatus').combobox("select", "admin");
			$('#userState').combobox("select", "1");
			$('#acntMsg').text("");
			$('#userNameMsg').text("");
			$('#userPwdMsg').text("");
			$('#verfyUserPwdMsg').text("");
		}
		function checkUserName(){
			//用户名正则2-8位包含字母数字中文字符_
			var pattUserName = /^[0-9a-zA-Z\u4e00-\u9fa5_]{2,8}$/;
			if ($('#userName').textbox('getValue').length > 10){
				$('#userNameMsg').text("用户名太长，最多10位");
				return false;
			}
			if (!pattUserName.test($('#userName').textbox('getValue'))) {
				$('#userNameMsg').text("用户名只能包含字母、数字、中文字符、_");
				return false;
			}
			$('#userNameMsg').text("");
			return true;
		}
		function checkAcnt(){
			//console.log();
			//jq.data("textbox").textbox.find(".textbox-value").val();
			//5-16位数字或字母账号
			var pattAct = /^[a-zA-Z][a-zA-Z0-9_]{4,15}$/;
			//检测账号
			if(4 >= $('#account').textbox('getValue').length){
				$('#acntMsg').text("账号太短，至少5位");
				 alert("请输入账号");
				return false;
			} 
			if ($('#account').textbox('getValue').length >= 17){
				$('#acntMsg').text("账号太长，最多16位");
				 alert("请输入账号");
				return false;
			}
			if (!pattAct.test($('#account').textbox('getValue'))){
				$('#acntMsg').text("请输入正确格式的账号（数字/字母/下划线）且首位必须为字母");
				 alert("请输入正确格式的账号");
				return false;
			} else {
				var flag;
				$.ajax({
					type: "POST",
					url: "/official-website/userAction/checkAccount.action",
					data: {account: $('#account').textbox('getValue')},
					dataType: "json",
					async: false,
					success: function(data) {
						console.log(data.msg);
						if (data.msg == "success") {
							$('#acntMsg').text("");
							flag = true;
						} else if (data.msg == "failed"){
							alert("failed");
							$('#acntMsg').text("账号重复");
							flag = false;
						} else {
							$('#acntMsg').text("不知名错误,请联系后台");
							flag = false;
						}
					},
					error: function(){
						alert("error");
						$('#acntMsg').text("服务器请求错误");
						flag = false;
					}
				});
				return flag;
			}
		}
		function checkPwd(){
			//密码8-16位，必须包括数字和字母（不分大小写） 可以包括特殊符号_   .   *
			var pattPwd = /^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9_\.\*]{8,16}$/;
			//检测账号
			if(7 >= $('#userPwd').textbox('getValue').length){
				$('#userPwdMsg').text("密码太短，至少8位");
				return false;
			} else if ($('#userPwd').textbox('getValue').length >= 17){
				$('#userPwdMsg').text("密码太长，最多16位");
				return false;
			}
			if (!pattPwd.test($('#userPwd').textbox('getValue'))){
				$('#userPwdMsg').text("请输入正确格式的密码（必须包括数字和字母（不分大小写） 可以包括特殊符号_/./*）");
				return false;
			}
			$('#userPwdMsg').text("");
			return true;
		}
		function verfyPwd(){
			if(7 >= $('#verfyUserPwd').textbox('getValue').length || 
						$('#verfyUserPwd').textbox('getValue').length >= 17 ||
							!($('#userPwd').textbox('getValue') == $('#verfyUserPwd').textbox('getValue'))){
				
				if ($('#userPwdMsg').text().length == 0){
					$('#userPwdMsg').text("密码不一致，请检查");
				}
				$('#verfyUserPwdMsg').text("密码不一致，请检查");
				return false;
			}
			$('#verfyUserPwdMsg').text("");
			return true;
		}
		function checkInfo(){
			var flag = true;
			if(!checkAcnt()){
				flag = false;
			}
			if(!checkPwd()) {
				flag = false;
			}
			console.log(flag);
			if(!verfyPwd()) {
				flag = false;
			}
			if(!checkUserName()) {
				flag = false;
			}
			if(!flag) {
				return ;
			}
			var formData = $('#fr').serialize();
			$.ajax({
	            //几个参数需要注意一下
	            type: "POST",//方法类型
	            url: "/official-website/userAction/addUser.action",//url
	            data: formData,
	        	dataType: "json",
	            success: function (data) {
	            	if (data.msg == "success"){
		                alert("成功");
		                window.opener.location.reload();
		                window.close();
	            	} else {
	            		alert("未命名错误");
	            	}
	            },
	            error: function() {
	                alert("异常！");
	            }
	        });
			
		}
	</script>
</head>
<body>
	<form name="fr" id="fr" method="post" action="#" style="margin: auto">
		<table style="margin: auto">
			<tr>
				<td>
					<input name="account" id="account" class="easyui-textbox" data-options="prompt: '请输入账号',  iconCls:'icon-man', events:{}
					" style="width:300px">
				</td>
				<td><div id="acntMsg" style="color: red"></div></td>
			</tr>
			<tr>
				<td>
					<input name="userName" id="userName" class="easyui-textbox" data-options="prompt: '请输入用户名', iconCls:'icon-more',
									 events:{}" style="width:300px" >
				</td>
				<td><div id="userNameMsg" style="color: red"></div></td>
			</tr>
			<tr>
				<td>
					<input name="userPwd" id="userPwd" class="easyui-passwordbox" data-options="prompt: '请输入密码', iconWidth:'28', showEye: true,
					 events:{}" style="width:300px" >
				</td>
				<td><div id="userPwdMsg" style="color: red"></div></td>
			</tr>
			<tr>
				<td>
					<input name="verfyUserPwd" id="verfyUserPwd" class="easyui-passwordbox" data-options="prompt: '请确认密码', iconWidth:'28', showEye: true,
					 events:{}" style="width:300px" >
				</td>
				<td><div id="verfyUserPwdMsg" style="color: red"></div></td>
			</tr>
			<tr>
				<td>
					<label for="userStatus">用户权限：</label>
					<select name="userStatus" id="userStatus" class="easyui-combobox" style="width:200px;">
						<option value="super">超级管理员</option>
						<option value="admin" selected>管理员</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<label for="userState">用户状态：</label>
					<select name="userState" id="userState" class="easyui-combobox" style="width:200px;">
						<option value="1" selected>启用</option>
						<option value="0">不启用</option>
					</select>
				</td>
			</tr>
			<tr style="text-align: center">
				<td>
					<input type="button" id="addBtn" value="添加" onclick="checkInfo();">
					<input type="button" id="resetBtn" value="重置" onclick="resetFr();">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>