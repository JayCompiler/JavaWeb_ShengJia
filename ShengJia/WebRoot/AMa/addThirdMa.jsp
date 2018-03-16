<%@page import="com.shengjia.bean.ReMaterial"%>
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
<!-- <link href="/ShengJia/css/ma.css" rel="stylesheet" type="text/css" />
 --><link href="/ShengJia/css/bootstrap.css" rel="stylesheet"
	type="text/css" />

<link href="/ShengJia/css/Amenu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/admin.js"></script>
<style type="text/css">
#m2 { #BCD2EE;
	
}

td {
	text-align: left;
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
		<font size="+1"> <button type="button" class="btn btn-info"
				onclick="window.location.href='${pageContext.request.contextPath}/adminpage/login.jsp'">退出登录</button>
	
		</font>
	</div>
<!-- 	<div id="title">
		材料类别管理
		<hr> -->
	</div>

	<div id="change">
	
		<center>
			<h1>添加展示图片</h1>
		</center>
		<%
			String materialname = request.getParameter("name");
			session.setAttribute("materialname", materialname);
		%>
		<form action="/ShengJia/AddThirdMa" method="post"
			enctype="multipart/form-data">
			<center>
				<%
					String name = request.getParameter("name");
					String des = request.getParameter("des");
					String id = request.getParameter("id");
					String flag1 = request.getParameter("flag");
					int flag = 0;
					if (flag1 != null) {
						flag = 1;
					}
				%>
				<table border="1px">
					<tr>
						<td>图片描述：<input type="text" value="<%=des%>" name="des"></td>
					</tr>
					<tr>
						<td>材料图片：<input type="file" name="imgs" required="required" /></td>
					</tr>
					<tr>
						<td><input type="submit" value="上传">&nbsp; 
						<input type="button" value="返回" onclick="history.go(-1);">
						</td>
					</tr>
					<tr>
						<td><input type="hidden" value="<%=name%>" name="name">
						<% if(flag==0){ %>
						<input type="hidden" value="<%=id%>" name="id">
					<%} %>	
						<input type="hidden" value="<%=flag%>" name="flag">					
						</td>
					</tr>
				</table>
			</center>
		</form>
	</div>
</body>
</html>















