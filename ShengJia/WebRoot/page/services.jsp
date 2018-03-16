<%@page import="com.shengjia.commons.Page"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<!-- <font size="+1"><a href="/ShengJia/page/Welcome.jsp">返回欢迎界面</a>
		</font> -->
	</div>
	<div id="title">
		<h1>服务项目</h1>
		<hr>
	</div>
	
	<div id="intro1">
		<h3 align="left"><b>查新服务</b></h3>
		<p class="text">通过各种检索手段，运用综合分析和对比等方法，对申报各级科技计划、各种基金、
			新产品开发计划的项目，各级成果鉴定、验收、评估、转化的项目，申报国家级、省（部）级科学技术奖励的项目，技术引进项目及其它国家、地方有关规定要求查
			新的项目进行查新，对项目的新颖性提供客观事实依据，提交科技查新报告。
		<h3 align="left"><b>查新服务文献检索</b></h3>
		<p class="text">
			针对自然科学、社会科学及人文科学各个学科、各种目的的研究课题，以描述课题的主题词、关键词作为检索入口，从开题立项、研究中期、直到成果验收，开展全程的文献检索服务。检索结果以提供文献的文摘和全文的方式来实现。
		
		<h3 align="left"><b>定题服务</b></h3>
		<p class="text">根据用户提出的各类专题进行检索咨询，为用户提供定期或不定期的专项信息服务。包括中外文专利、中文期刊、成果、企业产品、经济新闻、标准等方面的检索服务。
	</div>
		</div>
	</div>
</body>
</html>










