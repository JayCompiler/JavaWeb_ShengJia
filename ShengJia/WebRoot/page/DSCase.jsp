<%@page import="com.shengjia.bean.CaseImg"%>
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
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/dsuc.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/ShengJia/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/main.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/css.js"></script>
<title>主界面</title>

</head>
<body>
	<!--  整个页面布局 -->
	<div id="main">
		<div id="menu" align="left">
			<jsp:include page="/page/menu.jsp" flush="true" />
		</div>

		<!-- 右侧内容展示================================================== -->
		<div id="content">

			<div id="title">
				<%
					SuccessfulCase sCase = (SuccessfulCase) request.getAttribute("sCase");
				%>
				<h1><%=sCase.getCasename()%></h1>
				<hr>
			</div>
			<div id="sd">
				<div id="intro">
					<%=sCase.getDescription()%></div>
			</div>
			<%
				Page page1 = (Page) request.getAttribute("pageone");
				ArrayList<CaseImg> caseImgs = page1.getRecord();
			%>
			<div id="dSuc">
				<div id="lbt">
					<a
						href="${pageContext.request.contextPath}/OPSuc1?id=<%=sCase.getId()%>&&num=<%=page1.getPrePageNum()%>">
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
												</form>
										</div></td>
									<%
										}
									%>
								</tr>
							</table>
						</center>
					</div>
				<div id="rbt">
						<a
							href="${pageContext.request.contextPath}/OPSuc1?id=<%=sCase.getId()%>&&num=<%=page1.getNextPageNum()%>">
							<img class="lr" src="/ShengJia/img/r.png">
						</a>
				
				</div>
			</div>
			<!--点击放大图片 -->
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
			
		</div>
		<div id="foot">
				<center>
					<!-- 分页导航开始 -->
					第<%=page1.getCurrentPage()%>页/共<%=page1.getTotalPage()%>页 &nbsp;
					&nbsp; 
					<button type="button" class="btn btn-info"
					onclick="window.location.href='${pageContext.request.contextPath}/OPSuc1?id=<%=sCase.getId()%>'"
					>首页</button>

				 <button type="button" class="btn btn-info"
					onclick="window.location.href='${pageContext.request.contextPath}/OPSuc1?id=<%=sCase.getId()%>&&num=<%=page1.getTotalPage()%>'"
					>尾页</button>
						<select id="jump" onchange="jump(this)">
						<c:forEach begin="1" end="${pageone.getTotalPage()}" var="num">
							<option value="${num}"
								${num==pageone.getCurrentPage()?'selected="selected"':''}>${num}</option>
						</c:forEach>
					</select>
					<script type="text/javascript">
						function jump(selectobj) {
							window.location.href = "${pageContext.request.contextPath}/OPSuc?id=<%=sCase.getId()%>&&num=" + selectobj.value;
						}
					</script>
					<!-- 分页导结束 -->
				</center>
			</div>
		</div>
	
	
	
	</div>
</body>
</html>





