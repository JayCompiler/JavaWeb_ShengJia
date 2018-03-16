<%@page import="com.shengjia.bean.ReMaterial"%>
<%@page import="com.shengjia.dao.ReMaterialDBO"%>
<%@page import="com.shengjia.dao.SuccessfulCaseDBO"%>
<%@page import="com.shengjia.bean.SuccessfulCase"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/ShengJia/js/jquery-1.12.3.min.js"></script>
</head>
<body>
<% if(session.getAttribute("username")==null)
	response.sendRedirect("/ShengJia/adminpage/login.jsp");
 %>

	<center>
		<h1>修改推荐材料类别</h1>
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
						<td><input type="submit" value="修改基本信息">&nbsp;</td>
					</tr>
					<tr>
						<td><input type="button"
							onclick="window.location.href='/ShengJia/MatePage'" value="返回上一页"></td>
					</tr>
					<tr>
						<td><a href="#" onclick="deli();">点击继续修改：修改详细材料</a></td>
					</tr>
				</table>
				<script>
					function deli() {
						var name = document.getElementById("name").value;
						var file=document.getElementById("file").value;
						if (name != ""&& file!="") {
							window.location.href = "/ShengJia/adminpage/editSecondMa.jsp?name=" + name+"&&id="+<%=id%>;
						} else {
							alert("请填写推荐材料类别并上传文件");
						}
					}
				</script>
			</form>

		</center>

	</div>
</body>
</html>