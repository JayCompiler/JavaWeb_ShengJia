<%@page import="com.shengjia.bean.ReMaterial"%>
<%@page import="com.shengjia.bean.Category"%>
<%@page import="com.shengjia.dao.ReMaterialDBO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shengjia.dao.CaseImgDAO"%>
<%@page import="com.shengjia.bean.CaseImg"%>
<%@page import="com.shengjia.dao.SuccessfulCaseDBO"%>
<%@page import="com.shengjia.bean.SuccessfulCase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.shengjia.commons.Page"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>后台管理</title>

<link href="/ShengJia/css/bootstrap.css" rel="stylesheet"
	type="text/css" />

<link href="/ShengJia/css/Amenu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/admin.js"></script>
<style type="text/css">
#m2 {
	background: #BCD2EE;
}

td {
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

		</font>
	</div>
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		ReMaterialDBO sDbo = new ReMaterialDBO();
		ReMaterial sfc = sDbo.queryMaterialById(id);
	%>
	<!-- <div id="title">
		材料管理
		<hr>
	</div> -->

	<div id="change">
		<div id="content">
			<%
				String category = request.getParameter("name");
				session.setAttribute("category", category);
			%>
			<center>
				材料所属类别 ：<%=category%></center>
			<form action="/ShengJia/AddSecondMa" method="post"
				enctype="multipart/form-data">
				<center>

					<table border="1px">
						<tr>
							<td>详细材料名：</td>
							<td><input type="text" name="materialname" id="materialname"
								required="required"></td>
							<td><span style="color: red;">*</span>必填</td>
						</tr>
						<tr>
							<td>详细材料描述：</td>
							<td><textarea cols="40" rows="10" required="required"
									name="detail"></textarea></td>
							<td><span style="color: red;">*</span>必填</td>
						</tr>
						<tr>
							<td>选择要上传的文件：</td>
							<td><input type="file" name="imgs" required="required" /></td>
						</tr>
						<tr>
							<td colspan="2"><input type="submit" value="上传">
								&nbsp;<input type="button" value="返回" onclick="history.go(-1);"></td>
						</tr>
					</table>
				</center>
			</form>
		</div>
	</div>
</body>
</html>
