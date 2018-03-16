<%@page import="com.shengjia.bean.Main"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shengjia.commons.Page"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>

<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/caMa.css">
	<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
	<link type="text/css" rel="stylesheet"
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
			<%
				String category = (String) request.getAttribute("category");
			%>
			<!-- <div id="select">
				<a href="/ShengJia/page/Welcome.jsp">返回</a>
			</div> -->
			<div id="title">
				<center>
					<h1><%=category%></h1>
				</center>
			</div>

			<div id="list" style="padding-left:5%;">
				<ul>
					<%
						Page page1 = (Page) request.getAttribute("pageone");
						ArrayList<Main> reCases = page1.getRecord();
						for (Main re : reCases) {
					%>
					<li><h3>
							<a
								href="/ShengJia/main/lookmain.jsp?detail=<%=re.getDetail()%>&&content=<%=re.getContent()%>"><%=re.getDetail()%></a>
						</h3></li>
					<%
						}
					%>
				</ul>
			</div>

			<div id="foot">
				<center>
					<!-- 分页导航开始 -->
					第<%=page1.getCurrentPage()%>页/共<%=page1.getTotalPage()%>页 &nbsp;
					&nbsp; 
					<button type="button" class="btn btn-info"
					onclick="window.location.href='${pageContext.request.contextPath}/MainDePage?category=<%=category%>'"
					>首页</button>
					<button type="button" class="btn btn-info"
					onclick="window.location.href='${pageContext.request.contextPath}/MainDePage?category=<%=category%>&&num=<%=page1.getPrePageNum()%>'"
					>上一页</button>
					<button type="button" class="btn btn-info"
					onclick="window.location.href='${pageContext.request.contextPath}/MainDePage?category=<%=category%>&&num=<%=page1.getNextPageNum()%>'"
					>下一页</button>
					<button type="button" class="btn btn-info"
					onclick="window.location.href='${pageContext.request.contextPath}/MainDePage?category=<%=category%>&&num=<%=page1.getTotalPage()%>'"
					>尾页</button>
					
					<%-- <a
						href="${pageContext.request.contextPath}/MainDePage?category=<%=category%>">首页</a>
					<a
						href="${pageContext.request.contextPath}/MainDePage?category=<%=category%>&&num=<%=page1.getPrePageNum()%>">上一页</a>
					<a
						href="${pageContext.request.contextPath}/MainDePage?category=<%=category%>&&num=<%=page1.getNextPageNum()%>">下一页</a>
					<a
						href="${pageContext.request.contextPath}/MainDePage?category=<%=category%>&&num=<%=page1.getTotalPage()%>">尾页</a>
				 --%>	<select id="jump" onchange="jump(this)">
						<c:forEach begin="1" end="${pageone.getTotalPage()}" var="num">
							<option value="${num}"
								${num==pageone.getCurrentPage()?'selected="selected"':''}>${num}</option>
						</c:forEach>
					</select>
					<script type="text/javascript">
						function jump(selectobj) {
							window.location.href = "${pageContext.request.contextPath}/MainDePage?category=<%=category%>&&num=" + selectobj.value;
						}
					</script>
					<!-- 分页导结束 -->
				</center>
			</div>


		</div>

	</div>


</body>
</html>




