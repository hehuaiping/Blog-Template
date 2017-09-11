<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!-- 导入头部 -->
<c:import url="hui-header.jsp"></c:import>
<title>小怀的博客 --- 会员管理 </title>
</head>
<body>
<!-- 导入头2 -->
<c:import url="hui-header2.jsp"></c:import>

<!-- 导入菜单 -->
<c:import url="hui-menu.jsp"></c:import>

<section class="Hui-article-box">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 会员列表<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="Hui-article">
		<article class="cl pd-20">
			<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;" onclick="member_add('添加用户','member-add.jsp','','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加用户</a></span> <span class="r">共有数据：<strong id="dataNum">88</strong> 条</span> </div>
			<div class="mt-20">
				<table class="table table-border table-bordered table-hover table-bg table-sort">
					<thead>
						<tr class="text-c">
							<th width="25"><input type="checkbox" name="" value=""></th>
							<th width="80">ID</th>
							<th width="100">用户名</th>
							<th width="40">性别</th>
							<th width="90">手机</th>
							<th width="150">邮箱</th>
							<th width="">地址</th>
							<th width="130">加入时间</th>
							<th width="70">状态</th>
							<th width="100">操作</th>
						</tr>
					</thead>
					<tbody id="user_info">
						<tr class="text-c" >
							<td><input type="checkbox" value="1" name=""></td>
							<td>1</td>
							<td><u style="cursor:pointer" class="text-primary" onclick="member_show('张三','member-show.html','10001','360','400')">张三</u></td>
							<td>男</td>
							<td>13000000000</td>
							<td>admin@mail.com</td>
							<td class="text-l">北京市 海淀区</td>
							<td>2014-6-11 11:11:42</td>
							<td class="td-status"><span class="label label-success radius">已启用</span></td>
							<td class="td-manage"><a style="text-decoration:none" onClick="member_stop(this,'10001')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a> <a title="编辑" href="javascript:;" onclick="member_edit('编辑','member-add.jsp','4','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="change_password('修改密码','change-password.html','10001','600','270')" href="javascript:;" title="修改密码"><i class="Hui-iconfont">&#xe63f;</i></a> <a title="删除" href="javascript:;" onclick="member_del(this,'1')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
						</tr>
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
$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,8,9]}// 制定列不参与排序
		]
	});
	$('.table-sort tbody').on( 'click', 'tr', function () {
		if ( $(this).hasClass('selected') ) {
			$(this).removeClass('selected');
		}
		else {
			table.$('tr.selected').removeClass('selected');
			$(this).addClass('selected');
		}
	});
	//加载用户数据
	recode("${pageContext.request.contextPath}/admin/findUserList.controller",1,10);
	
});

