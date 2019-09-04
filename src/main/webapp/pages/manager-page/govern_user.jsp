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
    <title>账户管理</title>
    <link rel="stylesheet" type="text/css" href="<%=res %>easyui/themes/default/easyui.css">
     <link rel="stylesheet" type="text/css" href="<%=res %>easyui/themes/icon.css">
    <script type="text/javascript" src="<%=res %>easyui/jquery.min.js"></script>
    <script type="text/javascript" src="<%=res %>easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        function addUser(){
            var wWidth = 400;
            var wHeight = 500;
            var wTop = (window.screen.availHeight - 30 - wHeight) / 2;
            var wLeft = (window.screen.availWidth - 10 - wWidth) / 2; 
            window.open('add_user.jsp', "_blank", "scrollbars=yes,resizable=1,modal=false,alwaysRaised=yes,height="+wHeight+"px, width="+wWidth+"px, top="+wTop+"px, left=" + wLeft + "px");
        }
      //这个函数为每次表格加载数据的过滤函数，data中包含原始数据，返回的是真正要显示出来的数据
        function pagerFilter(data) {  
            if (typeof data.length == 'number' && typeof data.splice == 'function') {   // is array  
                data = {  
                    total: data.length,  
                    rows: data  
                }  
            }
            //获取Datagrid对象
            var dg = $(this);  
            var opts = dg.datagrid('options');
         	//获取分页器
            var pager = dg.datagrid('getPager'); 
          	//重写表格所使用分页器的onSelectPage方法，此方法在用户选择新的页面时触发，即改变pageNum或pageSize时触发
            //此处真正的翻页逻辑并不在onSelectPage方法里面，可以看到在该方法中仅仅是将新页面的参数(pageNum, pageSize)保存在opts对象中，
            //这两个参数在后面的代码中被使用
            pager.pagination({  
                onSelectPage: function (pageNum, pageSize) {  
                    opts.pageNumber = pageNum;  
                    opts.pageSize = pageSize;  
                    pager.pagination('refresh', {  
                        pageNumber: pageNum,  
                        pageSize: pageSize  
                    });
                    //此处loadData方法会加载本地数据，即data中的数据，data中包含有初次加载的所有数据
                    dg.datagrid('loadData', data);
                  	//上述方法执行时会被pagerFilter拦截到，并对初始数据进行筛选，以达到分页的效果
                }  
            });
         	//真正的分页逻辑
            //第一次进入pagerFilter函数时，data中只有rows中保存了数据，并无originalRows属性，实现客户端分页时，需要在一开始将这些数据保存在
            //originalRows中，成为后续分页的基础数据，所以只要originalRows属性存在且不为空，分页时的基础数据便一直是originalRows中保存的数据
            if (!data.originalRows) {  
                data.originalRows = (data.rows);  
            }
          	//取出选择新的页面时，新页面的参数，前面已经保存在opts对象中了
            var start = (opts.pageNumber - 1) * parseInt(opts.pageSize);  
            var end = start + parseInt(opts.pageSize);
          	//下面对初始数据进行筛选，并将结果放在data.rows中，页面每次加载时只会显示data.rows中的数据
            data.rows = (data.originalRows.slice(start, end));
          	//返回data，完成分页
            return data;  
        }  
    </script>

