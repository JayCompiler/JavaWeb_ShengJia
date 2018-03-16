<%@page import="com.shengjia.bean.FAQ"%>
<%@page import="com.shengjia.commons.Page"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
	<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/ShengJia/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/main.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/css.js"></script>
<title>主界面</title>

</head>
<body>
	<!--  整个页面布局 -->
	<div id="main">
		<div id="menu" align="left">

			<jsp:include page="/page/menu.jsp" flush="true" />

		</div>

		<!-- 右侧内容展示================================================== -->
		<div id="content">
			<div id="select">
				<!-- <font size="+1"><a href="/ShengJia/page/Welcome.jsp">返回欢迎界面</a>
				</font> -->
			</div>
			<div id="intro1">
				<%
					Page page1 = (Page) request.getAttribute("pageone");
					String category = (String) request.getAttribute("category");
					ArrayList<FAQ> reCases = page1.getRecord();
					for (FAQ re : reCases) {
				%>
				<center>
					<h2><%=re.getQuestion()%>
					</h2>
				</center>
				<br>
				<p><%=re.getAnswer()%></p>
			</div>
			<%
				}
			%>
				<div id="foot">
			<div style="float: left; width: 50%;">
				<a
					href="${pageContext.request.contextPath}/OPFAQ1?category=<%=category %>&&num=<%=page1.getPrePageNum()%>&&method=look"
					style="padding-left: 70%;"><button type="button" class="btn btn-info"
					>上一条</button></a>
			</div>
			<div style="float: right;width: 50%; ">
				<a
					href="${pageContext.request.contextPath}/OPFAQ1?category=<%=category %>&&num=<%=page1.getNextPageNum()%>&&method=look"
					style="padding-left: 20%"><button type="button" class="btn btn-info"
					>下一条</button> </a>
			</div>

		</div>
		</div>
		
	</div>
</body>
</html>
