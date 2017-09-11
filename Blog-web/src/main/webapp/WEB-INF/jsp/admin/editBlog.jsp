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
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ue/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/ue/ueditor.all.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/lang/zh-cn/zh-cn.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<head>
		<meta charset="utf-8" />
		<title>小怀的博客---编辑博客</title>
	</head>
	<body>
		<!-- 内容 -->
		<div class="container">
			<div class="input-group input-group-sm">
			  <span class="input-group-addon" id="sizing-addon1" >文章标题</span>
			  <input type="text" id="title" value="${article.title }" class="form-control" name="title" placeholder="文章标题" aria-describedby="sizing-addon1"/>
			</div>
			<!-- 文本编辑区域 -->
			<script id="editor" type="text/plain"  style="width:1024px; height:500px;"></script>
			<!-- 提交按钮 -->
			<div><input class="btn btn-info" onclick="submitContext()" value="保存文章"/></div>
		</div>
		<!-- 内容结束 -->
		<!-- 尾部  -->
		<!-- 现将博文内容放到code中，然后ueditor再从这里取值 -->
    	<code id="testcon" style="display:none;">
        	${article.context }
    	</code>
	</body>
<script type="text/javascript">	
	//实例编辑器
    var ue = UE.getEditor('editor');  
    //判断ueditor 编辑器是否创建成功
    ue.addListener("ready", function () {
        // editor准备好之后才可以使用
        //设置内容
        UE.getEditor('editor').execCommand('insertHtml', $('#testcon').html());
    });
   
	
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
			      //阻止执行
			      return;
			}
			
			//非空校验
			if(UE.getEditor('editor').getContent().trim() == "" ) {
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
			    //阻止执行 
				return;
			}
			//提交数据
			$.ajax({
				url : "${pageContext.request.contextPath}/admin/updateArticle.controller",
				type : "post",
				data : {"title" : $("#title").val(),"context" : UE.getEditor('editor').getContent(),"article_id" : '${article.article_id}',"auth.user_id" : ${article.auth.user_id}},
				success : function(data) {
					var index = parent.layer.getFrameIndex(window.name); //获取窗口索引  
                    parent.layer.close(index);
					//window.location.href = "${pageContext.request.contextPath}/admin/index.html"
				}
			}); 
		}	       
</script>
</html>