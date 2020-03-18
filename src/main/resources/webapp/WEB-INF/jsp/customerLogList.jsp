<%@page import="com.model.User"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico">
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="../h-ui/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="../h-ui/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="../h-ui/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="../h-ui/static/h-ui.admin/css/style.css" />
<link href="../h-ui/lib/Hui-iconfont/1.0.8/iconfont.css"
	rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->


<title>客户列表</title>
</head>
<body>
	<div class="page-container">
		<table class="table table-border table-bordered table-bg">
			<thead>

				<tr>
					<th scope="col" colspan="9">客户列表</th>
				</tr>
				<tr class="text-c">
					<td width="25">业务顾问</td>
					<td width="25">车系</td>
					<td width="25">车型</td>
					<td width="25">预计购车时间</td>
					<td width="25">意向级别</td>
					<td width="25">状态</td>
					<td width="25">更新时间</td>
					<td width="25">价格</td>
					<td width="130">备注</td>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty customerList}">
					<c:forEach items="${customerList}" var="a" varStatus="status">
					 <tr <c:if test="${a.priorityLevel ==1}"> class="success" </c:if> 
					 	 <c:if test="${a.priorityLevel ==2}"> class="warning" </c:if> 
					 	 <c:if test="${a.priorityLevel ==3}"> class="danger" </c:if>  >
					 	 
							<td>${a.salesManName}</td>
							<td>${a.carSystem}</td>
							<td>${a.carType}</td>
							<td>${a.buyDate}</td>
							<td>${a.intentionLevel}</td>
							<td>${a.state}</td>
							<td>${a.updateDate}</td>
							<td>${a.price}</td>
							<td>${a.remark}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<!--_footer 作为公共模版分离出去-->
	<script type="text/javascript"
		src="../h-ui/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="../h-ui/lib/layer/2.4/layer.js"></script>
	<script type="text/javascript" src="../h-ui/static/h-ui/js/H-ui.min.js"></script>
	<script type="text/javascript"
		src="../h-ui/static/h-ui.admin/js/H-ui.admin.js"></script>
	<!--/_footer 作为公共模版分离出去-->
	<!--请在下方写此页面业务相关的脚本-->
	<script type="text/javascript"
		src="../h-ui/lib/My97DatePicker/4.8/WdatePicker.js"></script>
	<script type="text/javascript"
		src="../h-ui/lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="../h-ui/lib/laypage/1.2/laypage.js"></script>
	<script type="text/javascript">
		/*
		 参数解释：
		 title	标题
		 url		请求的url
		 id		需要操作的数据id
		 w		弹出层宽度（缺省调默认值）
		 h		弹出层高度（缺省调默认值）
		 */
		/*管理员-增加*/
		function admin_add(title, url, w, h) {
			layer_show(title, url, w, h);
		}
		
		function customerFromSubmit() {
			$("form[name='customerFrom']").submit();
		}
		/*管理员-删除*/
		function admin_del(obj, id) {
			layer.confirm('确认要删除吗？', function(index) {
				$.ajax({
					type : 'POST',
					url : '',
					dataType : 'json',
					success : function(data) {
						$(obj).parents("tr").remove();
						layer.msg('已删除!', {
							icon : 1,
							time : 1000
						});
					},
					error : function(data) {
						console.log(data.msg);
					},
				});
			});
		}

		/*管理员-编辑*/
		function admin_edit(title, url, id, w, h) {
			layer_show(title, url, w, h);
		}
		/*管理员-停用*/
		function admin_stop(obj, id) {
			layer
					.confirm(
							'确认要停用吗？',
							function(index) {
								//此处请求后台程序，下方是成功后的前台处理……

								$(obj)
										.parents("tr")
										.find(".td-manage")
										.prepend(
												'<a onClick="admin_start(this,id)" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
								$(obj)
										.parents("tr")
										.find(".td-status")
										.html(
												'<span class="label label-default radius">已禁用</span>');
								$(obj).remove();
								layer.msg('已停用!', {
									icon : 5,
									time : 1000
								});
							});
		}

		/*管理员-启用*/
		function admin_start(obj, id) {
			layer
					.confirm(
							'确认要启用吗？',
							function(index) {
								//此处请求后台程序，下方是成功后的前台处理……

								$(obj)
										.parents("tr")
										.find(".td-manage")
										.prepend(
												'<a onClick="admin_stop(this,id)" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
								$(obj)
										.parents("tr")
										.find(".td-status")
										.html(
												'<span class="label label-success radius">已启用</span>');
								$(obj).remove();
								layer.msg('已启用!', {
									icon : 6,
									time : 1000
								});
							});
		}

		function onInsertCustomerPage() {
			//alert($("input[ name='name' ] ").val());
			var newUrl = '../customer/insertPage'; //设置新提交地址
			$("#customerFrom").attr('action', newUrl); //通过jquery为action属性赋值
			$("#customerFrom").submit(); //提交ID为myform的表单
		}
		
		
		function updateAward(awardId){

		    var awardUserCount = $("#awardUserCount").val();
		    if(awardUserCount*1>8888 || awardUserCount*1<1){
		        layer.msg('人数必须是1到8888', {
		            time: 500, //0.5s后自动关闭
		            // btn: ['明白了', '知道了']
		        });
		    }else{
		        var awardName = $("#awardName").val();
		        var awardDescription = $("#awardDescription").val();
		        var awardKind = $("#awardKind").val();
		        $.ajax({
		            type: "post",
		            url : getContextPath() + "/award/updateAward",
		            dataType:'json',
		            data: {
		                "awardId":awardId,
		                "awardName":awardName,
		                "awardDescription":awardDescription,
		                "awardUserCount":awardUserCount,
		                "awardKind":awardKind
		            },
		            success: function(data){
		                var updateSuccess = data.data;
		                if(updateSuccess){
		                    layer.msg('修改成功', {
		                        time: 500, //0.5s后自动关闭
		                        // btn: ['明白了', '知道了']
		                    });
		                    refreshPage();
		                }else{
		                    layer.msg('修改失败', {
		                        time: 500, //20s后自动关闭
		                        // btn: ['明白了', '知道了']
		                    });
		                }
		            }
		        });
		        layer.closeAll();
		    }
		}
		<%User user=(User)request.getSession().getAttribute("user");
		
		  if (user == null){
		%>
		$(document).ready(function () {		
			
			var newUrl = '../user/index'; //设置新提交地址
			$("#customerFrom").attr('action', newUrl); //通过jquery为action属性赋值
			$("#customerFrom").submit(); //提交ID为myform的表单
		});
		
		<%}%>
	</script>
</body>
</html>
