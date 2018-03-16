<%@page import="com.shengjia.dao.SuccessfulCaseDBO"%>
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
#m1 {
	background: #BCD2EE;
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
		<font size="+1">
		
		<button type="button" class="btn btn-info"
					onclick="window.location.href='${pageContext.request.contextPath}/adminpage/login.jsp'"
					>退出登录</button>
		<%--  <a
			href="${pageContext.request.contextPath}/adminpage/login.jsp">退出登录</a> --%>
		</font>
	</div>


	<div id="change">

		<center>
			<h1>修改</h1>
		</center>
		<div
			style="float: left;margin: 0,auto;margin-left: 150px;margin-top: 10px;">

			<%
				int id = (Integer) request.getAttribute("id");
				SuccessfulCaseDBO sDbo = new SuccessfulCaseDBO();
				SuccessfulCase sfc = sDbo.queryCaseById(id);
			%>
			<form action="/ShengJia/UploadServlet" method="post"
				enctype="multipart/form-data">
				<table border="1">

					<tr>
						<td><input type="hidden" name="id" value="<%=sfc.getId()%>"></td>
					</tr>
					<tr>
						<td>名称：</td><td><input type="text"
							value="<%=sfc.getCasename()%>" name="name" id="name"
							required="required"></td>
					</tr>
					<tr>
						<td>描述：</td><td><textarea rows="10" style="font-size: 15px;" cols="40" name="description"><%=sfc.getDescription()%></textarea></td>
					</tr>
					<tr>
						<td>标志图片</td><td><input type="file" name="uploadFile"
							required="required"></td>
					</tr>

					<tr>
						<td colspan="2"> 
						<input type="submit" value="修改"> &nbsp;<input
							type="button" value="返回上页" onclick="history.go(-1);"></td>
					</tr>
				</table>
			</form>
			<script type="text/javascript">
				$(document).ready(function() {
					$("#a").click(function() {
						var name = document.getElementById("name").value;
						if (name != "") {
							window.location.href = "/ShengJia/adminpage/addcImg.jsp?name=" + name;
						} else {
							alert("请填写案例名");
						}
					})
				});
				function deli() {
					var name = document.getElementById("name").value;
					if (name != "") {
						window.location.href = "/ShengJia/adminpage/addcImg.jsp?name=" + name;
					} else {
						alert("请填写案例名");
					}
				}
			</script>
		</div>
		<div style="float: right; margin-right: 200px;margin-top: 10px;">
			<center>
				<img alt="h" src="/ShengJia/upload/<%=sfc.getImg1()%>"
					style="height: 250px;width: 300px;">
			</center>
		</div>

	</div>
</body>
</html>



