<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
		<!-- 导入头 -->
		<!-- 如果是后台管理员查看文章 -->
		<c:if test="${param.admin ne null }">
			<!-- 不导入导航条 -->
			<!-- Bootstrap Core CSS -->
			<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
			<!-- Custom Fonts -->
			<link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" type="text/css">
			<link href="${pageContext.request.contextPath}/css/boot-crm.css" rel="stylesheet"type="text/css">
			<link href="${pageContext.request.contextPath}/css/wangEditor.min.css" rel="stylesheet"type="text/css">
			<link href="${pageContext.request.contextPath}/css/shCore.css" rel="stylesheet"type="text/css">
			<link href="${pageContext.request.contextPath}/css/shThemeDefault.css" rel="stylesheet"type="text/css">
			<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
			<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ue/third-party/SyntaxHighlighter/shCoreDefault.css">
			<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
		  	
			<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/js/shCore.js" ></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/js/shBrushJava.js" ></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>	
			<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js" ></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js" ></script>
			<head>
				<meta charset="utf-8" />
				<title>${article.title }</title>
			</head>
			<body>
		</c:if>
		<!-- 如果是普通用户查看文章 -->
		<c:if test="${param.admin eq null }">
			<c:import url="/header.jsp"></c:import>
		</c:if>
		<style>
			p {
				font-size: 14px;	
			}
		</style>
		<hr />	
		<!-- 内容 -->

		<!-- 博客 -->
		<div class="container">
				
				<!-- 显示文章内容 -->
				<div id="demo_text" class="thumbnail">
					<!-- 文章标题 -->
					<div class="">
						<h2 style="text-align: center;">${article.title } <small>${article.auth.user_nick }</small></h2>
						<div class="" style="position: relative;margin-left: 70%;">
							<span class="glyphicon glyphicon-eye-open">${article.views }次阅读</span>
							&nbsp;&nbsp;&nbsp;
							<span class="glyphicon glyphicon-dashboard"><fmt:formatDate value="${article.create_time }"/></span>
							
						</div>
					</div>
					<hr>
					<!-- 文章内容 -->
					<div>${article.context}</div>
				</div>
 		<!-- 博客结束 -->	
		</div>
		<!-- 尾部 -->
		<!-- 如果是管理员查看文章 -->
		<c:if test="${param.admin ne null }">
			<!-- 不导入 -->
		</c:if>
		<!-- 如果是普通用户查看文章 -->
		<c:if test="${param.admin eq null }">
			<c:import url="/footer.jsp"></c:import>
		</c:if>
	</body>
	<script type="text/javascript">
		SyntaxHighlighter.all();
	</script>
</html>
