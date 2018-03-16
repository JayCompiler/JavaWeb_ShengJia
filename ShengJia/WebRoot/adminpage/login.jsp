<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录界面</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/login.css"
	type="text/css">
</head>
<body>
	<div id="login">
		<%
			session.setAttribute("username", null);
		%>
		<h1>管理员登录</h1>
		<form action="/ShengJia/LoginServlet" method="post">
			管理员账户：<input type="text" name="username"><br>
			<br> 密 &nbsp;&nbsp;码：<input type="password" name="password"><br>
			<br> <input type="submit" value="登录"> <input
				type="reset" value="重置">
			<%
				boolean a = (Boolean) session.getAttribute("login");
			%>
		</form>
	</div>
</body>
</html>