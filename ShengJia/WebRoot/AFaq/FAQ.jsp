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
<link href="/ShengJia/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="/ShengJia/css/manage.css" rel="stylesheet" type="text/css" />
<link href="/ShengJia/css/Amenu.css" rel="stylesheet" type="text/css" />
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
	<div id="select" style="padding-left: 85%;">
		<font size="+1"> 
		<button type="button" class="btn btn-info"
					onclick="window.location.href='${pageContext.request.contextPath}/adminpage/login.jsp'"
					>退出登录</button>
<%-- 		<a
			href="${pageContext.request.contextPath}/adminpage/login.jsp">退出登录</a> --%>
			<button type="button" class="btn btn-info"
					onclick="window.location.href='/ShengJia/FAQCPage'"
					>返回</button>
			<!-- <a href="/ShengJia/FAQCPage">返回</a> -->
		</font>
	</div>
	<%
		String category = (String) request.getAttribute("category");
		int id=(Integer)request.getAttribute("id");
	%>
	
	<div id="title">
<%-- 		<%=id %>
 --%>		<center><%=category %></center>
	</div>
	<div id="change">
		<div id="content">

			<center>
				<table>
					
					<%
						Page page1 = (Page) request.getAttribute("pageone");
						ArrayList<FAQ> reCases = page1.getRecord();
						for (FAQ re : reCases) {
					%>
					<tr>
						<td style="padding-bottom: 2%;">
						<a href="/ShengJia/OPFAQ?category=<%=category%>&&method=look">
						<%=re.getQuestion().subSequence(0, 2) + "..."%></a></td>
						<td>
					<%-- 	<button type="button" class="btn btn-info"
					onclick="window.location.href='/ShengJia/OPFAQ?category=<%=category%>&&method=look'"
					>查看</button> --%>
					<button type="button" class="btn btn-info"
					onclick="window.location.href='/ShengJia/AFaq/editFAQ.jsp?id=<%=re.getId()%>'"
					>修改</button>
					<button type="button" class="btn btn-info"
					onclick="window.location.href='/ShengJia/OPFAQ?id=<%=re.getId()%>&&method=delete'"
					>删除</button>
					</tr>

					<%
						}
					%>
				</table>
			</center>
				<button type="button" class="btn btn-info" style="margin-top:50px;font-size: 15px;margin-left: 50px;"
					onclick="window.location.href='/ShengJia/AFaq/addFAQ.jsp?category=<%=category%>'"
					>添加</button>
			<%-- <a href="/ShengJia/AFaq/addFAQ.jsp?category=<%=category%>"
				style="margin-top:50px;font-size: 20px;margin-left: 50px;">添加</a> --%>
		</div>

		<div id="foot" style="margin-top: -10%">
			<center>
				<!-- 分页导航开始 -->
				第<%=page1.getCurrentPage()%>页/共<%=page1.getTotalPage()%>页 &nbsp;
				&nbsp; <a href="${pageContext.request.contextPath}/FAQPage?id=<%=id%>">首页</a> <a
					href="${pageContext.request.contextPath}/FAQPage?num=<%=page1.getPrePageNum()%>&&id=<%=id%>">上一页</a>
				<a
					href="${pageContext.request.contextPath}/FAQPage?num=<%=page1.getNextPageNum()%>&&id=<%=id%>">下一页</a>
				<a
					href="${pageContext.request.contextPath}/FAQPage?num=<%=page1.getTotalPage()%>&&id=<%=id%>">尾页</a>
				<select id="jump" onchange="jump(this)">
					<c:forEach begin="1" end="${pageone.getTotalPage()}" var="num">
						<option value="${num}"
							${num==pageone.getCurrentPage()?'selected="selected"':''}>${num}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					function jump(selectobj) {
						window.location.href = "${pageContext.request.contextPath}/FAQPage?num=" + selectobj.value;
					}
				</script>
				<!-- 分页导结束 -->
			</center>
		</div>
	</div>
</body>
</html>




