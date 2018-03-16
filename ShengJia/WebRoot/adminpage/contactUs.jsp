<%@page import="com.shengjia.bean.Message"%>
<%@page import="com.shengjia.dao.MessageDBO"%>
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
	#m4{
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
	
	<div id="select" style="margin-bottom: 4%;padding-left: 90%;">
		<font size="+1"> 
		<button type="button" class="btn btn-info"
					onclick="window.location.href='${pageContext.request.contextPath}/adminpage/login.jsp'"
					>退出登录</button>
		<%-- <a
			href="${pageContext.request.contextPath}/adminpage/login.jsp">退出登录</a>
			 --%>
			
		</font>
		 <br>
		 <br>
		 <br>
	</div>
	
	<div id="change">
	<div id="content">
			<center>
			<table >
				<tr>
					<th>姓名</th>
					<th>电话</th>
					<th>留言日期</th>
					<th>操作</th>
				</tr>
				<%
					Page page1 = (Page) request.getAttribute("pageone");
					ArrayList<Message> reCases = page1.getRecord();
					int count=1;
					for (Message re : reCases) {
					
				%>
				<tr >
					<td style="padding-bottom: 10px;"><%=re.getName()%></td>
					<td style="padding-bottom: 10px;"><%=re.getTelephone()%></td>
					<td style="padding-bottom: 10px;"><%=re.getDate()%></td>
					<td style="padding-bottom: 10px;">
					<button type="button" class="btn btn-info"
					onclick="window.location.href='/ShengJia/DeleteMessage?id=<%=re.getId()%>'"
					>删除</button>
					<button type="button" class="btn btn-info"
					onclick="window.location.href='${pageContext.request.contextPath}/mesPage1?num=<%=count++%>'"
					>查看</button>
	<%-- 				<a href="/ShengJia/DeleteMessage?id=<%=re.getId()%>">删除</a>&nbsp;
					<a href="${pageContext.request.contextPath}/mesPage1?num=<%=count++%>">查看</a> --%>
						<%-- <a href="/ShengJia/DetailMessage?id=<%=re.getId()%>">查看</a> --%></td>		
				</tr>
				<%
					}
				%>

			</table>
		</center>
		<br>
	</div>

	<div id="foot" style="margin-top:-7%;">
		<center>
			<!-- 分页导航开始 -->
			第<%=page1.getCurrentPage()%>页/共<%=page1.getTotalPage()%>页 &nbsp;
			&nbsp; <a href="${pageContext.request.contextPath}/mesPage">首页</a>
			<a
				href="${pageContext.request.contextPath}/mesPage?num=<%=page1.getPrePageNum()%>">上一页</a>
			<a
				href="${pageContext.request.contextPath}/mesPage?num=<%=page1.getNextPageNum()%>">下一页</a>
			<a
				href="${pageContext.request.contextPath}/mesPage?num=<%=page1.getTotalPage()%>">尾页</a>
			<select id="jump" onchange="jump(this)">
				<c:forEach begin="1" end="${pageone.getTotalPage()}" var="num">
					<option value="${num}"
						${num==pageone.getCurrentPage()?'selected="selected"':''}>${num}</option>
				</c:forEach>
			</select>
			<script type="text/javascript">
				function jump(selectobj) {
					window.location.href = "${pageContext.request.contextPath}/mesPage?num=" + selectobj.value;
				}
			</script>
			<!-- 分页导结束 -->
		</center>
	</div>
	</div>
</body>
</html>











