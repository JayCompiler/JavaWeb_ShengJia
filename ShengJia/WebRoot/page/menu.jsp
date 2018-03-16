
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>主界面</title>

</head>
<body>
	<a id="nav0" class="nav_list"
		href="${pageContext.request.contextPath}/page/Welcome.jsp"> <span>
			主页</span>
	</a>
	<a id="nav1" class="nav_list"
		href="${pageContext.request.contextPath}/SuccServlet"> <span>
			成功案例</span>
	</a>
	<a id="nav2" class="nav_list"
		href="${pageContext.request.contextPath}/MateServlet"> <span>推荐材料</span>
	</a>
	<a id="nav3" class="nav_list" href="${pageContext.request.contextPath}/page/services.jsp">
		<span>服务项目</span>

	</a>
	<a id="nav4" class="nav_list"
		href="${pageContext.request.contextPath}/page/contactUs.jsp"> <span>联系我们</span>

	</a>
	<a id="nav5" class="nav_list"
		href="${pageContext.request.contextPath}/FAQCPage1"> <span>
			常见问题</span>
	</a>
	<a id="nav6" class="nav_list" href="${pageContext.request.contextPath}/page/aboutUs.jsp">
		<span>关于我们</span>
	</a>
</body>
</html>




