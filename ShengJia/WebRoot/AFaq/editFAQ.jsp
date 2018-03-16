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

<link href="/ShengJia/css/ma.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/admin.js"></script>
	<style type="text/css">
		#m3{
			background: #BCD2EE;
		}
		td{
		text-align: left; 
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
				<button type="button" class="btn btn-info"
				onclick="history.go(-1);">返回</button>
		<%-- <a
			href="${pageContext.request.contextPath}/adminpage/login.jsp">退出登录</a>
			<a href="###" onclick="history.go(-1);">返回</a> --%>
		</font>
	</div>
	<div id="change">
		<center>
			<h1>修改常见问题</h1>
		</center>
		<div>
			<%
				int id = Integer.parseInt( request.getParameter("id"));
				FAQDBO fDBO = new FAQDBO();
				FAQ faq = fDBO.queryFAQById(id);
			%>
			<form action="/ShengJia/EditFAQ" method="post">
				<center>
					<table border="1px">

						<tr>
							<td>标签:</td>
							<td><input type="text" value="<%=faq.getCategory()%>"
								name="category"></td>

						</tr>
						<tr>
							<td>问题：</td>
							<td><input type="text" value="<%=faq.getQuestion()%>"
								name="question" required="required"></td>
						</tr>
						<tr>
							<td>解答：</td>
							<td><textarea cols="50" rows="10" name="answer"
									required="required"><%=faq.getAnswer()%></textarea></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="修改"> &nbsp;</td>

						</tr>
						<tr>
							<td><input type="hidden" name="id" value="<%=faq.getId()%>"></td>
						</tr>
					</table>
				</center>
			</form>
		</div>
	</div>
</body>
</html>



