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
<link href="/ShengJia/css/ma.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/admin.js"></script>
<style type="text/css">
#m3 {
	background: #BCD2EE;
}
</style>
</head>
<body>
	<%
		if (session.getAttribute("username") == null)
			response.sendRedirect("/ShengJia/adminpage/login.jsp");
	%>



	<div id="menu">
		<jsp:include page="/adminpage/menu.jsp" flush="true" />

	</div>
	<div id="select" style="padding-left: 85%;">
		<font size="+1"> 
		<button type="button" class="btn btn-info"
					onclick="window.location.href='${pageContext.request.contextPath}/adminpage/login.jsp'">退出登录</button>
		&nbsp;
				<button type="button" class="btn btn-info" 
					onclick="history.go(-1);">返回</button>
		<%-- <a
			href="${pageContext.request.contextPath}/adminpage/login.jsp">退出登录</a>
			<a href="###" onclick="history.go(-1);">返回</a> --%>
		</font>
		<br>
		<br>
	</div>
	
	
		<%
		Page page1 = (Page) request.getAttribute("pageone");
		String category=(String)request.getAttribute("category");
		ArrayList<FAQ> reCases = page1.getRecord();
		for (FAQ re : reCases) {
	%>
	<div id="change">
		<div id="content">
			<div>&nbsp;&nbsp;&nbsp;常见问题：<%=re.getQuestion() %></div>
			<br>
			<div>&nbsp;&nbsp;&nbsp;解答：<%=re.getAnswer()%></div>
		</div>
		<%} %>
		<div id="foot" style="padding-top:-20% ;">
			<div style="float: left; width: 50%;">
			<button type="button" class="btn btn-info" style="left: 20%;position: absolute;"
					onclick="window.location.href='${pageContext.request.contextPath}/OPFAQ?category=<%=category %>&&num=<%=page1.getPrePageNum()%>&&method=look'">上一条</button>
					
			</div>
			<div style="float: right;width: 50%; ">
			<button type="button" class="btn btn-info" style="left: 70%;position: absolute;"
					onclick="window.location.href='${pageContext.request.contextPath}/OPFAQ?category=<%=category %>&&num=<%=page1.getNextPageNum()%>&&method=look'"
					>下一条</button>
			
			</div>

		</div>
	</div>
</body>
</html>