</head>
<body>
    
    <table id="dg" class="easyui-datagrid" title="账户管理" style="width:100%;height:auto"
                    data-options="toolbar: '#toolbar',
                     fitColumns: 'true', rownumbers:true, 
                     singleSelect:false, collapsible:true, 
                     url:'/official-website/userAction/allUserList.action', 
                     method:'get', checkbox: true,
                     pagination: 'true',
                     loadFilter: pagerFilter,
                     onEndEdit:function(index,row){
                        var ed = $(this).datagrid('getEditor', {
                            index: index,
                            field: 'userState'
                        });
                        row.userState = $(ed.target).combobox('getText');
                        var ed1 = $(this).datagrid('getEditor', {
                            index: index,
                            field: 'userStatus'
                        });
                        row.userStatus = $(ed1.target).combobox('getText');
                        <!-- row.picName = $(ed.target).textbox('getText'); -->
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
                <th data-options="field:'userId', align:'center'" style="width: 15%">编号ID</th>
                <th data-options="field:'account', align:'center'" style="width: 20%">账号</th>
                <th data-options="field:'userName', align:'center'" style="width: 10%">用户名</th>
                <th data-options="field:'createTime', align:'center', 
                					formatter: function(value,row,index){
                						var date = new Date(parseInt(value));
                                        var y = date.getFullYear();
                                        var m = date.getMonth() + 1;
                                        var d = date.getDate();
                                        var h = date.getHours();
                                        var mi = date.getMinutes();
                                        var s = date.getSeconds();
                                        return y + '-' +m + '-' + d + ' ' + h + ':' + mi + ':' + s;
                					}" style="width: 20%">创建时间</th>
                <th data-options="field:'userState', align:'center', 
                                    editor: {type: 'combobox', 
                                    options: {
                                        valueField: 'value', textField: 'label',
                                        data: [{value: '1', label: '启用'}, {value: '0', label: '未启用'}]
                                             }
                                            },
                                   	formatter: function(value,row,index){
                                   		if (value == '1'){
                                   			return '启用';
                                 		} else if (value == '0'){
                                   			return '未启用';
                                   		} else {
                                   			return value;
                                   		}
                                   	}"
                                     style="width: 10%">用户状态</th>
                <th data-options="field:'userStatus', align:'center', 
                                    editor: {type: 'combobox', 
                                    options: {
                                        valueField: 'value', textField: 'label',
                                        data: [{value: 'admin', label: '管理员'}, {value: 'super', label: '超级管理员'}]
                                             }
                                            },
                                   	formatter: function(value,row,index){
                                   		if (value == 'admin'){
                                   			return '管理员';
                                 		} else if (value == 'super'){
                                   			return '超级管理员';
                                   		} else {
                                   			return value;
                                   		}
                                   	}"
                                     style="width: 10%">用户权限</th>
                <th data-options="field:'action', align:'center',
                                formatter: function (value,row,index){
                                    if (row.editing){
                                        var s = '<a href=' + '\'javascript:void(0)\'' + 'onclick=' + '\'saverow(this)\'' + '>保存</a>';
                                        var c = '<a href=' + '\'javascript:void(0)\'' + 'onclick=' + '\'cancelrow(this)\'' + '>撤销</a>';
                                        return s + '&nbsp;&nbsp;&nbsp;' + c;
                                    } else {
                                        var e = '<a href=' + '\'javascript:void(0)\'' + 'onclick=' + '\'editrow(this)\'' + '>编辑</a>';
                                        return e;
                                    }
                                }" style="width: 10%">操作</th>
            </tr>
        </thead>
    </table>
    <div id="toolbar">
            <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addUser()">添加</a>
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
    		alert("请选择需要删除的账户");
    		return ;
    	}
        $.messager.confirm('确认删除？','确认删除？',function(r){
            if (r){
            	var ids = "";
                $("input:checkbox[name=ck]:checked").each(function(){
                    var index = getRowIndex(this);
                    var rows = $("#dg").datagrid("getRows");
    	            var row = rows[index];
    	            ids += row.userId + ",";
                });
                $.ajax({
                	method: "get",
                	url: "/official-website/userAction/deleteUser.action?IDs=" + ids,
                	success: function(data) {
                		var idList = ids.split(",");
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
                            field: 'userState'
                        });
        var userState = $(ed.target).combobox('getValue');
        
        var ed1 = $('#dg').datagrid('getEditor', {
			            index: index,
			            field: 'userStatus'
        	});
        var userStatus = $(ed1.target).combobox('getValue');
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
        	url: "/official-website/userAction/updateUser.action?ID=" + row.userId + "&userState=" + userState + "&userStatus=" + userStatus,
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