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
    <title>案例管理</title>
    <link rel="stylesheet" type="text/css" href="<%=res %>easyui/themes/default/easyui.css">
     <link rel="stylesheet" type="text/css" href="<%=res %>easyui/themes/icon.css">
    <script type="text/javascript" src="<%=res %>easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=res %>easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        function addCase(){
            var wWidth = 700;
            var wHeight = 900;
            var wTop = (window.screen.availHeight - 30 - wHeight) / 2;
            var wLeft = (window.screen.availWidth - 10 - wWidth) / 2; 
            window.open('add_case.jsp', "_blank", "scrollbars=yes,resizable=1,modal=false,alwaysRaised=yes,height="+wHeight+"px, width="+wWidth+"px, top="+wTop+"px, left=" + wLeft + "px");
        }
        
        function openEditor(){
            var wWidth = 700;
            var wHeight = 900;
            var wTop = (window.screen.availHeight - 30 - wHeight) / 2;
            var wLeft = (window.screen.availWidth - 10 - wWidth) / 2; 
            window.open('add_case.jsp', "_blank", "scrollbars=yes,resizable=1,modal=false,alwaysRaised=yes,height="+wHeight+"px, width="+wWidth+"px, top="+wTop+"px, left=" + wLeft + "px");
        }
      
        function timefmt(value,row,index){
			var date = new Date(parseInt(value));
            var y = date.getFullYear();
            var m = date.getMonth() + 1;
            var d = date.getDate();
            var h = date.getHours();
            var mi = date.getMinutes();
            var s = date.getSeconds();
            return y + '-' +m + '-' + d + ' ' + h + ':' + mi + ':' + s;
		}
    </script>

