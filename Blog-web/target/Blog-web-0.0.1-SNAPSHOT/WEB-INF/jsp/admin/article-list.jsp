<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 导入头部 -->
<c:import url="hui-header.jsp"></c:import>

<title>小怀的博客---文章管理</title>
</head>
<body>
<!-- 导入头2 -->
<c:import url="hui-header2.jsp"></c:import>

<!-- 导入菜单 -->
<c:import url="hui-menu.jsp"></c:import>

<section class="Hui-article-box">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span>
		文章管理
		<span class="c-gray en">&gt;</span>
		文章列表
		<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
	</nav>
	<div class="Hui-article">
		<article class="cl pd-20">
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l">
				<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
				<a class="btn btn-primary radius" data-title="添加文章" _href="article-add.html" onclick="article_add('添加文章','article-add.html')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加文章</a>
				</span>
				<span class="r">共有数据：<strong>${page.countNum }</strong> 条</span>
			</div>
			<div class="mt-20">
				<table class="table table-border table-bordered table-bg table-hover table-sort">
					<thead>
						<tr class="text-c">
							<th width="25"><input type="checkbox" name="" value=""></th>
							<th width="80">ID</th>
							<th>标题</th>
							<th width="80">分类</th>
							<th width="80">来源</th>
							<th width="120">更新时间</th>
							<th width="75">浏览次数</th>
							<th width="60">发布状态</th>
							<th width="120">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${page.list }" var="ate">
							<tr class="text-c">
								<td><input id="" type="checkbox" value="${ate.article_id }" name="article_id"></td>
								<td style="white-space:nowrap;text-overflow:clip;overflow:hidden; ">${ate.article_id }</td>
								<td class="text-l"><u style="cursor:pointer;nowrap;text-overflow:clip;overflow:hidden;" class="text-primary" onClick="article_edit('查看','${pageContext.request.contextPath}/readArticle.controller?article_id=${ate.article_id}&admin=admin','10001')" title="查看">${ate.title }</u></td>
								<td>行业动态</td>
								<td>${ate.category.category_name }</td>
								<td><fmt:formatDate value="${ate.create_time }"/> </td>
								<td>${ate.views }</td>
								<td class="td-status">
									<c:if test="${ate.state == 0 }"><span class="label label-defaunt radius">未发布</span></c:if>
									<c:if test="${ate.state >= 1 }"><span class="label label-success radius">已发布</span></c:if>
								</td>
								<td class="f-14 td-manage">
									<c:if test="${ate.state == 0}">
										<a style="text-decoration:none" onClick="article_start(this,'${ate.article_id}')" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i>
										</a>
									</c:if>
									<c:if test="${ate.state >= 1 }">
										<a style="text-decoration:none" onClick="article_stop(this,'${ate.article_id}')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i>
										</a>
									</c:if>
									<c:if test="${ate.state == 2}">
										<a style="text-decoration:none" class="ml-5" onClick="article_rehot(this,'${ate.article_id}')" href="javascript:;" title="取消推荐阅读"><i class="Hui-iconfont">&#xe6e4;</i></a>
									</c:if>
									<c:if test="${ate.state ne 2}">
										<a style="text-decoration:none" class="ml-5" onClick="article_hot(this,'${ate.article_id}')" href="javascript:;" title="设置为推荐阅读"><i class="Hui-iconfont">&#xe6c1;</i></a>
									</c:if>
									<a style="text-decoration:none" class="ml-5" onClick="article_edit('文章编辑','${pageContext.request.contextPath}/admin/editArticle.html','${ate.article_id}')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
									<a style="text-decoration:none" class="ml-5" onClick="article_del(this,'${ate.article_id}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</article>
	</div>
</section>


<!-- 尾部 -->
<c:import url="hui-footer.jsp"></c:import>

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
		//{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		{"orderable":false,"aTargets":[0,8]}// 不参与排序的列
	]
});

