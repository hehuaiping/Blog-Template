<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:import url="/header.jsp"/>
		
		<!--  内容 -->
		<div class="container">
			<div class="jumbotron col-md-12">
				<div class="col-md-6" style="border-right-style: solid;">
				  <a href="#" id="" style="text-align: center;"><span id="photo_text" style="position:absolute; margin-top: 42px;margin-left: 21px;display: none">修改图片</span>
				  	<c:if test="${user.head_photo eq null }">
				  		<img id="head_photo" src="${pageContext.request.contextPath}/img/head_photo/head_photo_default.jpg" width="100px" height="100px;" alt="头像" class="img-circle">
				  	</c:if>
				  	<c:if test="${user.head_photo ne null }">
				  		<img id="head_photo" src="https://static.oschina.net/uploads/user/1752/3505017_100.jpg?t=1495701539000" alt="头像" class="img-circle">
				  	</c:if>
				  </a>
				  <h3>${user.user_nick }<small>${user.user_address }</small></h3>
				  <p>
				  		<c:if test="${user.description eq null }">
				  			没有关于我的描述
				  		</c:if>	
				  		<c:if test="${user.description ne null }">
				  			${user.description}
				  		</c:if>	
				  </p> 
				  <p>加入于 <fmt:formatDate value="${user.user_create_time }"/> </p>
				  <p><a class="btn btn-primary btn-lg" href="#" role="button">写博客</a></p>
				</div>
				<div class="col-md-6" id="articleInfo">
					<p>我写的博文：<small id="countAte"></small></p>
					<p>我最近的博文：
						<div id="recentlyAte" style=""></div>
					</p>
					<p>最多人浏览的博文：
						<div id="readMostAte" style=""></div>
					</p>
				</div>
			</div>
		</div>
		<!--  内容结束 -->
		
		<!-- 导入尾部 -->
		<c:import url="/footer.jsp"/>
  </body>
  <script type="text/javascript">
  	//鼠标移入头像
  	$("#head_photo").mouseover(function(){
  		 $("#head_photo").css("opacity","0.5");
  		 $("#photo_text").css("display","");
  	});
  	//鼠标移出头像
  	$("#head_photo").mouseout(function(){
  		$("#head_photo").css("opacity","");
  		 $("#photo_text").css("display","none");
  	});
  	
  	//当页面加载完成时
  	$(function(){
  		$.ajax({
  			url : "${pageContext.request.contextPath}/findArticleByUser",
  			data : {"user_id" : ${user.user_id}},
  			type : "post",
  			success : function(data) {
  				if(data.countAte == 0 ) {
  					$("#articleInfo").text("这个人什么也没留下");
  					return;
  				}
  				//博文数量
  				$("#countAte").text(data.countAte+"个博文");
  				//最近写的博文
  				content = "<a href='${pageContext.request.contextPath}/readArticle.controller?article_id="+data.recentlyAte[0].article_id+"'>《"+data.recentlyAte[0].title+"》</a>"
  						 + "<a href='${pageContext.request.contextPath}/readArticle.controller?article_id="+data.recentlyAte[1].article_id+"'>《"+data.recentlyAte[1].title+"》</a>"
  						 +  "<a href='${pageContext.request.contextPath}/readArticle.controller?article_id="+data.recentlyAte[2].article_id+"'>《"+data.recentlyAte[2].title+"》</a>";
  				$("#recentlyAte").html(content);
  				//最多阅读博文
  				content2 = "<a href='${pageContext.request.contextPath}/readArticle.controller?article_id="+data.readMostAte[0].article_id+"'>《"+data.readMostAte[0].title+"》</a>"
  						 + "<a href='${pageContext.request.contextPath}/readArticle.controller?article_id="+data.readMostAte[1].article_id+"'>《"+data.readMostAte[1].title+"》</a>"
  						 +  "<a href='${pageContext.request.contextPath}/readArticle.controller?article_id="+data.readMostAte[2].article_id+"'>《"+data.readMostAte[2].title+"》</a>";
  				$("#readMostAte").html(content2);
  				
  			}
  		});
  	});
  </script>
</html>
