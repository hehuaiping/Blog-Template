<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
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
		<!-- 头部 -->

		<nav class="navbar navbar-default">
		  <div class="container">
		    <!-- Brand and toggle get grouped for better mobile display -->
		    <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="${pageContext.request.contextPath}/index.controller">首页</a>
		    </div>
		
		    <!-- Collect the nav links, forms, and other content for toggling -->
		    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		      <ul class="nav navbar-nav">
		        <li class=""><a href="#">关于 <span class="sr-only">(current)</span></a></li>
		        <li><a href="#">联系</a></li>
		        <li class="dropdown">
		          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">友情连接 <span class="caret"></span></a>
		          <ul class="dropdown-menu">
		            <li><a href="">待定</a></li>
		            <!-- <li><a href="#">Another action</a></li>
		            <li><a href="#">Something else here</a></li>
		            <li role="separator" class="divider"></li>
		            <li><a href="#">Separated link</a></li>
		            <li role="separator" class="divider"></li>
		            <li><a href="#">One more separated link</a></li> -->
		          </ul>
		        </li>
		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		        <li><a href="${pageContext.request.contextPath}/toWriteBolg.controller"><span class="glyphicon glyphicon-pencil"></span>&nbsp;写一个博客</a></li>
		        <li class="dropdown">
		          	<c:if test="${sessionScope.user eq null }">
				 	   <a href="${pageContext.request.contextPath}/toLogin.controller">请登录</a>
				   </c:if>
				   <c:if test="${sessionScope.user ne null }">
				   		<a class="dropdown-toggle" data-toggle="dropdown" href="#">${user.user_nick }，您好！</a>
				   		<ul class="dropdown-menu  right-align">	
				   		   <li><a href="${pageContext.request.contextPath}/user.html?user_id=${user.user_id}">个人中心</a></li>
					 	   <li><a href="${pageContext.request.contextPath}/loginOut.controller?user_id=${user.user_id}">退出登录</a></li>
					 	</ul>
				   </c:if>
		        </li>
		      </ul>
		    </div><!-- /.navbar-collapse -->
		  </div><!-- /.container-fluid -->
		</nav>
		