<%@page import="com.shengjia.dao.MainDao"%>
<%@page import="com.shengjia.bean.FaqCategory"%>
<%@page import="com.shengjia.bean.FAQ"%>
<%@page import="com.shengjia.dao.FAQDBO"%>
<%@page import="com.shengjia.bean.SuccessfulCase"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shengjia.commons.Page"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>
<link href="/ShengJia/css/bootstrap.css" rel="stylesheet" type="text/css" />

<link href="/ShengJia/css/manage.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/admin.js"></script>
<style type="text/css">
#m3{
	background: #BCD2EE;	
}
</style>
</head>
<body>
<% if(session.getAttribute("username")==null)
	response.sendRedirect("/ShengJia/adminpage/login.jsp");
 %>



	<div id="menu">
		<jsp:include page="/adminpage/menu.jsp" flush="true" />

	</div>
		<div id="select" style="padding-left: 90%">
		<font size="+1">
		<button type="button" class="btn btn-info"
					onclick="window.location.href='${pageContext.request.contextPath}/adminpage/login.jsp'"
					>退出登录</button>&nbsp;
		</font>
	</div>
<div id="change">	
	<div id="content">
		<center><h3>文档</h3></center>
		<ul>
			<li><a href="/ShengJia/FAQCPage">常见问题</a>
			</li>
			
			<% MainDao mDao=new MainDao();
				ArrayList<String> s=new ArrayList<String>();
				s=mDao.getCategorys();
				for(String category:s){
			 %>
			<li>
			<a href="/ShengJia/MainDePage?category=<%=category %>&&method=method"><%=category %></a>
			
			</li>
			<%} %>
			<!-- <li><a href="/ShengJia/MainDePage?category=近期活动&&method=method">近期活动</a>
			</li>
			<li><a href="/ShengJia/MainDePage?category=通知公告&&method=method">通知公告</a></li> -->
			
		</ul>
	</div>
	</div>
</body>
</html>




