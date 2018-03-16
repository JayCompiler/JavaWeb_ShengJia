<%@page import="com.shengjia.commons.Page"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shengjia.dao.FAQDBO"%>
<%@page import="com.shengjia.bean.FAQ"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/style.css"
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
		<div id="content" class="content">
			<div id="select">
	<%-- 	<font size="+1"> <a href="${pageContext.request.contextPath}/page/Welcome.jsp">返回欢迎界面</a>
		</font> --%>
	</div>
	<div id="title">
		<h1>关于我们</h1>
		<hr>
		</div>
	<div id="intro1">成立于一九九三年八月，上海盛加科技有限公司是上海著名高等学府
		—上海大学下属的一家集科研、教学、生产实践为一体的高科技工程公司。公司市政工程部专门从事市政工程与建筑楼宇自动化控制系统、低压配电与控制开关柜设计制作、净水、污水处理工程项目及建筑给排水机电成套设备项目的配套。2012年，上海盛加科技有限公司携手贵州水矿控股集团有限公司、上海复旦水务工程技术有限公司、上海亚同环保实业有限公司共同创
		办贵州申城高科环境发展股份有限公司。该公司旨在打造西南地区最高端综合技术的节能环保企业平台，以投资、技术、建设、营运四大服务方式，不断开辟电力和
		自动化技术、节能系统工程、水务、固体废物和危险废物处理等节能环保产业市场，从而积极融入全省推进生态文明建设的大格局中。
		公司可提供从系统设计、设备选型、设备引进、现场安装调试、试运行、操作人员培训及设备维修保养等一条龙服务工作，并长期提供售后服务。
		作为电气自控行业的高新技术企业，盛加科技公司依靠上海大学雄厚的技术与人力优势，拥有广泛的、综合的工业与工程知识，已成为建筑工程、市政工程、环保工程行业及工矿企业工程顶尖的配电（强电）与中控（弱电）成套制造企业。
	</div>
		</div>
	</div>
</body>
</html>