/*文章-添加*/
function article_add(title,url,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*文章-设置为推荐阅读*/
function article_hot(obj,id){
	layer.confirm('确认要设置为推荐阅读吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath}/admin/setArticleHot.controller',
			dataType: 'json',
			data : {"article_id" : id ,"hot" : true},
			success: function(data){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="ml-5" onClick="article_rehot(this,&apos;'+id+'&apos;)" href="javascript:;" title="取消推荐阅读"><i class="Hui-iconfont">&#xe6e4;</i></a>');
				$(obj).remove();
				layer.msg('已设置!',{icon:1,time:1000});
			},
			error:function(data) {
				layer.msg(data.responseText,{icon:2,time:2000});
			}
		});		
	});
}
/*文章-取消推荐阅读*/
function article_rehot(obj,id){
	layer.confirm('确认要取消推荐阅读吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath}/admin/setArticleHot.controller',
			dataType: 'json',
			data : {"article_id" : id ,"hot" : false},
			success: function(data){
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="ml-5" onClick="article_hot(this,&apos;'+id+'&apos;)" href="javascript:;" title="设置为推荐阅读"><i class="Hui-iconfont">&#xe6c1;</i></a>');
				$(obj).remove();
				layer.msg('已取消!',{icon:1,time:1000});
			},
			error:function(data) {
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="ml-5" onClick="article_hot(this,&apos;'+id+'&apos;)" href="javascript:;" title="设置为推荐阅读"><i class="Hui-iconfont">&#xe6c1;</i></a>');
				$(obj).remove();
				layer.msg('已取消!',{icon:1,time:1000});
			}
		});		
	});
}
/*文章-编辑*/
function article_edit(title,url,id,w,h){
	var index = layer.open({
		type: 2,
		title: title,
		content: url + "?article_id="+id
	});
	layer.full(index);
}
/*文章-删除*/
function article_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath}/admin/deleteArticle.controller',
			dataType: 'json',
			data : {"article_id" : id },
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
		});		
	});
}

/*文章-审核*/
function article_shenhe(obj,id){
	layer.confirm('审核文章？', {
		btn: ['通过','不通过','取消'], 
		shade: false,
		closeBtn: 0
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
		$(obj).remove();
		layer.msg('已发布', {icon:6,time:1000});
	},
	function(){
		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
		$(obj).remove();
    	layer.msg('未通过', {icon:5,time:1000});
	});	
}
/*文章-下架*/
function article_stop(obj,id){
	layer.confirm('确认要下架吗？',function(index){
		//下架文章
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/lowerArticle.controller",
			type : "post",
			data : {"article_id" : id},
			success : function(data){
				if ("ok" == data ) {
					$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_start(this,&apos;'+id+'&apos;)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
					$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">未发布</span>');
					$(obj).remove();
					layer.msg('已下架!',{icon: 5,time:1000});
				}else {
					layer.msg('下架失败!',{icon: 5,time:1000});
				}
			}
		});
		
	});
}

/*文章-发布*/
function article_start(obj,id){
	layer.confirm('确认要发布吗？',function(index){
		//发布文章
		$.ajax({
			url : "${pageContext.request.contextPath}/admin/publish.controller",
			type : "post",
			data : {"article_id" : id},
			success: function(data) {
				if(data == 'ok' ) {
					$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_stop(this,&apos;'+id+'&apos;)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
					$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
					$(obj).remove();
					layer.msg('已发布!',{icon: 6,time:1000});
				}else {
					layer.msg('发布失败!',{icon: 6,time:1000});
				}
			}
		});
		
	});
}
/*文章-申请上线*/
function article_shenqing(obj,id){
	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
	$(obj).parents("tr").find(".td-manage").html("");
	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
}
/*文章-批量删除*/
function datadel() {
	//所有要删除文章的ID
	var ids = "";
	$.each($("input[name='article_id']:checked"),function(count,article_id) {
		ids += article_id.value;
		ids += ",";
	});
	//去除多余的逗号
	ids = ids.substr(0, ids.length - 1);
	$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/admin/batDeleteArticleById.controller",
			dataType : "json",
			data : {"article_ids":ids},
			success : function(data) {
				layer.msg('已删除', {icon: 1,time:1000});
				window.location.replace(location.href);
			}
	});
}
/* 删除没页显示多少条数据  上一页/下一页 */
$(function(){
	
	$("#DataTables_Table_0_length").remove();
	
	var info = "显示${page.currentPage}到${page.pageSize*page.currentPage}条，共${page.list.size()}条数据";
	$("#DataTables_Table_0_info").text(info);
	
	$("span a.paginate_button").text(${page.currentPage})
	
	$("#DataTables_Table_0_previous").click(function(){
		//上一页
		window.location.href="${pageContext.request.contextPath}/admin/article-list.html?currentPage=${page.upPage}&pageSize=${page.pageSize}";		
		
	});
	
	$("#DataTables_Table_0_next").click(function(){
		//下一页
		window.location.href="${pageContext.request.contextPath}/admin/article-list.html?currentPage=${page.nextPage}&pageSize=${page.pageSize}";
	});
	
});

</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>