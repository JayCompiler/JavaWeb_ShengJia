<%@page import="com.shengjia.bean.FaqCategory"%>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/admin.js"></script>
<style type="text/css">
#m3{
	background: #BCD2EE;	
}

</style>
</head>
<body>
<% if(session.getAttribute("username")==null)
	response.sendRedirect("/ShengJia/adminpage/login.jsp");
 %>


	<div id="menu">
		<jsp:include page="/adminpage/menu.jsp" flush="true" />

	</div>
		<div id="select" style="left: 90%;">
		<font size="+1">
		<button type="button" class="btn btn-info"
				onclick="window.location.href='${pageContext.request.contextPath}/adminpage/login.jsp'">退出登录</button>
				<button type="button" class="btn btn-info"
				onclick="history.go(-1);">返回</button>
	<%-- 	 <a
			href="${pageContext.request.contextPath}/adminpage/login.jsp">退出登录</a>
	 --%>	</font>
	</div>
<div id="change">	
	<div id="content">
		<ul>
			<!-- <li><label>问题类别</label>
			<label style="right:30%;position: absolute;">操作</label>
			</li> -->
				<%
					Page page1 = (Page) request.getAttribute("pageone");
					ArrayList<FaqCategory> reCases = page1.getRecord();
					for (FaqCategory sd : reCases) {
				%>
			<li><a href="/ShengJia/FAQPage?id=<%=sd.getId()%>"><%=sd.getCategory() %></a>
			</li>
		<%} %>
		</ul>
	
	<%-- 
		<center>
			<table>
				<tr>
					<th>问题类别</th>
					<th>操作</th>
				</tr>
				<%
					Page page1 = (Page) request.getAttribute("pageone");
					ArrayList<FaqCategory> reCases = page1.getRecord();
					for (FaqCategory sd : reCases) {
				%>
				<tr>
					<td><%=sd.getCategory()%></td>
					<td><%=re.getAnswer()%></td>
					<td>
					<button type="button" class="btn btn-info"
				onclick="window.location.href='/ShengJia/FAQPage?id=<%=sd.getId()%>'">查看</button>
					<a href="/ShengJia/FAQPage?id=<%=sd.getId()%>">查看</a>&nbsp;
					
					
					
					
						<a href="/ShengJia/AFaq/EditFAQC.jsp?category=<%=sd.getCategory()%>&&id=<%=sd.getId()%>">修改</a>&nbsp;
						<a href="/ShengJia/DeFAQC?id=<%=sd.getId()%>">删除</a>
				</tr>

				<%
					}
				%>
			</table>
		</center> --%>
		<!-- 	<a href="/ShengJia/AFaq/addFAQC.jsp"
					style="font-size: 20px;left: 10%;position: absolute;">添加</a> -->
	</div>
	
	<div id="foot">
		<center>
			<!-- 分页导航开始 -->
			第<%=page1.getCurrentPage()%>页/共<%=page1.getTotalPage()%>页 &nbsp;
			&nbsp; <a href="${pageContext.request.contextPath}/FAQCPage">首页</a>
			<a
				href="${pageContext.request.contextPath}/FAQCPage?num=<%=page1.getPrePageNum()%>">上一页</a>
			<a
				href="${pageContext.request.contextPath}/FAQCPage?num=<%=page1.getNextPageNum()%>">下一页</a>
			<a
				href="${pageContext.request.contextPath}/FAQCPage?num=<%=page1.getTotalPage()%>">尾页</a>
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




