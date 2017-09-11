<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 导入头部 -->
<c:import url="hui-header.jsp"></c:import>

<title>删除的用户 - 会员管理 - H-ui.admin v3.0</title>
<meta name="keywords" content="H-ui.admin v3.0,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.0，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<!-- 导入头2 -->
<c:import url="hui-header2.jsp"></c:import>

<!-- 导入菜单 -->
<c:import url="hui-menu.jsp"></c:import>

<section class="Hui-article-box">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 删除的用户<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="Hui-article">
		<article class="cl pd-20">
			<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> </span> <span class="r">共有数据：<strong >${page.list.size() }</strong> 条</span> </div>
			<div class="mt-20">
			<table class="table table-border table-bordered table-hover table-bg table-sort">
				<thead>
					<tr class="text-c">
						<th width="25"><input type="checkbox" name="" value=""></th>
						<th width="250">文章ID</th>
						<th width="100">标题</th>
						<th width="60">文章分类</th>
						<th width="90">来源</th>
						<th width="150">更新时间</th>
						<th width="">浏览次数</th>
						<th width="130">发布状态</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${page.list }" var="article">
						<tr class="text-c">
							<td><input type="checkbox" value="${article.article_id}" name="article_id"></td>
							<td>${article.article_id }</td>
							<td>${article.title }</td>
							<td>${article.category.category_name }</td>
						
							<td>原创</td>
							<td><fmt:formatDate value="${article.create_time }"  dateStyle="FULL" timeStyle="LONG"/></td>
							<td class="text-l">${article.views }</td>
							
							<td class="td-status">
                                    <c:if test="${article.state == 0 }"><span class="label label-defaunt radius">未发布</span></c:if>
                                    <c:if test="${article.state == 1 }"><span class="label label-success radius">已发布</span></c:if>
                                    <c:if test="${article.state == 2 }"><span class="label label-success radius">已发布</span></c:if>
                                    <c:if test="${article.state == 3 }"><span class="label label-danger radius">已删除</span></c:if>
                            </td>
							<td class="td-manage"><a style="text-decoration:none" href="javascript:;" onClick="member_huanyuan(this,&apos;${article.article_id}&apos;)" title="还原"><i class="Hui-iconfont">&#xe66b;</i></a> <a title="删除" href="javascript:;" onclick="member_del(this,&apos;${article.article_id}&apos;)" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</article>
	</div>
</section>

<!--_footer 作为公共模版分离出去-->
<c:import url="hui-footer.jsp"/>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$('.table-sort').dataTable({
    "aaSorting": [[ 1, "desc" ]],//默认第几个排序
    "bStateSave": true,//状态保存
    "aoColumnDefs": [
        //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
        {"orderable":false,"aTargets":[0,8]}// 不参与排序的列
    ]
});
/*用户-还原*/
function member_huanyuan(obj,id){
	layer.confirm('确认要还原吗？',function(index){
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/admin/resetArticleById",
			dataType : "json",
			data : {"article_id":id},
			success : function(data) {
				$(obj).remove();
				layer.msg('已还原!',{icon: 6,time:1000});
			}
		});
	});
}

/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/admin/tureUserDelById.controller",
			dataType : "json",
			data : {"user_id":id},
			success : function(data) {
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			}
		});
	});
}

/*删除一些不需要的元素*/
$(function(){
	$("#DataTables_Table_0_length").remove();
	
	var info = "显示${page.currentPage}到${page.pageSize*page.currentPage}条，共${page.list.size()}条数据";
	$("#DataTables_Table_0_info").text(info);
	
	$("span a.paginate_button").text(${page.currentPage})
	
	$("#DataTables_Table_0_previous").click(function(){
		//上一页
		window.location.href="${pageContext.request.contextPath}/admin/article-del.html?currentPage=${page.upPage}&pageSize=${page.pageSize}";		
		
	});
	
	$("#DataTables_Table_0_next").click(function(){
		//下一页
		window.location.href="${pageContext.request.contextPath}/admin/article-del.html?currentPage=${page.nextPage}&pageSize=${page.pageSize}";
	});
});

/*批量删除*/
function datadel() {
	var user_ids = "";
	$.each($("input[name='user_id']:checked"),function(count,user_id) {
		user_ids += user_id.value;
		user_ids += ",";
	});	 
	
	//去除多余的逗号
	user_ids = user_ids.substr(0, user_ids.length - 1);
	
	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/admin/batUserDelByIds.controller",
		dataType : "json",
		data : {"user_ids":user_ids},
		success : function(data) {
			layer.msg("删除成功！！！",{icon:1,time:1000});
			window.location.replace(location.href);
		}
	});
}
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>