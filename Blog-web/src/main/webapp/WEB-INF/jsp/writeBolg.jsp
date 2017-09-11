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
		<title>小怀的博客---写博客</title>
	</head>
	<body>
		<!-- 头 -->
		<c:import url="/header.jsp"></c:import>
		<!-- 内容 -->
		<div class="container">
		    <div>
		                  文章分类
		      <select name="category_id" id="category">
		          <option value=""/>---请选择---
		          <c:forEach items="${listCategory}" var="category" >
		              <option value="${category.category_id }"/>${category.category_name}
		          </c:forEach>
		      </select>
		    </div>  
			<div class="input-group input-group-sm">
			  <span class="input-group-addon" id="sizing-addon1" >文章标题</span>
			  <input type="text" id="title" class="form-control" name="title" placeholder="文章标题" aria-describedby="sizing-addon1"/>
			</div>
			<!-- 文本编辑区域 -->
			<script id="editor" type="text/plain"  style="height:500px;"></script>
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
	//实例编辑器
    var ue = UE.getEditor('editor');  
	
	function submitContext() {
	        //文章列表校验
	        if($("#category").val() == "") {
	           layer.open({
	                type: 1
                    ,offset: '100px' 
                    ,content: '<div style="padding: 20px 50px;">'+ '请您选择文章类别！' +'</div>'
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
				url : "${pageContext.request.contextPath}/saveArticle.controller",
				type : "post",
				data : {"title" : $("#title").val(),"context" : UE.getEditor('editor').getContent(),"category_id":$("#category").val()},
				success : function(data) {
					window.location.href = "${pageContext.request.contextPath}/index.controller"
				}
			});
		}	
		
</script>
</html>