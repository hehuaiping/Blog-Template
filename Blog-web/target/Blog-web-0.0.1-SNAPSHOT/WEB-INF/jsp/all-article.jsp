<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<!-- Bootstrap Core CSS -->
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom Fonts -->
	<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="css/boot-crm.css" rel="stylesheet"type="text/css">
	<link href="layer/mobile/need/layer.css" rel="stylesheet"type="text/css">
	<link href="layui/css/layui.css" rel="stylesheet"type="text/css">
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  	
	<script type="text/javascript" src="js/jquery.min.js" ></script>
	<script type="text/javascript" src="js/bootstrap.min.js" ></script>	
	<script type="text/javascript" src="layer/layer.js" ></script>
	<script type="text/javascript" src="layui/layui.js" ></script>
	<head>
		<meta charset="UTF-8">
		<title></title>
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
		            <li><a href="#">Action</a></li>
		            <li><a href="#">Another action</a></li>
		            <li><a href="#">Something else here</a></li>
		            <li role="separator" class="divider"></li>
		            <li><a href="#">Separated link</a></li>
		            <li role="separator" class="divider"></li>
		            <li><a href="#">One more separated link</a></li>
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
		
		<!--
        	作者：1424957713@qq.com
        	时间：2017-08-30
        	描述：导航结束
        -->
        
        <!--
        	作者：1424957713@qq.com
        	时间：2017-08-30
        	描述：内容开始
        -->
        
        <div class="container" style="min-height: 720px">
        	<div class="row">
        		<div class="col-md-3" style="position: fixed;right:10%;">
					<div class="row" >
					    <div class="list-group" id="list-tab" role="tablist" >
					    
					      <a class="list-group-item list-group-item-action active" id="list-home-list" data-toggle="list" role="tab" aria-controls="home">文章类别</a>
					      <c:forEach items="${category }" var="cg">
					      		<a class="list-group-item list-group-item-action" id="list-profile-list" data-toggle="list" href="${pageContext.request.contextPath}/allArticle.controller?category_id=${cg.category_id}" role="tab" aria-controls="profile">${cg.category_name }</a>	
					      </c:forEach>
					    </div>
					</div>
				</div>
				<div class="col-md-8">
				    <c:if test="${page.list.size() == 0}">
				                            暂无数据
                    </c:if>
                    <c:if test="${page.list.size() > 0}">
						<c:forEach items="${page.list }" var="article">
							<div class="row" style="" >
						 		<div class="col-md-1" style="text-align: center;">
							 		<img src="${article.auth.head_photo}" style="vertical-align: middle;margin-left: -7px;margin-top: 26px;" width="60px" height="60px" />
							 	</div>
							 	<div class="col-md-11">
								 	<div class="page-header">
								 		<b><a href="${pageContext.request.contextPath}/readArticle.controller?article_id=${article.article_id}" style="cursor: pointer;">${article.title }</a>
								 			<small>${article.auth.user_nick }</small>
								 		</b>
										<p>
											<div style="height:50px; white-space:nowrap;text-overflow:clip;overflow:hidden; ">
																		${article.context}
											</div>
										</p>
									</div>
								</div>
							 </div>
						</c:forEach>
					</c:if>
					<!-- 分页 -->
					<ul class="pagination">
			            <c:if test="${page.list.size() > 0}">
							<li><a href="${pageContext.request.contextPath}/allArticle.controller?category_id=${category_id}&currentPage=${page.upPage}&pageSize=${page.pageSize}">上一页</a></li>
							<!-- <li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">5</a></li> -->
							<li><a href="">${page.currentPage }</a></li>
							<li><a href="${pageContext.request.contextPath}/allArticle.controller?category_id=${category_id}&currentPage=${page.nextPage}&pageSize=${page.pageSize}">下一页</a></li>
						</c:if>
					</ul> 
				</div>	
			</div>
        </div>
        
        
        <!-- 尾部 -->
		<hr />
		<div class="bd-footer text-muted">
			<div class="container">
				<p>作者:小怀</p>
				<p>联系方式 :    Email 1424957713@qq.com&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  	  Mobile 18581726213
				</p>
				<p>&copy;小怀的博客(www.lkhhp.cn)&nbsp;&nbsp;&nbsp;<a href="http://www.miitbeian.gov.cn/">蜀ICP备17020471号-1</a></p>
			</div>
		</div>

	</body>
</html>