</head>
<body>
    
    <table id="dg" class="easyui-datagrid" title="案例管理" style="width:100%;height:auto"
                    data-options="toolbar: '#toolbar',
                     fitColumns: 'true', rownumbers:true, 
                     singleSelect:false, collapsible:true, 
                     url:'/official-website/caseAction/allCaseList.action', 
                     method:'get', checkbox: true,
                     pagination: 'true',
                     onEndEdit:function(index,row){
                        var ed1 = $(this).datagrid('getEditor', {
                            index: index,
                            field: 'status'
                        });
                        row.status = $(ed1.target).combobox('getText');
                    },
                    onBeforeEdit:function(index,row){
                        row.editing = true;
                        $(this).datagrid('refreshRow', index);
                    },
                    onAfterEdit:function(index,row){
                        row.editing = false;
                        $(this).datagrid('refreshRow', index);
                    },
                    onCancelEdit:function(index,row){
                        row.editing = false;
                        $(this).datagrid('refreshRow', index);
                    }">
        <thead>
            <tr>
                <th data-options="field:'ck', checkbox: true, align:'center'" style="width: 10%">全选</th>
                <th data-options="field:'ID', align:'center'" style="width: 15%">编号ID</th>
                <th data-options="field:'title', align:'center'" style="width: 20%">标题</th>
                <th data-options="field:'saveTime', align:'center', 
                					formatter: timefmt" style="width: 20%">创建时间</th>
                <th data-options="field:'updateTime', align:'center', 
                                    formatter: timefmt"
                                     style="width: 10%">最后更新时间</th>
                <th data-options="field:'status', align:'center', 
                                    editor: {type: 'combobox', 
                                    options: {
                                        valueField: 'value', textField: 'label',
                                        data: [{value: '1', label: '已发表'}, {value: '0', label: '未发表'}]
                                             }
                                            },
                                   	formatter: function(value,row,index){
                                   		if (value == '1'){
                                   			return '已发表';
                                 		} else if (value == '0'){
                                   			return '未发表';
                                   		} else {
                                   			return value;
                                   		}
                                   	}"
                                     style="width: 10%">是否发表</th>
                <th data-options="field:'author', align:'center'" style="width: 20%">作者</th>
                <th data-options="field:'action', align:'center',
                                formatter: function (value,row,index){
                                    if (row.editing){
                                        var s = '<a href=' + '\'javascript:void(0)\'' + 'onclick=' + '\'saverow(this)\'' + '>保存</a>';
                                        var c = '<a href=' + '\'javascript:void(0)\'' + 'onclick=' + '\'cancelrow(this)\'' + '>撤销</a>';
                                        return s + '&nbsp;&nbsp;&nbsp;' + c;
                                    } else {
                                        var e = '<a href=' + '\'javascript:void(0)\'' + 'onclick=' + '\'editrow(this)\'' + '>编辑</a>';
                                        var d = '<a href=' + '\'javascript:void(0)\'' + 'onclick=' + '\'openEditor(this)\'' + '>查看</a>';
                                        return e + '&nbsp;&nbsp;&nbsp;' + d;
                                    }
                                }" style="width: 10%">操作</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addCase()">添加</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="javascript:deleterow()">删除</a>
            <!-- <a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="javascript:$('#dg').edatagrid('saveRow')">保存</a> -->
            <!-- <a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#dg').edatagrid('cancelRow')">撤销</a> -->
    </div>
    <script type="text/javascript">
    function getRowIndex(target){
        var tr = $(target).closest('tr.datagrid-row');
        return parseInt(tr.attr('datagrid-row-index'));
    }
    function editrow(target){
        $('#dg').datagrid('beginEdit', getRowIndex(target));
    }
    function deleterow(){
    	if ($("input:checkbox[name=ck]:checked").length < 1) {
    		alert("请选择需要删除的案例");
    		return ;
    	}
        $.messager.confirm('确认删除？','确认删除？',function(r){
            if (r){
            	var ids = "";
            	var rowsIndex = new Array();
                $("input:checkbox[name=ck]:checked").each(function(){
                    var index = getRowIndex(this);
                    rowsIndex.push(index);
                    var rows = $("#dg").datagrid("getRows");
    	            var row = rows[index];
    	            ids += row.ID + ",";
                });
                $.ajax({
                	method: "get",
                	url: "/official-website/caseAction/deleteCase.action?IDs=" + ids,
                	success: function(data) {
                		for (var i = rowsIndex.length - 1; i >= 0; i--) {
                        	$('#dg').datagrid('deleteRow', rowsIndex[i]);
                      	}
                		alert(data);
                		window.location.reload();
                	}
                })
            }
        });
    }

    function saverow(obj){
        // checkRowIsChange(obj);
        var index = getRowIndex(obj);
    	//获取编辑行下拉框value
        var ed = $('#dg').datagrid('getEditor', {
                            index: index,
                            field: 'status'
                        });
        var status = $(ed.target).combobox('getValue');
        // var ll = $(ed.target).combobox('getText');
        // console.log(ll);
        // var oldRows = $("#dg").datagrid("getRows");
        // var oldRow = oldRows[index];
        // console.log(oldRow.picName + "-" +oldRow.isShow + "-" + oldRow.weight);
    	$('#dg').datagrid('endEdit', index);
    	
    	var rows = $("#dg").datagrid("getRows");
    	var row = rows[index];
        // console.log(row.picName + "-" +row.isShow + "-" + row.weight);

    	$.ajax({
        	method: "get",
        	url: "/official-website/caseAction/updateCase.action?ID=" + row.ID + "&status=" + status,
        	success: function(data) {
                alert(data);
        	},
        	error: function(){
        		alert("异常错误，请联系");
        	}
    	})
    }
    //验证行是否修改
    // function checkRowIsChange(obj){
    //     var index = getRowIndex(obj);
    //     var oldRows = $("#dg").datagrid("getRows");
    // }

    function cancelrow(target){
        $('#dg').datagrid('cancelEdit', getRowIndex(target));
    }  
	</script>

</body> 
</html>