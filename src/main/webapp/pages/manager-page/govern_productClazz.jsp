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
    <title>商品种类</title>
    <link rel="stylesheet" type="text/css" href="<%=res %>easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="<%=res %>easyui/themes/icon.css">
    <script type="text/javascript" src="<%=res %>easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=res %>easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript">
    	function openAddPage(){
    		var node = $('#tg').treegrid('getSelected');
    		var wWidth = 700;
            var wHeight = 300;
            var wTop = (window.screen.availHeight - 30 - wHeight) / 2;
            var wLeft = (window.screen.availWidth - 10 - wWidth) / 2;
            var url = "add_productClazz.jsp";
            if (node != null){
            	
            	url += "?ID=" + node.ID + "&clazzName=" + encodeURIComponent(encodeURIComponent(node.clazzName));
            }
           	 	window.open(url, "_blank", "scrollbars=yes,resizable=1,modal=false,alwaysRaised=yes,height="+wHeight+"px, width="+wWidth+"px, top="+wTop+"px, left=" + wLeft + "px");

    	}
    	function addClazzNode(name){
    		var node = $('#tg').treegrid('getSelected');
    		var parentId = null;
			if (node != null) {
				parentId = node.ID;
			}
			var nodes = [{
   					ID: '333',
   					clazzName: name
   				},{
   					ID: '123',
   					clazzName: name
   				}];
   			$('#tg').treegrid('append',{
   				parent: parentId,  // the node has a 'id' value that defined through 'idField' property
   				data: nodes
   			});
    	}
    
    /**
     * easyui的扩展
          * 只允许选择一行，且选择后可取消选择
     */
   		function addClassNode(){
   			var node = $('#tg').treegrid('getSelected');
   			console.log(node.ID);
   			var getChildren = $('#tg').treegrid('getChildren',node.ID);
   			console.log(getChildren);
   			console.log(node);
			var parentId = null;
			if (node != null) {
				parentId = node.ID;
			}
   			$('#tg').treegrid('append',{
   				parent: parentId,  // the node has a 'id' value that defined through 'idField' property
   				data: [{
   					ID: '',
   					clazzName: ''
   				}]
   			});
   			//$("#tg").datagrid("beginEdit",index);
   		}
    
	    function collapseAll(){
			$('#tg').treegrid('collapseAll');
		}
		function expandAll(){
			$('#tg').treegrid('expandAll');
		}
     
    </script>

</head>
<!-- onClickRow: function (row) {
           					$('#tg').treegrid('unselectAll');
           					$('#tg').treegrid('select', row.ID);
        		} -->
<body>
    <table id="tg" class="easyui-treegrid" title="产品分类" style="width:100%;height:auto"
			data-options="
				toolbar: '#toolbar',    <!-- 头 -->
				fitColumns: 'true',
                singleSelect: true,		<!-- 单选开关 -->
                collapsible:true,			<!-- 折叠开关 -->
				iconCls: 'icon-ok',			<!-- 标题图片 -->
				rownumbers: true,			<!-- 行索引 -->
				animate: true,				<!-- 折叠动画效果 -->
				url: '/official-website/proClazz/getClazzMap.action',
				method: 'get',
				idField: 'ID',
				treeField: 'clazzName',
        		onDblClickRow: function (row) {
           					$('#tg').treegrid('unselectAll');
        		},
        		onClickRow: function (row) {
        					var selected = $('#tg').treegrid('getSelected');
        					console.log(selected);
        		}
				
			">
		<thead>
			<tr>
                <th data-options="field:'ID', align:'center'" style="width: 15%">编号ID</th>
				<th data-options="field:'clazzName',width:180,editor:'text'">分类名称</th>
				<th data-options="field:'action', align:'center',
                                formatter: function (value,row,index){
                                   var e = '<a href=' + '\'javascript:void(0)\'' + 'onclick=' + '\'deleteRow('+row.ID+')\'' + '>删除</a>';
                                   return e;
                                }" style="width: 10%">操作</th>
			</tr>
		</thead>
	</table>
	
    <div id="toolbar">
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="openAddPage()">添加</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="javascript:window.location.reload()">刷新</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="collapseAll()">闭合全部</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="expandAll()">展开全部</a>
    </div>
    <script type="text/javascript">
    function deleteRow(id){
    	var nodeChildren = $('#tg').treegrid('getChildren',id);
    	console.log(nodeChildren);
    	var ids = id;
    	for (var i = 0; i < nodeChildren.length; i++){
    		ids += "," + nodeChildren[i].ID;
    	}
    	console.log(ids);
        $.messager.confirm('确认删除？','确认删除该节点及其子节点？',function(r){
            if (r){
                $.ajax({
                	method: "get",
                	url: "/official-website/proClazz/deleteProClazz.action?ids="+ids,
                	success: function(data) {
               			$('#tg').treegrid('remove', id);
                		alert("删除成功");
                		window.location.reload();
                	}
                })
            }
        });
    }
	</script>

</body> 
</html>