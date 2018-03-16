<%@page import="com.shengjia.bean.ReMaterial"%>
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
<!-- <link href="/ShengJia/css/manage.css" rel="stylesheet" type="text/css" /> -->
<link href="/ShengJia/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link href="/ShengJia/css/manageSuc.css" rel="stylesheet"
	type="text/css" />


<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/admin.js"></script>
<style type="text/css">
#m2 {
	background: #BCD2EE;
}
</style>
</head>
<body>
	<%
		if (session.getAttribute("username") == null)
			response.sendRedirect("/ShengJia/adminpage/login.jsp");
	%>
	<!-- 菜单 -->
	<div id="menu">
		<jsp:include page="/adminpage/menu.jsp" flush="true" />

	</div>
	
	
		<div id="select">
		<font size="+1">
			<button type="button" class="btn btn-info"
				onclick="window.location.href='/ShengJia/AMa/addcas.jsp'">添加</button>&nbsp;&nbsp;
			<button type="button" class="btn btn-info"
				onclick="window.location.href='${pageContext.request.contextPath}/adminpage/login.jsp'">退出登录</button>

		</font>
	</div>

	<div id="content">
		<%
				Page page1 = (Page) request.getAttribute("pageone");
				ArrayList<ReMaterial> reCases = page1.getRecord();
			%>
		<div id="dSuc">
			<div id="lbt">
				<a
					href="${pageContext.request.contextPath}/CasPage?num=<%=page1.getPrePageNum()%>">
					<img class="lr" src="/ShengJia/img/l.png">
				</a>
			</div>
			<div id="right">
				<div id="list">
					<center>
						<table>
							<tr>
								<%
										for (ReMaterial re : reCases) {
									%>
								<td><a
									href="/ShengJia/OPMa?id=<%=re.getId()%>&&method=look"> <img
										alt="查看详情" src="/ShengJia/upload/<%=re.getImg()%>"
										name="<%=re.getId()%>"
										style="margin:50px;height: 200px;width: 250px;"
										onmouseover="dis(this);" onmouseout="hid(this);">

								</a>
									<form>
										<label style="padding-left: 40%"> <%=re.getCategory()%></label><br>
										<label style="padding-left: 30%">
										<button type="button" class="btn btn-info"
											onclick="window.location.href='/ShengJia/OPCas?id=<%=re.getId()%>&&method=edit'">修改</button>
										&nbsp;
										<button type="button" class="btn btn-info"
											onclick="window.location.href='/ShengJia/OPMa?id=<%=re.getId()%>&&method=delete'">删除</button>
											</label>
									</form></td>
								<%
										}
									%>

							</tr>
						</table>
					</center>

				</div>
				<div id="rbt">
					<a
						href="${pageContext.request.contextPath}/CasPage?num=<%=page1.getNextPageNum()%>">
						<img class="lr" src="/ShengJia/img/r.png">
					</a>
				</div>
			</div>
		</div>

		<div id="foot">
			<center>
				<!-- 分页导航开始 -->
				第<%=page1.getCurrentPage()%>页/共<%=page1.getTotalPage()%>页 &nbsp;
				&nbsp;
				<a href="${pageContext.request.contextPath}/CasPage">首页</a>
				<a href="${pageContext.request.contextPath}/CasPage?num=<%=page1.getTotalPage()%>">尾页</a>
					<select id="jump" onchange="jump(this)">
					<c:forEach begin="1" end="${pageone.getTotalPage()}" var="num">
						<option value="${num}"
							${num==pageone.getCurrentPage()?'selected="selected"':''}>${num}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					function jump(selectobj) {
						window.location.href = "${pageContext.request.contextPath}/CasPage?num=" + selectobj.value;
					}
				</script>
				<!-- 分页导结束 -->
			</center>
		</div>
	</div>

</body>
</html>