function recode(url,currentPage,pageSize) {
	//加载用户列表数据
	$.ajax({
		type : "post",
		url : url,
		dataType : "json",
		data : {"currentPage":currentPage,"pageSize":pageSize},
		success : function(data) {
			$("#dataNum").text(data.list.length);
			var content = '';
			//遍历json
			$.each(data.list, function(item,value){
			content += 		  '<tr class="text-c" >'+
							  '<td><input type="checkbox" value='+value.user_id+' name="user_id"></td>' +
							  '<td>'+value.user_id+'</td>'+ 
							  '<td><u style="cursor:pointer" class="text-primary" onclick="member_show('+value.user_nick+',member-show.html,'+value.user_id+',360,400)">'+value.user_nick+'</u></td> '+
							  '<td>男</td>' +
							  '<td>'+value.user_phone+'</td>  '+
							  '<td>'+value.user_email+'</td> '+
							  '<td class="text-l">'+value.user_address+'</td>  '+
							  '<td>'+value.user_create_time+'</td>   ';
				//判断用户状态
				if(value.user_state == 1 ) {
					content +=  '<td class="td-status"><span class="label label-success radius">已启用</span></td>'+
							  	'<td class="td-manage"><a style="text-decoration:none" onClick="member_stop(this,'+value.user_id+')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a> <a title="编辑" href="javascript:;" onclick="member_edit(\'编辑\',\'member-add.jsp?edit=true&id='+value.user_id+'\',\'4\',\'400\',\'510\')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="change_password(\'修改密码\',\'change-password.html\',\'10001\',\'600\',\'270\')" href="javascript:;" title="修改密码"><i class="Hui-iconfont">&#xe63f;</i></a> <a title="删除" href="javascript:;" onclick="member_del(this,'+value.user_id+')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>'
							  	'</tr>';
				}else {
					content += '<td class="td-status"><span class="label label-defaunt radius">已停用</span></td>'+
							   '<td class="td-manage"><a style="text-decoration:none" onClick="member_start(this,'+value.user_id+')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a> <a title="编辑" href="javascript:;" onclick="member_edit(\'编辑\',\'member-add.jsp?edit=true&id='+value.user_id+'\',\'4\',\'400\',\'510\')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a style="text-decoration:none" class="ml-5" onClick="change_password(\'修改密码\',\'change-password.html\',\'10001\',\'600\',\'270\')" href="javascript:;" title="修改密码"><i class="Hui-iconfont">&#xe63f;</i></a> <a title="删除" href="javascript:;" onclick="member_del(this,'+value.user_id+')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>'
							   '</tr>';
				}		
			});
			$("#user_info").html(content);		
			
			//page显示数据
			var info = "显示"+data.currentPage+"到"+data.pageSize*data.currentPage+"条，共"+data.list.length+"条数据";
			$("#DataTables_Table_0_info").text(info);
	
			$("span a.paginate_button").text(data.currentPage);
			
			//上一页/下一页
			$("#DataTables_Table_0_previous").click(function(){
				//上一页
				//window.location.href="${pageContext.request.contextPath}/admin/findUserList.controller?currentPage="+data.upPage+"&pageSize="+data.pageSize+"";		
				//$("#user_info").html();
				recode("${pageContext.request.contextPath}/admin/findUserList.controller", data.upPage, data.pageSize);
				//window.location.replace(location.href);
			});
			
			$("#DataTables_Table_0_next").click(function(){
				//下一页
				//window.location.href="${pageContext.request.contextPath}/admin/findUserList.controller?currentPage="+data.nextPage+"&pageSize="+data.pageSize+"";
				//$("#user_info").html();
				recode("${pageContext.request.contextPath}/admin/findUserList.controller", data.nextPage, data.pageSize);
				//window.location.replace(location.href);
			});
		},
		error : function(data) {
		
		}
	});
}
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*用户-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		//停用该用户
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/admin/changeUserState.controller",
			dataType : "json",
			data : {"user_id":id,"user_state":0},
			success : function(data) {
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,'+id+')" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
				$(obj).remove();
				layer.msg('已停用!',{icon: 5,time:1000});
			}
		});
	});
}

/*用户-启用*/
function member_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/admin/changeUserState.controller",
			dataType : "json",
			data : {"user_id":id,"user_state":1},
			success : function(data) {
				$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,'+id+')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
				$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
				$(obj).remove();
				layer.msg('已启用!',{icon: 6,time:1000});
			}
		});
		
	});
}
/*用户-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*密码-修改*/
function change_password(title,url,id,w,h){
	layer_show(title,url,w,h);	
}
/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/admin/deleteUserById.controller",
			dataType:"json",
			data : {"user_id":id},
			success:function(data) {
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});	
			}
		});
		
	});
}
/*批量删除*/
function datadel() {
	var user_ids = "";
	$.each($("input[name='user_id']:checked"),function(count,user_id) {
		user_ids += user_id.value;
		user_ids += ",";
	});
	
	//删除多余的逗号
	user_ids = user_ids.substr(0,user_ids.length - 1 );
	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/admin//batDeleteUserById.controller",
		dataType : "json",
		data : {"user_ids":user_ids},
		success : function(data) {
			$.each($("input[name='user_id']:checked"),function(count,user_id) {
				$(this).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});	
			});		
		}
	}); 
}
/*删除一些不需要的元素*/
$(function(){
	$("#DataTables_Table_0_length").remove();
});
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>