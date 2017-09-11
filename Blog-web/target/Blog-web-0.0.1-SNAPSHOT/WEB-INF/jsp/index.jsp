<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<c:import url="/header.jsp"></c:import>
<link href="${pageContext.request.contextPath}/css/mystyle.css" rel="stylesheet">
		<!-- 内容 -->
		<div class="container">
			<!-- 博客 -->
		<div class="container">
			    <div class="row clearfix">
					<div class="col-md-8 col-sm-8 col-lg-8 col-xs-8">
						    <h3>
								<p style="color:#fff">最新文章<hr class="" /></p>
							</h3>
							<div class="row">
								<c:forEach items="${newList}" begin="0" end="0" var="newA">
									<div class="col-md-12">
										<div class="thumbnail">
											<div class="caption">
												<h3>
													<a  href="${pageContext.request.contextPath}/readArticle.controller?article_id=${newA.article_id}">${newA.title }</a>
												</h3>
												<p>
													<div style="height:50px; white-space:nowrap;text-overflow:clip;overflow:hidden; ">
														${newA.context}
													</div>
												</p>
												<p>
													 <a class="btn btn-primary" href="${pageContext.request.contextPath}/readArticle.controller?article_id=${newA.article_id}">阅读</a>
												</p>
												<div class="alert alert-success" role="alert">作者:${newA.auth.user_nick } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时间：<fmt:formatDate value="${newA.create_time }"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;文章分类:${newA.category.category_name} </div>
											</div>
										</div>
									</div>
								</c:forEach>
								
								
								<div class="col-md-12">
									<h3>
										<p style="color:#fff">最多阅读<hr class="" /></p>
									</h3>
										<div class="row">
											<c:forEach items="${hotList}"  begin="0" end="0" var="hot" >
												<div class="col-md-12">
													<div  class="thumbnail">
														<div class="caption">
															<h3>
																<a href="${pageContext.request.contextPath}/readArticle.controller?article_id=${hot.article_id}">${hot.title }</a>
															</h3>
															<p>
																<div style="height:50px; white-space:nowrap;text-overflow:clip;overflow:hidden; ">
																	${hot.context}
																</div>
															</p>
															<p>
																 <a class="btn btn-primary" href="${pageContext.request.contextPath}/readArticle.controller?article_id=${hot.article_id}">阅读</a>
															</p>
															<div class="alert alert-success" role="alert">作者:${hot.auth.user_nick } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时间：<fmt:formatDate value="${hot.create_time }"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;文章分类:${hot.category.category_name}  </div>
														</div>
													</div>
												</div>
											</c:forEach>
									   </div>	
								    </div>
								
						  	
						 </div>		
						
					</div>
					
					<div class="col-md-1 col-sm-1 col-lg-1 col-xs-1"></div>    
						      <div class="col-md-4 col-sm-4 col-lg-4 col-xs-4">
						          <div class="row">
		                            <div class="list-group">
		                                 <a class="list-group-item active">最新文章 /<span id="allArticle" onclick="goAllArticle()" style="cursor: pointer;">全部文章</span></a>
		                                 <c:forEach items="${newList }" var="newAte" >
		                                    <div class="list-group-item">
		                                        <span class="badge">${newAte.views }</span><a href="${pageContext.request.contextPath}/readArticle.controller?article_id=${newAte.article_id}">${newAte.title }</a>
		                                    </div>
		                                 </c:forEach>                               
		                            </div>
		                            <div class="list-group">
		                                 <a  class="list-group-item active">推荐文章</a>
		                                  <c:forEach items="${rmdList}" var="rmdAte" >
		                                    <div class="list-group-item">
		                                        <span class="badge">${rmdAte.views }</span><a href="${pageContext.request.contextPath}/readArticle.controller?article_id=${rmdAte.article_id}">${rmdAte.title }</a>
		                                    </div>
		                                 </c:forEach>
		                            </div>
		                            <div class="list-group">
		                                 <a  class="list-group-item active">最多阅读</a>
		                                  <c:forEach items="${hotList}" var="hotAte" >
		                                    <div class="list-group-item">
		                                        <span class="badge">${hotAte.views }</span><a href="${pageContext.request.contextPath}/readArticle.controller?article_id=${hotAte.article_id}">${hotAte.title }</a>
		                                    </div>
		                                 </c:forEach>
		                            </div>
		                        </div>
		                       </div>
		                    </div>
					
					
			</div>
			
			</div>
		<!-- 博客结束 -->	
		</div>
		</div>
		<!-- 尾部 -->
		
		<div class="bd-footer text-muted">
			<div class="container">
				<hr />
				<p>作者:小怀</p>
				<p>联系方式 :    Email 1424957713@qq.com&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  	  Mobile 18581726213
				</p>
				<p>&copy;小怀的博客(www.lkhhp.cn)&nbsp;&nbsp;&nbsp;<a href="http://www.miitbeian.gov.cn/">蜀ICP备17020471号-1</a></p>
			</div>
		</div>
	</body>
	<style>
		body {
			background: url("http://api.dujin.org/bing/1920.php") no-repeat;	
		}
		.bd-footer text-muted {
			color:white;
		}
		.text-muted {
		    color:#fff;
		}
	</style>
	<script type="text/javascript">
		function openMsg() {
			return false;
		}
		
		function goAllArticle() {
			window.location.href="${pageContext.request.contextPath}/allArticle.controller?category_id=1";
		}
	</script>
</html>

