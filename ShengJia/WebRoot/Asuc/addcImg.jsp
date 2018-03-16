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
td {
	text-align: left;
}

#m1 {
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
		<font size="+1"> <button type="button" class="btn btn-info"
				onclick="window.location.href='${pageContext.request.contextPath}/adminpage/login.jsp'">退出登录</button>
	
		</font>
	</div>
	<div id="title">
		案例管理
		<hr>
	</div>

	<div id="change">
		<form action="/ShengJia/AddImgSuc" method="post" enctype="multipart/form-data">
			<center>
				<table border="1px">
				<%
		/* 案例名称 name */
			String name = request.getParameter("name");
			/* 案例名称 name存储到session */
			session.setAttribute("name", name);
			/* 图片详细detail */
			String detail = request.getParameter("detail");
			/* 图片id */
			String id = request.getParameter("id");
			/*处理控制符号*/
			String flag1 = request.getParameter("flag");
			int flag =0;
			if(flag1!=null){
				flag=1;
			}
		
		%>
					
					<tr>			
							<td>图片描述：<input type="text" name="detail" value="<%=detail%>"
							id="detail" /></td>
					</tr>
					
					<tr>
						<td>添加图片：<input type="file" name="imgs" required="required" id="imgs" /></td>
					</tr>
					<tr>
						<td><input type="submit" value="上传">&nbsp; 
						<button type="button" class="btn btn-info"
				onclick="history.go(-1);">返回上页</button>
	</td>
					</tr>
					<tr><td><input type="hidden" value="<%=flag%>" name="flag" id="flag"></td>
						<%
							if (flag == 0) {
						%>
						<td><input type="hidden" value="<%=id%>" name="id" id="id"></td>
						<%
							}
						%>
						<td><input type="hidden" value="<%=name%>" name="casename" id="casename"> </td>
							</tr>
				</table>
			</center>
		</form>
	</div>
</body>
</html>