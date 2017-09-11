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
	
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
	<link href="${pageContext.request.contextPath}/layer/mobile/need/layer.css" rel="stylesheet"type="text/css">
	<link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet"type="text/css">
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<head>
		<meta charset="UTF-8">
		<title>用户注册</title>
	</head>
	<body>
		<div class="container" style="text-align: left;width: 40%;">	
			<div class="page-header">
			  <h3 style="text-align: center;">小怀的博客<small >用户登录</small></h3>
			</div>	
		<form action="${pageContext.request.contextPath}/login.controller" method="post">
		  <div class="form-group">
		    <label for="exampleInputPassword1">您的用户名</label>
		    <input type="text" class="form-control" id="" name="user_name"  placeholder="用户名">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">您的密码 </label>
		    <input type="password" class="form-control" id=""  name="user_password" placeholder="密码">
		  </div>
		  <div class="form-group">
			 <label>请输入验证码 </label>
			 <div class="input-group">
			  <span class="input-group-btn">
		      <img id="validate_code"  alt="300x200" onclick="changeImg()" src="${pageContext.request.contextPath}/getImg.controller" />
		      </span>
     	      <input type="text" style="width: 40%;" class="form-control" name="validate_code" placeholder="验证码">
			  </div><!-- /input-group -->
		 </div>
		  <div class="" style="margin: auto;">
			  <button type="submit" class="btn btn-info">登录</button>
			  <a href="${pageContext.request.contextPath}/toRegist.controller"  class="btn btn-info">注册</a>	
		  </div>
		</form>
		</div>
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
	<script type="text/javascript">
		function changeImg() {
			var code =  document.getElementById("validate_code");
			code.src = code.src+"?time="+new Date().getTime();
		}
		
		$(function(){
			layer.msg('${msg}');
		})
	</script>
</html>
