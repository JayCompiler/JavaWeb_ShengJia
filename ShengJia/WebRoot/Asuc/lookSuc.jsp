<%@page import="com.shengjia.bean.CaseImg"%>
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
<link href="/ShengJia/css/bootstrap.css" rel="stylesheet"
	type="text/css" />

<link href="/ShengJia/css/ma2.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/dSuc1.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/admin.js"></script>

<style type="text/css">
#m1 {
	background: #BCD2EE;
}
</style>
</head>
<body>
<div id="main">
	<%
		if (session.getAttribute("username") == null)
			response.sendRedirect("/ShengJia/adminpage/login.jsp");
	%>



	<div id="menu">
		<jsp:include page="/adminpage/menu.jsp" flush="true" />
	</div>

	<div id="select">
	<!-- 	<font size="+1"> -->

			<button type="button" class="btn btn-info"
				onclick="window.location.href='${pageContext.request.contextPath}/adminpage/login.jsp'">退出登录</button>
			<button type="button" class="btn btn-info"
				onclick="window.location.href='/ShengJia/SucServlet'">返回</button>
		<!-- </font> -->
	</div>

	<div id="change">
		<!--当前案例对象sfc  -->
		<%
			int id = (Integer) request.getAttribute("id");
			SuccessfulCaseDBO sDbo = new SuccessfulCaseDBO();
			SuccessfulCase sfc = sDbo.queryCaseById(id);
		%>
			<div id="title">
				<%=sfc.getCasename()%>
			</div>


			<div id="content">
			<div id="sd">
				<div id="intro">
					<%=sfc.getDescription()%></div>
			</div>
			<%
				Page page1 = (Page) request.getAttribute("pageone");
				ArrayList<CaseImg> caseImgs = page1.getRecord();
			%>
			<div id="dSuc">
				<div id="lbt">
					<a
						href="${pageContext.request.contextPath}/OPSuc?id=<%=id%>&&method=look&&num=<%=page1.getPrePageNum()%>">
						<img class="lr" src="/ShengJia/img/l.png">
					</a>
				</div>
				<div id="right">
					<div id="list">
						<center>
							<table>
								<tr>
									<%
										for (CaseImg dImg : caseImgs) {
									%>

									<td><div>
											<img alt="查看详情" src="/ShengJia/upload/<%=dImg.getImg()%>"
												id="image"
												style="margin-left:50px; height:200px;width: 250px;"
												onclick="enlarge(this);">
												<form style="padding-left:19%">
													<%=dImg.getDetail() %>
													<br>
								<button type="button" class="btn btn-info"
									onclick="window.location.href='/ShengJia/Asuc/addcImg.jsp?name=<%=dImg.getCasename()%>&&detail=<%=dImg.getDetail()%>&&id=<%=dImg.getId()%>'">修改</button>
								<button type="button" class="btn btn-info"
									onclick="window.location.href='/ShengJia/DeImg?id=<%=dImg.getId()%>'">删除</button>
												</form>
										</div></td>
									<%
										}
									%>
								</tr>
							</table>
						</center>
						
						<button type="button" class="btn btn-info"
					onclick="window.location.href='/ShengJia/Asuc/addcImg.jsp?flag=1&&name=<%=sfc.getCasename()%>'"
					style="left: 10%; position: absolute;">添加</button>
					</div>
				<div id="rbt">
						<a
							href="${pageContext.request.contextPath}/OPSuc?id=<%=id%>&&method=look&&num=<%=page1.getNextPageNum()%>">
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
					<a href="${pageContext.request.contextPath}/OPSuc?id=<%=id%>&&method=look">首页</a>
			
				<a href="${pageContext.request.contextPath}/OPSuc?id=<%=id%>&&method=look">尾页</a>
				
				<select id="jump" onchange="jump(this)">
					<c:forEach begin="1" end="${pageone.getTotalPage()}" var="num">
						<option value="${num}"
							${num==pageone.getCurrentPage()?'selected="selected"':''}>${num}</option>
					</c:forEach>
				</select>
				<script type="text/javascript">
					function jump(selectobj) {
						window.location.href = "${pageContext.request.contextPath}/OPSuc?id=<%=id%>&&method=look&&num=" + selectobj.value;
					}
				</script>
					<!-- 分页导结束 -->
				</center>
			</div>
		</div>
	
	</div>




</div>


</body>
</html>