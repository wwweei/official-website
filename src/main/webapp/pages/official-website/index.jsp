<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String res = basePath + "pages/official-website/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/official-website/pages/official-website/css/style1.css" rel="stylesheet" type="text/css" />
<script src="/official-website/pages/official-website/js/jquery1.42.min.js" type="text/javascript"></script>
<script src="/official-website/pages/official-website/js/jquery.js"></script>
<script src="/official-website/pages/official-website/js/jquery.superslide.2.1.1.js" type="text/javascript"></script>
<title>首页</title>
</head>

<body>
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
  <div class="banner_box">
        <ul class="banner_pic">
        <c:forEach var="pic" items="${banner_pic }">
            <li><img src="<%=basePath %>${pic.url }" /></li>
        </c:forEach>
    
        </ul>
        <a class="prev" href="javascript:void(0)"></a>
        <a class="next" href="javascript:void(0)"></a>
        <div class="num"><ul></ul></div>
  </div>
	<script>
    /*鼠标移过，左右按钮显示*/
    $(".banner_box").hover(function(){
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
    $(".banner_box").slide({ titCell:".num ul" , mainCell:".banner_pic" , effect:"fold", autoPlay:true, delayTime:700 , autoPage:true });
    </script>
    <!-- 代码 结束 -->
  <!--banner部分结束-->

<!--内容开始-->
<div class="content_box">
   <ul class="content_box_top">
   		<c:forEach var="light" items="${lightList }">
              <li>
	              <a href="/official-website/productLightAction/?id=${light.id }"><img width="258px" height="258px" src="/official-website/${light.product_pic }"/></a>
	        		<h3 class="obj_title">${light.productName }</h3>
	        	  <p>${light.productClazz }</p>
              </li>
         </c:forEach>
   </ul>
   <div class="content_box_bot">
       <ul class="content_box_bot_l">
          <li class="info_news">
            <div class="info_news_but"><p class="on">公司新闻</p><p>行业资讯</p></div>
            <ul class="info_news_text info_news_text1">
            <c:forEach var="cNews" items="${comNewList }">
              <li><a href="/official-website/newsCenterAction/browseNewsDetail.action?kind=${cNews.kind }&newsId=${cNews.newsId}"><img src="/official-website/pages/official-website/images/info_icon1.png"/><p>${cNews.title }<span class="date"><fmt:formatDate value="${cNews.saveTime }" type="date"/></span></p></a></li>
            </c:forEach>
            </ul>
           <ul class="info_news_text info_news_text2">
          	<c:forEach var="tNews" items="${tradeNewList }">
              <li><a href="/official-website/newsCenterAction/browseNewsDetail.action?kind=${tNews.kind }&newsId=${tNews.newsId}"><img src="/official-website/pages/official-website/images/info_icon1.png"/><p>${tNews.title }<span class="date"><fmt:formatDate value="${tNews.saveTime }" type="date"/></span></p></a></li>
            </c:forEach>
            </ul>
          <script>
            $(".info_news_but p").each(function(n){
				$(this).click(function(){
				$(this).addClass("on").siblings("p").removeClass("on");
				$(".info_news_text").hide(400).eq(n).show(500);
		    });
           });
          
          </script>
          </li>
          <li class="search_obj">
            <p class="search_obj_title">分类搜索<span>Classification search</span></p>
            <div class="search_obj1">
               <a href="">一般人</a>  <a href="">小规模</a>  <a href="">企业类型</a>
               <a href="">注册资金</a>  <a href="">年限</a>  <a href="">更多>></a>
            </div>
          </li>
       </ul>
       
      <ul class="content_box_bot_r">
          <li class="jianjie_box">
            <p class="jianjie_title">关于亮科<span>COMPANYP</span></p>
            <div class="jianjie_box1">
              <img src=""/>
              <a href="/official-website/pages/official-website/about_us.html">广州市亮科照明有限公司成立于2017年04月28日，注册资金50万人民币元，公司坐落于广州，主要经营照明灯具制造;电光源制造;灯用电器附件及其他照明器具制造;电工器材制造;其他家用电力器具制造;电气机械制造;电气器材制造;电力电子元器件制造....<span>[详情]</span></a></div>
          </li>
          <li class="zichan_box">
            <P>联系我们<span>Contact us</span></P>
            <a href="/official-website/pages/official-website/lianxiwomen.html" style="display:block; margin-left: 30px">
				 公司名称：广州市亮科照明有限公司<br/>
				 公司地址：广州市南沙区东涌镇自编工业路5号104<br/>
				 公司电话：022-1234567<br/>
				 公司传真：022-1234567<br/>
				 公司邮箱：hq789@126.com
          	</a>
          </li>
       </ul>
   </div>
   
   <div class="info_search">
     <ul class="info_search_l">
        <li>友情链接：
        <select name="pageselect" onchange="self.location.href=options[selectedIndex].value" > 
          <option value ="http://www.baidu.com">百度</option>
        </select>
        </li>
    </ul>
    <div class="info_search_r" align="right"> 
       <a href=""><img src="/official-website/pages/official-website/images/icon6.png"/><span>微信</span></a>
    </div>
   </div>
</div>

<!--内容结束--> 
<div class="footer_box"></div>

</div>


</body>

</html>
