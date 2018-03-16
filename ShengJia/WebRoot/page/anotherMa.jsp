<%@page import="com.shengjia.bean.DetailMaterial"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shengjia.commons.Page"%>
<%@page import="com.shengjia.bean.Category"%>
<%@page import="com.shengjia.dao.CategoryDBO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/dsuc.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/main.js"></script>
<script type="text/javascript" src="/ShengJia/js/jquery-3.1.1.min.js"></script>

 <link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" />



<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/css.js"></script>

<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/img.css" /> --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<title>主界面</title>
<!-- <style type="text/css">
/* .lr {
	height: 60px;
	width: 50px;
}

#l {
	position: absolute;
	padding-top: 30%;
	left: -20%;
	background: none;
	color: black
}

#r {
	position: absolute;
	padding-top: 30%;
	right: -20%;
	background: none;
	color: black
} */
</style> -->
</head>
<body>
	<!--  整个页面布局 -->
	<div id="main">
		<div id="menu">
			<jsp:include page="/page/menu.jsp" flush="true" />
		</div>

		<!-- 右侧内容展示================================================== -->
		<div id="content">
			<div id="title">
				<div>
					<%
						String name = (String) request.getAttribute("name");
						CategoryDBO fDbo = new CategoryDBO();
						Category category = fDbo.queryCaseByName1(name);
					%>
					<div>
						<h1><%=name%></h1>
						<hr>
					</div>
				</div>
			</div>
			<div id="sd">
				<div id="intro">
					<%=category.getDetail()%>
				</div>
				</div>
<%Page page1 = (Page) request.getAttribute("pageone");
											ArrayList<DetailMaterial> caseImgs = page1.getRecord(); %>
				<!--细节描述  -->
				<div id="dSuc">
					<div id="lbt">
					<a
						href="${pageContext.request.contextPath}/DeMa1?name=<%=name%>&&num=<%=page1.getPrePageNum()%>">
						<img class="lr" src="/ShengJia/img/l.png">
					</a>
					</div>
					<div id="right">
						<div id="list">
							<center>
								<table>
									<tr>
										<%
											
											for (DetailMaterial dImg : caseImgs) {
										%>
										<td>
										<img alt="查看详情"
											src="/ShengJia/upload/<%=dImg.getImg()%>"
											onclick="enlarge(this);"
											style="margin-left:50px;height: 200px;width: 250px;"><br>
												
											<p style="text-align: center; "><%=dImg.getDes()%>
					
											</td>
			
										<%
											}
										%>
									</tr>
								</table>
							</center>
						</div>
						<div id="rbt">
						<a
						href="${pageContext.request.contextPath}/DeMa1?name=<%=name%>&&num=<%=page1.getNextPageNum()%>">
						<img class="lr" src="/ShengJia/img/r.png">
					</a>
						</div>
					</div>
				</div>
				<script type="text/javascript">
					function enlarge(a) {
						var height = $(a).css("height");
						var loc;
						if (height == "200px") {
							loc = $(a).css("margin-left");
							$(a).css("height", "270px");
							$(a).css("width", "400px");
							$(a).css("top", "50%");
							$(a).css("left", "50%");
						/* 						alert("1")
						 */
						} else {
							$(a).css("height", "200px");
							$(a).css("width", "250px");
							$(a).css("text-align", "center");
							$(a).css("margin-left", loc);
						/* 						alert("2");
						 */
						}
					}
				</script>
								<div id="foot">
				<center>
					<!-- 分页导航开始 -->
					第<%=page1.getCurrentPage()%>页/共<%=page1.getTotalPage()%>页 &nbsp;
					&nbsp; 
					
						<button type="button" class="btn btn-info"
					onclick="window.location.href='${pageContext.request.contextPath}/DeMa1?name=<%=name%>'"
					>首页</button>

				 <button type="button" class="btn btn-info"
					onclick="window.location.href='${pageContext.request.contextPath}/DeMa1?name=<%=name%>&&num=<%=page1.getTotalPage()%>'"
					>尾页</button>
					
					<select id="jump" onchange="jump(this)">
						<c:forEach begin="1" end="${pageone.getTotalPage()}" var="num">
							<option value="${num}"
								${num==pageone.getCurrentPage()?'selected="selected"':''}>${num}</option>
						</c:forEach>
					</select>
					<script type="text/javascript">
						function jump(selectobj) {
							window.location.href = "${pageContext.request.contextPath}/DeMa1?name=<%=name%>&&num=" + selectobj.value;
						}
					</script>
					<!-- 分页导结束 -->
				</center>
			</div>
			
			</div>
			
		
		</div>
		
		
</body>
</html>




