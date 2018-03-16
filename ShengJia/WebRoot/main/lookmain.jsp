<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mainpage.css">
<link type="text/css" rel="stylesheet" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
	<link type="text/css" rel="stylesheet" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
</head>
<body>
	<!--  整个页面布局 -->
	<div id="main">
		<div id="menu" align="left">
			<jsp:include page="/page/menu.jsp" flush="true" />
		</div>

		<!-- 右侧内容展示================================================== -->
		<div id="content">
			<div id="top" style="height: 15%;">
				<%
					String detail = request.getParameter("detail");
					String content = request.getParameter("content");
				%>
				<center>
					<h1><%=detail%></h1>
				</center>
			</div>
			<div id="bottom" style="height: 75%;padding-top: 2%">
				&nbsp;&nbsp;&nbsp;&nbsp;<%=content%>
			</div>
			<div id="return" style="right: 2%;position: absolute;">
			
			<button type="button" class="btn btn-info"
					onclick="history.go(-1);"
					>返回</button>
			<!-- 	<a href="###" onclick="history.go(-1);">返回</a> -->
			</div>


		</div>

	</div>

</body>
</html>