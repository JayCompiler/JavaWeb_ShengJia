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
<!-- <link href="/ShengJia/css/addcas.css" rel="stylesheet" type="text/css" />
 -->
  <link href="/ShengJia/css/bootstrap.css" rel="stylesheet" type="text/css" />
 
 <link href="/ShengJia/css/Amenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/admin.js"></script>
<style type="text/css">
#m2 {
	background: #BCD2EE;
}
td,th{
	text-align: left;
}
</style>
</head>
<body>
	<%
		if (session.getAttribute("username") == null)
			response.sendRedirect("/ShengJia/adminpage/login.jsp");
	%>
<!-- 菜单 -->
	<div id="menu">
		<jsp:include page="/adminpage/menu.jsp" flush="true" />
	</div>
<!-- 退出登录 -->
	<div id="select">
		<font size="+1"> 	<button type="button" class="btn btn-info"
				onclick="window.location.href='${pageContext.request.contextPath}/adminpage/login.jsp'">退出登录</button>
		</font>
	</div>

	<div id="change">
		<%
			if (session.getAttribute("username") == null)
				response.sendRedirect("/ShengJia/adminpage/login.jsp");
		%>

		<center>
			<h1>添加类别</h1>
		</center>
		<div>
			
				<form action="/ShengJia/AddMate" method="post"
					enctype="multipart/form-data">
					<center>
					<table border="1">
						<tr>
							<td>推荐材料类别：&nbsp;<input type="text" name="category"
								id="name" required="required"></td>
							<td><span style="color: red;">*</span></td>
						</tr>
						<tr>
							<td>推荐材料图片：<input type="file" id="file" name="uploadFile"
								required="required"></td>
							<td><span style="color: red;">*</span></td>
						</tr>
						<tr>
							<td style="text-align: right;"> <input type="submit" value="提交">&nbsp;
								 <input type="button" value="返回上页" onclick="window.location.href='/ShengJia/CasPage'">
								</td>
						</tr>
					</table>
					</center>
				</form>
			
		</div>
	</div>
</body>
</html>











