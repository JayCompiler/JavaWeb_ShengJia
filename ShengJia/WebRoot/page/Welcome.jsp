<%@page import="com.shengjia.dao.MainDao"%>
<%@page import="com.shengjia.bean.Main"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/ShengJia/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/main.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/css.js"></script>
	<link type="text/css" rel="stylesheet" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/mainpage.css">
	<link type="text/css" rel="stylesheet" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.css">
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
		<div id="top">
			<center>
				<p style="font-size: 50px ">
					主页 <a
						href="${pageContext.request.contextPath}/page/mainpage.jsp"><%--  <img
						src="${pageContext.request.contextPath}/img/btn1.png" alt="转到主界面"
						height="auto" width="auto" border="1" /> --%>
					</a>
					<hr>
			</center>
		</div>

		<div id="bottom" >
			<%
				MainDao mDao = new MainDao();
				ArrayList<Main> m1List = mDao.queryCaseByCategory("公司新闻");
				ArrayList<Main> m2List = mDao.queryCaseByCategory("近期活动");
				ArrayList<Main> m3List = mDao.queryCaseByCategory("通知公告");
			%>
			<div id="news" style="float: left;"class="ss">
				<div class="content">
					<center>
						<h3>公司新闻</h3>
					</center>
					<ul>
						<%
							int c3 = 0;
							for (Main m : m1List) {
								c3 = c3 + 1;
								if (c3 < 8) {
						%>
						<li style="left: 2%"><a
							href="/ShengJia/main/lookmain.jsp?detail=<%=m.getDetail()%>&&content=<%=m.getContent()%>"><%=m.getDetail()%></a></li>
						<%
							} else {
									break;
								}
							}
						%>
					</ul>
				</div>
				<div class="foot">
					<a href="/ShengJia/MainDePage?category=公司新闻">更多...</a>

				</div>
			</div>
			<div id="right" style="float: right;">
				<div id="active" style="float: left;">
					<div class="content">
						<center>
							<h3>近期活动</h3>
						</center>
						<ul>
							<%
								int c1 = 0;
								for (Main m : m2List) {
									c1 = c1 + 1;
									if (c1 < 8) {
							%>
							<li style="left: 2%"><a
								href="/ShengJia/main/lookmain.jsp?detail=<%=m.getDetail()%>&&content=<%=m.getContent()%>"><%=m.getDetail()%></a></li>
							<%
								} else {
										break;
									}
								}
							%>
						</ul>
					</div>
					<div class="foot">
						<a href="/ShengJia/MainDePage?category=近期活动">更多...</a>
					</div>
				</div>
				<div id="inf" style="float: right;">
					<div class="content">
						<center>
							<h3>通知公告</h3>
						</center>
						<ul>
							<%
								int c2 = 0;
								for (Main m : m3List) {
									c2 = c2 + 1;
									if (c2 < 8) {
							%>
							<li style="left: 2%"><a
								href="/ShengJia/main/lookmain.jsp?detail=<%=m.getDetail()%>&&content=<%=m.getContent()%>"><%=m.getDetail()%></a></li>
							<%
								} else {
										break;
									}
								}
							%>
						</ul>
					</div>
					<div class="foot">
						<a href="/ShengJia/MainDePage?category=通知公告">更多...</a>
					</div>
				</div>
			</div>
		</div>
		
		</div>
	</div>
</body>
</html>