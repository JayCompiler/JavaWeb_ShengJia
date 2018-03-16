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
<link href="/ShengJia/css/bootstrap.css" rel="stylesheet" type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/admin.js"></script>
</head>
<style type="text/css">
#m1 {
	background: #BCD2EE;
}
</style>
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
		</font>
	</div>

	<div id="change">s
		<center>
			<h1>添加案例</h1>
		</center>
		<div>
			<center>
				<form action="/ShengJia/AddSuc" method="post"
					enctype="multipart/form-data">
					<table border="1">
						<tr>
							<td>名称：</td><td style="text-align: left;"><input type="text" name="name" id="name"
								required="required"><span style="color: red;" >*</span>必填</td>
						</tr>
						<tr>
							<td>描述：</td><td style="text-align: left;"><textarea rows="7" cols="40" name="description"></textarea></td>
						</tr>
						<tr>
						<td>标志图片：</td>	<td style="text-align: left;"><input type="file" name="uploadFile" required="required"></td>
						</tr>
						<tr>
						
							<td  colspan="2" style="text-align: left;">
							<input type="submit" value="添加">&nbsp;<input
								type="button"
								onclick="window.location.href='/ShengJia/SucServlet'"
								value="返回上页"></td>
						</tr>
					</table>
					<script>
						function deli() {
							var name = document.getElementById("name").value;
							if (name != "") {
								window.location.href = "/ShengJia/adminpage/addcImg.jsp?name=" + name;
							} else {
								alert("请填写案例名");
							}
						}
					</script>
				</form>
			</center>
		</div>
	</div>
</body>
</html>





