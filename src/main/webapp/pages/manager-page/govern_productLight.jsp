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
    <meta charset="UTF-8">
    <title>商品管理</title>
    <link rel="stylesheet" type="text/css" href="<%=res %>easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=res %>easyui/themes/icon.css">
    <script type="text/javascript" src="<%=res %>easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=res %>easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="<%=res %>easyui/plugins/datagrid-detailview.js"></script>
    <script type="text/javascript">
    function openUpdatePage(id){
        var wWidth = 700;
        var wHeight = 900;
        var wTop = (window.screen.availHeight - 30 - wHeight) / 2;
        var wLeft = (window.screen.availWidth - 10 - wWidth) / 2; 
        window.open('/official-website/lightAction/getLightforupdate.action?id=' + id +'&method=update', "_blank", "scrollbars=yes,resizable=1,modal=false,alwaysRaised=yes,height="+wHeight+"px, width="+wWidth+"px, top="+wTop+"px, left=" + wLeft + "px");
    }
    function collapseAll(){
		$('#dg').datagrid('collapseAll');
	}
    
	function expandAll(){
		$('#dg').datagrid('expandAll');
	}
	
	function deleteRow(id){
		if (id == null || id == ''){
			var row = $('#dg').datagrid('getSelected');
			id = row.id;
		}
        $.messager.confirm('确认删除？','确认删除？',function(r){
            if (r){
                $.ajax({
                	method: "get",
                	url: "/official-website/lightAction/deleteLight.action?id=" + id,
                	success: function(data) {
                		alert(data.msg);
                		window.location.reload();
                	}
                })
            }
      	 });
   	}
	
	function addLight(){
		var wWidth = 700;
        var wHeight = 900;
        var wTop = (window.screen.availHeight - 30 - wHeight) / 2;
        var wLeft = (window.screen.availWidth - 10 - wWidth) / 2; 
        window.open('add_productLight.jsp?method=add', "_blank", "scrollbars=yes,resizable=1,modal=false,alwaysRaised=yes,height="+wHeight+"px, width="+wWidth+"px, top="+wTop+"px, left=" + wLeft + "px");

	}
	
    </script>
</head>
<body>
	<table id="dg" class="easyui-datagrid" title="商品管理" style="width:100%;height:800px"
			data-options="
				toolbar: '#toolbar',    <!-- 头 -->
				fitColumns: 'true',		<!-- 自适应网格宽度 -->
                singleSelect: true,		<!-- 单选开关 -->
				rownumbers: true,			<!-- 行索引 -->
				autoRowHeight: true,
				autoRowHeight: true,
				url: '/official-website/lightAction/getLightList.action',
				method: 'get',
				idField: 'id',
				nowrap:false,
				view: detailview,
				onExpandRow: function(index,row){
					var ddv = $(this).datagrid('getRowDetail',index).find('div.ddv');
					ddv.panel({
						border:false,
						cache:false,
						href:'/official-website/lightAction/lightDetail.action?id='+row.id,
						onLoad:function(){
							$('#dg').datagrid('fixDetailRowHeight',index);
						}
					});
					$('#dg').datagrid('fixDetailRowHeight',index);
				},
				detailFormatter: function(rowIndex, rowData){
							var htmlFmt = '<div class=' + '\'ddv\'' + ' style=' + '\'padding:5px 0\'' + '></div>';
							return htmlFmt;
				}
			">
		<thead>
			<tr>
				<th field="id" width="60" align="center">编号ID</th>
				<th field="productNo" align="center" width="80">商品编号</th>
				<th field="productName" align="center" width="70">商品名称</th>
				<th field="productClazz" align="center" width="70">商品种类</th>
				<th field="status" width="50" align="center">Status</th>
				<th data-options="field:'action', align:'center',
                                formatter: function (value,row,index){
                                        var s = '<a href=' + '\'javascript:void(0)\'' + 'onclick=' + '\'openUpdatePage('+row.id+')\'' + '>修改</a>';
                                        var c = '<a href=' + '\'javascript:void(0)\'' + 'onclick=' + '\'deleteRow('+row.id+')\'' + '>删除</a>';
                                        return s + '&nbsp;&nbsp;&nbsp;' + c;
                                }" style="width: 10%">操作</th>
			</tr>
		</thead>
	</table>
	
	<div id="toolbar">
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addLight()">添加</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:deleteRow(null)">删除</a>
    </div>
    
</body>
</html>