<%@page import="com.shengjia.bean.ReMaterial"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shengjia.dao.SuccessfulCaseDBO"%>
<%@page import="com.shengjia.commons.Page"%>
<%@page import="java.util.List"%>
<%@page import="com.shengjia.bean.SuccessfulCase"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/suc.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/ShengJia/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/main.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/css.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<title>主界面</title>

</head>
<body>
	<!--  整个页面布局 -->
	<div id="main">
		<div id="menu" align="left">
						 <jsp:include   page="/page/menu.jsp" flush="true"/>

		</div>

		<!-- 右侧内容展示================================================== -->
		<div id="content" class="content">
	<!-- 		<div id="select">
				<font size="+1"> <a href="/ShengJia/page/Welcome.jsp">返回欢迎界面</a>
				</font>
			</div> -->

			<div id="title">
				<h1>推荐材料</h1>
				<hr>
			</div>

			<div id="dSuc">
			<%Page page1 = (Page) request.getAttribute("pageone");
				ArrayList<ReMaterial> reCases = page1.getRecord();
				 %>
			<div id="lbt">
			<a
						href="${pageContext.request.contextPath}/MateServlet?num=<%=page1.getPrePageNum()%>">
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
							<td><a href="/ShengJia/OPMa1?id=<%=re.getId()%>"><img
									alt="查看详情" src="/ShengJia/upload/<%=re.getImg()%>" id="image"
									style="margin:50px;50px;height: 200px;width: 250px;"></a>
								<p style="text-align: center;margin-top: 10px;">
									<%=re.getCategory()%>
								</p></td>
							<%
								}
							%>
						</tr>
					</table>
				</center>
				</div>
				<div id="rbt">
					<a
						href="${pageContext.request.contextPath}/MateServlet?num=<%=page1.getNextPageNum()%>">
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
					
					<button type="button" class="btn btn-info"
					onclick="window.location.href='${pageContext.request.contextPath}/MateServlet'"
					>首页</button>

				 <button type="button" class="btn btn-info"
					onclick="window.location.href='${pageContext.request.contextPath}/MateServlet?num=<%=page1.getTotalPage()%>'"
					>尾页</button>
					
		
					<select id="jump" onchange="jump(this)">
						<c:forEach begin="1" end="${pageone.getTotalPage()}" var="num">
							<option value="${num}"
								${num==pageone.getCurrentPage()?'selected="selected"':''}>${num}</option>
						</c:forEach>
					</select>
					<script type="text/javascript">
						function jump(selectobj) {
							window.location.href = "${pageContext.request.contextPath}/MateServlet?num=" + selectobj.value;
						}
					</script>
					<!-- 分页导结束 -->
				</center>
			</div>
		</div>
	</div>
</body>
</html>





