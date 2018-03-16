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
<link href="/ShengJia/css/ma.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/admin.js"></script>
<style type="text/css">
#m3{
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
	<div id="select">
		<font size="+1"> <a
			href="${pageContext.request.contextPath}/adminpage/login.jsp">退出登录</a>
			<a href="###" onclick="history.go(-1);">返回</a>
		</font>
	</div>
	<div id="change">

		<center>
			<h1>添加问题类别</h1>
		</center>
		<hr>
		<center>
			<form action="/ShengJia/AddFAQC" method="post">
				<table border="1px">
					<tr>
						<td>类别：<input type="text" name="category"
							required="required"></td>
							<td><input type="submit" value="添加"></td>
					</tr>
				</table>
			</form>

		</center>
	</div>
</body>
</html>









