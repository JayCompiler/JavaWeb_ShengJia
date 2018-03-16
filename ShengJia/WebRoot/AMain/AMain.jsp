<%@page import="com.shengjia.bean.Main"%>
<%@page import="com.shengjia.bean.FAQ"%>
<%@page import="com.shengjia.dao.FAQDBO"%>
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
<link href="/ShengJia/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="/ShengJia/css/manage1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/admin.js"></script>
<style type="text/css">
#m3 {
	background: #BCD2EE;
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
				onclick="window.location.href='${pageContext.request.contextPath}/adminpage/login.jsp'">退出登录</button>
			<button type="button" class="btn btn-info" onclick="history.go(-1);">返回</button>
			<%-- <a
			href="${pageContext.request.contextPath}/adminpage/login.jsp">退出登录</a>
			<a href="/ShengJia/AMain/MainC.jsp">返回</a> --%>
		</font>
	</div>
	<%
		String category = (String) request.getAttribute("category");
	%>
	<div id="title">
		<center><%=category%></center>
	</div>
	<div id="change">
		<div id="content">

			<ul>
				<%
						Page page1 = (Page) request.getAttribute("pageone");
						ArrayList<Main> reCases = page1.getRecord();
						for (Main re : reCases) {
					%>
				<li>
				<a
					href="/ShengJia/OPMain?category=<%=category%>&&method=look"><%=re.getDetail()%></a>
				
				<button type="button" class="btn btn-info" style="left: 80%;position: absolute;"
					onclick="window.location.href='/ShengJia/AMain/editMain.jsp?id=<%=re.getId()%>'"
					>修改</button>
						<button type="button" class="btn btn-info"  style="left: 85%; position: absolute;"
					onclick="window.location.href='/ShengJia/OPMain?id=<%=re.getId()%>&&method=delete'"
					>删除</button>
					<%-- <a style="left: 80%;position: absolute;" href="/ShengJia/AMain/editMain.jsp?id=<%=re.getId()%>">修改</a>&nbsp;
					<a style="left: 85%; position: absolute;" href="/ShengJia/OPMain?id=<%=re.getId()%>&&method=delete">删除</a>
				 --%>	</li>
				<%
						}
					%>
			</ul>
	<button type="button" class="btn btn-info" style="left: 5%;position: absolute;"
					onclick="window.location.href='${pageContext.request.contextPath}/AMain/addMain.jsp?category=<%=category%>'"
					>添加</button>
			
		</div>

		<div id="foot">
			<center>
				<!-- 分页导航开始 -->
				第<%=page1.getCurrentPage()%>页/共<%=page1.getTotalPage()%>页 &nbsp;
				&nbsp; <a
					href="${pageContext.request.contextPath}/MainDePage?category=<%=category%>&&method=method">首页</a>
				<a
					href="${pageContext.request.contextPath}/MainDePage?category=<%=category%>&&method=method&&num=<%=page1.getPrePageNum()%>">上一页</a>
				<a
					href="${pageContext.request.contextPath}/MainDePage?category=<%=category%>&&method=method&&num=<%=page1.getNextPageNum()%>">下一页</a>
				<a
					href="${pageContext.request.contextPath}/MainDePage?category=<%=category%>&&method=method&&num=<%=page1.getTotalPage()%>">尾页</a>
				<select id="jump" onchange="jump(this)">
					<c:forEach begin="1" end="${pageone.getTotalPage()}" var="num">
						<option value="${num}"
							${num==pageone.getCurrentPage()?'selected="selected"':''}>${num}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					function jump(selectobj) {
						window.location.href = "${pageContext.request.contextPath}/MainDePage?category=<%=category%>&&method=method&&num=" + selectobj.value;
					}
				</script>
				<!-- 分页导结束 -->
			</center>
		</div>
	</div>
</body>
</html>




