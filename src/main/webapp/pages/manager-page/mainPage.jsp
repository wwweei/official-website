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
<script type="text/javascript" src="<%=res %>easyui/jquery.min.js"></script>
<script type="text/javascript" src="<%=res %>easyui/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=res %>easyui/themes/default/sidemenu.css">

<script type="text/javascript">
	function addTab(item){
		if ($('#tt').tabs('exists', item.text)){
 			$('#tt').tabs('select', item.text);
		} else {
			var content = '<iframe scrolling="auto" frameborder="0"  src="'+item.url+'" style="width:100%;height:100%;"></iframe>';
			$('#tt').tabs('add',{
				title:item.text,
				content:content,
				closable:true,
				id: item.id
			});
		}
		dblTab();
	}
	
	function dblTab() {
		/* 双击关闭TAB选项卡 */
		$(".tabs-inner").dblclick(function () {
				var subtitle = $(this).children(".tabs-closable").text();
				$('#tt').tabs('close', subtitle);
			});
	}

	function onTabSelect(title, index) {
        var tabs = $('#tt');
        var tab = tabs.tabs('getTab', index);
        var menus = $('#sm');
        if (menus.hasClass('sidemenu')) {
            var opts = menus.sidemenu("options");
            changeMenuSelect(menus, opts, tab[0].id);
        }
    }

	function changeMenuSelect(menus, opts, selectId) {
        var menutrees = menus.find(".sidemenu-tree");
        menutrees.each(function () {
            var menuItem = $(this);
            changeMenuStyle(menuItem, opts, selectId);
        });

        var tooltips = menus.find(".tooltip-f");
        tooltips.each(function () {
            var menuItem = $(this);
            var tip = menuItem.tooltip("tip");
            if (tip) {
                tip.find(".sidemenu-tree").each(function () {
                    changeMenuStyle($(this), opts, selectId);
                });
                menuItem.tooltip("reposition");
            }
        });
    }

	function changeMenuStyle(menuItem, opts, selectId) {
        menuItem.find("div.tree-node-selected").removeClass("tree-node-selected");
        var node = menuItem.tree("find", selectId);
        if (node) {
            $(node.target).addClass("tree-node-selected");
            opts.selectedItemId = node.id;
            menuItem.trigger("mouseleave.sidemenu");
        }
        changeMenuSelect(menuItem);
    }

</script>

</head>
<body class="easyui-layout">
		<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">后台管理</div>
		<div data-options="region:'west',title:'菜单'" style="width:202px; height: 100%;">
			<div id="sm" class="easyui-sidemenu" data-options="data: data, onSelect: addTab" style="width: 100%; padding: 5px;"></div>
			<script type="text/javascript">
				var data = [{
					text: '首页',
					url: 'govern_user.jsp',
					iconCls: 'fa fa-wpforms',
					state: 'open',
					children: [{
						iconCls: '1',
						url: 'scroll_img.jsp',
						text: '滚动广告'
					}]
				},{
					text: '产品',
					state: 'open',
					iconCls: 'fa fa-at',
					selected: true,
					children: [{
						url: 'govern_productClazz.jsp',
						iconCls: '1',
						text: '产品分类'
					},{
						iconCls: '1',
						url: 'govern_productLight.jsp',
						text: '产品详情'
					}]
				},{
					text: '案例',
					state: 'open',
					iconCls: 'fa fa-table',
					children: [{
						iconCls: '1',
						url: 'govern_case.jsp',
						text: '案例管理'
					}]
				},{
					text: '咨询',
					state: 'open',
					children: [{
						iconCls: '1',
						url: 'govern_comNews.jsp',
						text: '内部新闻'
					},{
						iconCls: '1',
						url: 'govern_tradeNews.jsp',
						text: '行业咨询'
					}]
				},{
					text: '服务',
					state: 'open',
					children: [{
						iconCls: '1',
						text: '安装指导'
					}]
				},{
					text: '关于',
					state: 'open',
					children: [{
						iconCls: '1',
						text: '公司简介'
					},{
						iconCls: '1',
						text: '联系方式'
					}]
				},{
					text: '账户设置',
					children: [{
						iconCls: '1',
						text: '修改密码'
					},{
						iconCls: '1',
						url: 'govern_user.jsp',
						text: '账户管理'
					}]
				}];
			</script>
		</div>
		
			
		<div data-options="region:'south',border:false" style="height:50px;background:#A9FACD;padding:10px;">south region</div>
		<div data-options="region:'center',title:'Center'">
			<div id="tt" class="easyui-tabs" data-options="fit:true,onSelect: onTabSelect" style="width:100%;height:100%;">
				<div title="欢迎页" style="padding:20px;display:none;">
					欢迎页
				</div>
			</div>
		</div>

</body>
</html>