<%@page import="java.util.concurrent.CountDownLatch"%>
<%@page import="com.shengjia.bean.FaqCategory"%>
<%@page import="com.shengjia.commons.Page"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shengjia.dao.FAQDBO"%>
<%@page import="com.shengjia.bean.FAQ"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/style.css"
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
		<div id="content" class="content">
			<div id="select">
				<!-- <font size="+1"><a href="/ShengJia/page/Welcome.jsp">返回欢迎界面</a>
				</font> -->
			</div>
			<div id="title">
				<h1>类别</h1>
				<hr>
			</div>


			<div id="intro1">
				<!-- <h3 >问题类别</h3> -->
				<ul>

					<%
					Page page1 = (Page) request.getAttribute("pageone");
					ArrayList<FaqCategory> reCases = page1.getRecord();
					int count=0;
					for (FaqCategory sd : reCases) {
				%>
					<li class="co"><a
						href="${pageContext.request.contextPath}/FAQPage1?id=<%=sd.getId()%>"><%=sd.getCategory()%></a></li>
					<%
						}
					%>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>