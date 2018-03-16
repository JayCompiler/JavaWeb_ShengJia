<%@page import="com.shengjia.bean.ReMaterial"%>
<%@page import="com.shengjia.dao.ReMaterialDBO"%>
<%@page import="com.shengjia.dao.SuccessfulCaseDBO"%>
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
<!-- <link href="/ShengJia/css/addcas.css" rel="stylesheet" type="text/css" /> -->

<link href="/ShengJia/css/bootstrap.css" rel="stylesheet" type="text/css" />
 
 <link href="/ShengJia/css/Amenu.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/admin.js"></script>
<style type="text/css">
#m2{
	background: #BCD2EE;
}
td{
	text-align: left;
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
	
		<div id="select" >
		<font size="+1"> <button type="button" class="btn btn-info"
				onclick="window.location.href='${pageContext.request.contextPath}/adminpage/login.jsp'">退出登录</button>
	
		</font>
	</div>
	
	
	<div id="change">
<% if(session.getAttribute("username")==null)
	response.sendRedirect("/ShengJia/adminpage/login.jsp");
 %>

	<center>
		<h1>修改类别</h1>
	</center>
	<div>
		<center>
		<%
			String id1=request.getParameter("id");
			int id=Integer.parseInt(id1);
			ReMaterialDBO rDbo=new ReMaterialDBO();
			ReMaterial reMaterial=rDbo.queryMaterialById(id);
		%>
			<form action="/ShengJia/EditMate?id=<%=id%>" method="post"
				enctype="multipart/form-data">
				<table border="1">
					<tr>
						<td>推荐材料类别：&nbsp;<input type="text" name="category" id="name"
							required="required" value="<%=reMaterial.getCategory()%>"></td>
						<td><span style="color: red;">*</span></td>
					</tr>
					<tr>
						<td><input type="file" id="file" name="uploadFile" required="required"></td>
						<td><span style="color: red;">*</span></td>
					</tr>
					<tr>
						<td><input type="submit" value="修改">&nbsp;
						<input type="button" value="返回上页" onclick="window.location.href='/ShengJia/CasPage'">
						</td>
						
					</tr>
				</table>
			</form>
		</center>
	</div>
	</div>
</body>
</html>