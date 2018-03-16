<%@page import="com.shengjia.bean.Message"%>
<%@page import="com.shengjia.dao.MessageDBO"%>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/admin.js"></script>
<style type="text/css">
#m4 {
	background: #BCD2EE;
}

img {
	height: 50px;
	width: 50px;
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
					onclick="window.location.href='/ShengJia/mesPage'">返回</button>
		</font>
	</div>
	<hr>

	<%
		Page page1 = (Page) request.getAttribute("pageone");
		ArrayList<Message> reCases = page1.getRecord();
		for (Message re : reCases) {
	%>
	<div id="change">
		<div id="content">
			<div id="tit" style="height: 5%;width: 100%;font-size: 20px; ">

				<div id="name"
					style="float: left;width: 33%; left: 2%;position: absolute;">
					姓名：<%=re.getName()%></div>
				<div id="doll" style="float: right;width: 67%;">

					<div id="tel" style="float: left;width: 50%;">
						电话：<%=re.getTelephone()%></div>

					<div id="dat" style="float:right;width: 50%;">
						留言日期：<%=re.getDate()%></div>
				</div>
			</div>

			<hr>
			<br> <br> <br>
			<div style="font-size:25px;">
				&nbsp;&nbsp;<%=re.getMessage()%></div>
			<%
				}
			%>
		</div>
		<div id="foot" style="margin-top: -5%;">
			<div style="float: left; width: 50%;">
			
			
				<button type="button" class="btn btn-info"  style="left: 70%;position: absolute;"
					onclick="window.location.href='${pageContext.request.contextPath}/mesPage1?num=<%=page1.getNextPageNum()%>'">下一条</button>
			
			</div>
			<div style="float: right;width: 50%; ">
						<button type="button" class="btn btn-info"  style="left: 20%;position: absolute;"
					onclick="window.location.href='${pageContext.request.contextPath}/mesPage1?num=<%=page1.getPrePageNum()%>'">上一条</button>
			
			</div>

		</div>
	</div>
</body>
</html>








