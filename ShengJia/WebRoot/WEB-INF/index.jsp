<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<p>欢迎您，点击进入</p>
		<a href="${pageContext.request.contextPath}/adminpage/login.jsp">管理员登录</a><br>
		<%-- <p>${pageContext.request.contextPath}</p> --%>
		<a href="${pageContext.request.contextPath}/page/mainpage.jsp"> <img
			src="${pageContext.request.contextPath}/img/btn1.png" alt="转到主界面"
			height="30px" width="30px" />
		</a>
	</center>
</body>
</html>