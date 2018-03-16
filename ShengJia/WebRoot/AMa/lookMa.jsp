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
<!-- <link href="/ShengJia/css/ma.css" rel="stylesheet" type="text/css" />
 -->
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

	<div id="menu">
		<jsp:include page="/adminpage/menu.jsp" flush="true" />

	</div>
<%
		int id = (Integer) request.getAttribute("id");
		ReMaterialDBO sDbo = new ReMaterialDBO();
		ReMaterial sfc = sDbo.queryMaterialById(id);
	%>
	<div id="select">
		<font size="+1">
			<button type="button" class="btn btn-info"
				onclick="window.location.href='/ShengJia/CasPage'">返回</button>&nbsp;&nbsp;
			<button type="button" class="btn btn-info"
				onclick="window.location.href='${pageContext.request.contextPath}/adminpage/login.jsp'">退出登录</button>

		</font>
	</div>
	<%
								Page page1 = (Page) request.getAttribute("pageone");
								ArrayList<Category> reCases = page1.getRecord();
			%>
				
	<div id="content">
	<div id="dSuc">
				<center><h3><%=sfc.getCategory() %></h3></center>
			<div id="lbt">
				<a
					href="${pageContext.request.contextPath}/OPMa?id=<%=id%>&&method=look&&num=<%=page1.getPrePageNum()%>">
					<img class="lr" src="/ShengJia/img/l.png">
				</a>
			</div>
			<div id="right">
				<div id="list">
					<center>
						<table>
							<tr>
								<%
										for (Category re : reCases) {
									%>
								<td><a
									href="/ShengJia/DeMa?name=<%=re.getName()%>"> <img
										alt="查看详情" src="/ShengJia/upload/<%=re.getImg()%>"
										name="<%=re.getId()%>"
										style="margin:50px;height: 200px;width: 250px;"
										onmouseover="dis(this);" onmouseout="hid(this);">

								</a>
									<form>
										<label style="padding-left: 40%"> <%=re.getName()%></label><br>
										<label style="padding-left: 30%">
										<button type="button" class="btn btn-info"
											onclick="window.location.href='/ShengJia/AMa/editSecondMa.jsp?id=<%=re.getId()%>&&name=<%=re.getCategory()%>&&name1=<%=re.getName()%>&&detail=<%=re.getDetail()%>'">修改</button>
										&nbsp;
										<button type="button" class="btn btn-info"
											onclick="window.location.href='/ShengJia/OPCas?name=<%=re.getName()%>&&method=delete&&id=<%=re.getId()%>'">删除</button>
											</label>
									</form></td>
								<%
										}
									%>

							</tr>
						</table>
					</center>
					<button type="button" class="btn btn-info" style="font-size: 15px;left: 10%; position: absolute;"
				onclick="window.location.href='/ShengJia/AMa/addSecondMa.jsp?name=<%=sfc.getCategory()%>&&id=1'">添加</button>
	

				</div>
				<div id="rbt">
					<a
						href="${pageContext.request.contextPath}/OPMa?id=<%=id%>&&method=look&&num=<%=page1.getNextPageNum()%>">
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
				<a href="${pageContext.request.contextPath}/OPMa?id=<%=id%>&&method=look">首页</a>
				<a href="${pageContext.request.contextPath}/OPMa?id=<%=id%>&&method=look&&num=<%=page1.getTotalPage()%>">尾页</a>
				<select id="jump" onchange="jump(this)">
					<c:forEach begin="1" end="${pageone.getTotalPage()}" var="num">
						<option value="${num}"
							${num==pageone.getCurrentPage()?'selected="selected"':''}>${num}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					function jump(selectobj) {
						window.location.href = "${pageContext.request.contextPath}/OPMa?id=<%=id%>&&method=look&&num=" + selectobj.value;
					}
				</script>
				<!-- 分页导结束 -->
			</center>
		</div>
	</div>


</body>
</html>









