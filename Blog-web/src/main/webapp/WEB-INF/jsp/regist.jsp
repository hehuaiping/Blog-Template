<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	 <base href="<%=basePath%>">
	<!-- Bootstrap Core CSS -->
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<!-- Custom Fonts -->
	<link href="${pageContext.request.contextPath}/css/font-awesome.min.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/css/boot-crm.css" rel="stylesheet"type="text/css">
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
			  <h3 style="text-align: center;">小怀的博客<small >注册用户</small></h3>
			</div>	
		<form action="${pageContext.request.contextPath}/regist.controller" method="POST" id="registForm">
		  <div class="form-group">
		    <label for="user_name">您的用户名  *</label>
		    <input type="text" class="form-control" onchange="checkUserName(this.value)" name="user_name" id="user_name" placeholder="用户名">
		  </div>
		  <div class="form-group">
		    <label for="user_nick">您的显示昵称</label>
		    <input type="text" class="form-control" onchange="checkNick()" disabled="disabled" name="user_nick" id="user_nick" placeholder="昵称">
		  </div>
		  <div class="form-group">
		    <label for="user_phone">您的手机号码</label>
		    <input type="text" class="form-control" disabled="disabled" onchange="checkPhone()" name="user_phone" id="user_phone" placeholder="手机号码">
		  </div>
		  <div class="form-group">
		    <label for="user_password">您的密码 </label>
		    <input type="password" class="form-control" disabled="disabled" onchange="checkPassWord()" name="user_password" id="user_password" placeholder="密码">
		  </div>
		  <div class="form-group">
		    <label for="cf_password">请确认您的密码 </label>
		    <input type="password" class="form-control" disabled="disabled" onchange="checkPassWord()" id="cf_password" placeholder="确认密码">
		  </div>
		  <div class="form-group">
		    <label for="user_birthday">请输入您的生日</label>
		    <input type="text" class="form-control laydate-icon" onchange="checkBirthday()"  disabled="disabled" name="user_birthday" id="user_birthday" placeholder="例如:1998-09-14">
		  </div>
		   <div class="form-group">
		    <label for="user_email">您的邮箱地址</label>
		    <input type="email" class="form-control"  disabled="disabled" id="user_email" name="user_email" placeholder="您的邮箱地址">
		  </div>
		  <div class="" style="margin: auto;">
			  <input type="submit" id="regist" value="注册" disabled="disabled" class="btn btn-info" />
			  <a href="${pageContext.request.contextPath}/index.controller" class="btn btn-info">登录</a>
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
		//检查用户名
		function checkUserName(name) {
			//检查用户名是否已经存在
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/checkUserName.controller",
				data : {"user_name" : name},
				success : function(data) {
					if(data != 'success') {
						layer.tips( '此用户名已被注册' , '#user_name');
						$("#user_name").addClass("alert-danger");
						$("#user_nick").attr("disabled","disabled");
						return false;
					}
					else {
						$("#user_name").removeClass("alert-danger");
						//释放下一个
						$("#user_nick").removeAttr("disabled")
					}
				}
			});
		}
		
		//检查昵称
		function checkNick(){
			if($("#user_nick").val() != null ) {
				//释放下一个
				$("#user_phone").removeAttr("disabled")
			}
		}
		
		//检查手机号码
		function checkPhone(){
			if($("#user_phone").val().length != 11 ) {
				layer.tips( '请输入正确的手机号码 ' , '#user_phone');
				$("#user_phone").addClass("alert-danger");
				$("#user_password").attr("disabled","disabled");
				return false;
			}else {
				$("#user_phone").removeClass("alert-danger");
				$("#user_password").removeAttr("disabled");
			}
		}
		
		//检查密码
		function checkPassWord() {
			var password = $("#user_password").val();
			var cfpassword = $("#cf_password").val();
			//检查密码长度
			if(password.length < 6 ) {
				layer.tips( '密码长度不足6位' , '#user_password');
				$("#user_password").addClass("alert-danger");
				$("#cf_password").attr("disabled","disabled");
				return false;
			}else {
				//释放
				$("#user_password").removeClass("alert-danger");
				$("#cf_password").removeAttr("disabled");
			}
			//检查一致
			if(password != null && cfpassword != null ) {
				if(password != cfpassword ) {
					layer.tips( '两次密码输入不匹配' , '#cf_password');
					$("#user_password").addClass("alert-danger");	
					$("#cf_password").addClass("alert-danger");	
					$("#user_birthday").attr("disabled","disabled");
					return false;
				}
				else {
					$("#user_password").removeClass("alert-danger");	
					$("#cf_password").removeClass("alert-danger");
					$("#user_birthday").removeAttr("disabled");
					
				}
			}
			
		}
		
		//检查生日
		function checkBirthday() {
			if($("#user_birthday").val()[0] == "" || $("#user_birthday").val()[0] == null ) {
				layer.tips( '请输入您的生日' , '#user_birthday');
				$("#user_email").attr("disabled","disabled");
				return false;
			}else {
				$("#user_email").removeAttr("disabled");
				checkEmail();
			}
		}
		
		function checkEmail() {
			$("#user_email").removeAttr("disabled");
			$("#regist").removeAttr("disabled");
		}
	</script>
</html>
