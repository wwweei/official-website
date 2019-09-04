<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String res = basePath + "pages/official-website/";
Map n = (Map)request.getAttribute("news");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/official-website/pages/official-website/css/style1.css" rel="stylesheet" type="text/css" />
<script src="/official-website/pages/official-website/js/jquery1.42.min.js" type="text/javascript"></script>
<script src="/official-website/pages/official-website/js/jquery.js"></script>
<script src="/official-website/pages/official-website/js/jquery.superslide.2.1.1.js" type="text/javascript"></script>
<title>新闻中心</title>
<script type="text/javascript">
	function pageLoad(){
		var pageFlag = getUrlParam("kind");
		//为1时为行业新闻
		if ("1" == pageFlag) {
			$("#boxTitle").text("行业新闻");
			$("#titlePath").html(function(i,origText){
			      return origText + "> <a href=''> 行业新闻</a>"; 
		    });
		//为0时为内部新闻
		} else if ("0" == pageFlag) {
			$("#boxTitle").text("内部新闻");
			$("#titlePath").html(function(i,origText){
			      return origText + "> <a href=''> 内部新闻</a>"; 
		    });
		} else {
			
		}
	}
	
	//获取url中的参数
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg);  //匹配目标参数
        if (r != null) return unescape(r[2]); return null; //返回参数值
    }
</script>

</head>

<body onload="pageLoad()" >
<div class="wapper_box">
<div class="header_box"></div>
<div class="header_box1">
    <div class="header_box2">
        <a class="logo_box" href="index.html"><h1>亮科照明</h1></a>
         <ul class="nav_box">
             <li class="nav_1"><a class="nav_but" href="/official-website/pages/official-website/index.html">网站首页</a></li>
             <li class="nav_1"><a class="nav_but" href="/official-website/pages/official-website/product.html">产品介绍</a>
             </li>
             <li class="nav_1"><a class="nav_but" href="/official-website/newsCenterAction/getNewsList.action">新闻中心</a>
               <div class="nav_slide">
                <div class="nav_slide1">
                    <a href="/official-website/newsCenterAction/getNewsList.action?kind=0">公司新闻<span><img src="/official-website/pages/official-website/images/siade_bg1.png"/></span></a>
                    <a href="/official-website/newsCenterAction/getNewsList.action?kind=1">行业新闻<span><img src="/official-website/pages/official-website/images/siade_bg1.png"/></span></a>
                 </div>
               </div>
             </li>
             <li class="nav_1"><a class="nav_but" href="/official-website/successCaseAction/successfulList.do">成功案例</a>
             </li>
             <li class="nav_1"><a class="nav_but" href="/official-website/pages/official-website/contact_us.html">联系我们</a>
             </li>
             <li class="nav_1"><a class="nav_but" href="/official-website/pages/official-website/about_us.html">关于亮科</a>
             </li>
         </ul>
    </div>
        <script>	 
             $(".nav_1").mouseenter(function(){
				 $(this).find(".nav_slide").slideDown()
			  });
			  
			  $(".nav_1").mouseleave(function(){ 
				 $(".nav_slide").slideUp()
			 });
			 //$(".producys_box").mouseout(function(){
				// $(this).find(".producys_box1").slideUp(); 
			 //});
          </script>
</div>
<!--banner部分开始-->
  <div class="banner_box1">
        <ul class="banner_pic1">
        	<c:forEach var="pic" items="${banner_pic }">
            	<li><img src="/official-website/${pic.url }" /></li>
        	</c:forEach>
        </ul>
        <a class="prev" href="javascript:void(0)"></a>
        <a class="next" href="javascript:void(0)"></a>
        <div class="num"><ul></ul></div>
  </div>
	<script>
    /*鼠标移过，左右按钮显示*/
    $(".banner_box1").hover(function(){
        $(this).find(".prev,.next").fadeTo("show",0.1);
    },function(){
        $(this).find(".prev,.next").hide();
    })
    /*鼠标移过某个按钮 高亮显示*/
    $(".prev,.next").hover(function(){
        $(this).fadeTo("show",0.7);
    },function(){
        $(this).fadeTo("show",0.1);
    })
    $(".banner_box1").slide({ titCell:".num ul" , mainCell:".banner_pic1" , effect:"fold", autoPlay:true, delayTime:700 , autoPage:true });
    </script>
    <!-- 代码 结束 -->
  <!--banner部分结束-->

<!--内容开始-->
<div class="content_box1">
  <div class="content_box2"> 
    <div class="menu_box">
       <p class="menu_box_title">新闻中心<span>news</span></p>
       <ul class="menu_box1">
          <li><a href="/official-website/newsCenterAction/getNewsList.action?kind=0">公司新闻</a></li>
          <li><a href="/official-website/newsCenterAction/getNewsList.action?kind=1">行业新闻</a></li>
       </ul>
    </div>
    <div class="content_boxL">
       <div class="content_boxL_nav">
         <p class="content_boxL_nav_title" id="boxTitle">新闻中心</p>
         <div class="content_boxL_nav_R" id="titlePath"><a href="/official-website/pages/official-website/index.html">首页</a> > <a href="/official-website/newsCenterAction/getNewsList.action">新闻中心 </a></div>                          
       </div>
       <div class="content_boxL_text">
         <ul class="content_boxL_list">
         	<c:forEach var="news" items="${newsList }">
         	<li><a class="content_boxL_list_info" href="/official-website/newsCenterAction/browseNewsDetail.action?kind=${news.kind }&newsId=${news.newsId}">${news.title }<span class="yewu_date"><fmt:formatDate value="${news.saveTime }" type="date"/></span></a></li>
         	</c:forEach>
            
         </ul>       
       </div>
       <!-- <div class="fenye_box"><a href="">首页</a><a href="">1</a><a href="">2</a><a href="">3</a><a href="">4</a><a href="">……</a><a>下一页</a><a href="">最后一页</a></div>  -->
    </div>
   <div class="clear"></div>
   <div class="info_search">
     <ul class="info_search_l">
        <li>友情链接：
        <select name="pageselect" onchange="self.location.href=options[selectedIndex].value" > 
          <option value ="http://www.baidu.com">百度</option>
        </select>
        </li>
    </ul>
    <div class="info_search_r"><a href=""><img src="/official-website/pages/official-website/images/icon6.png"/><span>微信</span></a></div>
   </div>
   </div>
   <div class="footer_box"></div>
</div>

<!--内容结束--> 
</div>
</body>

</html>
