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
	<link href="${pageContext.request.contextPath}/layer/mobile/need/layer.css" rel="stylesheet"type="text/css">
	<link href="${pageContext.request.contextPath}/layui/css/layui.css" rel="stylesheet"type="text/css">
	<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js" ></script>
  	<script type="text/javascript" src="${pageContext.request.contextPath}/js/wangEditor.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js" ></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js" ></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js" ></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<head>
		<meta charset="utf-8" />
		<title>小怀的博客---写博客</title>
	</head>
	<body>
		<!-- 头 -->
		<c:import url="/header.jsp"></c:import>
		<!-- 内容 -->
		<div class="container">
			<!-- 隐藏表单用来提交 数据 -->
			<div class="hidden">
				<form id="article" name="upfile" action="${pageContext.request.contextPath}/saveArticle.controller"  method="post" >
					<input type="text" id="article_title" name="title" />
					<input type="text" id="article_context" name="context" >
				</form>
			</div>
			<div class="input-group input-group-sm">
			  <span class="input-group-addon" id="sizing-addon1" >文章标题</span>
			  <input type="text" id="title" class="form-control" name="title" placeholder="文章标题" aria-describedby="sizing-addon1"/>
			</div>
			<!-- 文本编辑区域 -->
			<form action="${pageContext.request.contextPath}/uplodaImg.controller" method="post" enctype="multipart/form-data">
				<div id="editor">
       			 	<p>请在这里写您的文章...</p>
    			</div>
			</form>
			<!-- 提交按钮 -->
			<div><input class="btn btn-info" onclick="submitContext()" value="发布文章"/></div>
		</div>
		<!-- 内容结束 -->
		<!-- 尾部  -->
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
	
	function submitContext() {
			
	
			//文章标题校验
			if($("#title").val() == "") {
				layer.open({
			        type: 1
			        ,offset: '100px' 
			        ,content: '<div style="padding: 20px 50px;">'+ '您的文章标题呢！' +'</div>'
			        ,btn: '关闭'
			        ,btnAlign: 'c' //按钮居中
			        ,shade: 0 //不显示遮罩
			        ,yes: function(){
			          layer.closeAll();
			        }
			      });
			      return;
			}
			
			//非空校验
			if(editor.txt.text().trim() == "" ) {
				layer.open({
			        type: 1
			        ,offset: '100px' 
			        ,content: '<div style="padding: 20px 50px;">'+ '请您写好文章内容后在提交吧！' +'</div>'
			        ,btn: '好的'
			        ,btnAlign: 'c' //按钮居中
			        ,shade: 0 //不显示遮罩
			        ,yes: function(){
			          layer.closeAll();
			        }
			      });
				return;
			}
			alert(editor.txt.html().trim());
			//return;
			//将数据填入表达提交
			$("#article_title").val($("#title").val());
			$("#article_context").val(editor.txt.html());
			$("#article").submit();
		}	
    
		//创建富文本编辑器
		var E = window.wangEditor
        var editor = new E('#editor')
       
        
        // 配置服务器端地址
    	editor.customConfig.uploadImgServer = '${pageContext.request.contextPath}/uplodaImg.controller';
    	//定义上传文件name
    	editor.customConfig.uploadFileName = 'upfile';
    	editor.create();
    	
    	//editor.txt.html()
</script>
</html>