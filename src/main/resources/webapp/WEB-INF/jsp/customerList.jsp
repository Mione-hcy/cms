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
		<form name="customerFrom" id="customerFrom" action="../customer/list" method="post">
			<div class="text-c">
				姓名： <input type="text" class="input-text" style="width: 250px"id="customerName" name="customerName" value="${customerSelectInfo.customerName}">
				电话： <input type="text" class="input-text" style="width: 250px"id="phone" name="phone" value="${customerSelectInfo.phone}">
				车系： <input type="text" class="input-text" style="width: 250px"id="carSystem" name="carSystem" value="${customerSelectInfo.carSystem}">
				销售顾问： 
				<span class="select-box" style="width: 250px;"> <select
							class="select" name="salesManName" size="1">
							<option value="" <c:if test="${customerSelectInfo.salesManName eq '' }">selected="selected"</c:if> >
							<c:forEach items="${userList}" var="a" varStatus="status">
								<option value="${a.name}"
								<c:if test="${customerSelectInfo.salesManName eq a.name}">selected="selected"</c:if> >${a.name}</option>
							</c:forEach>
						</select>
						</span>
			</div>
			<br>
			<div class="text-c">
				意向级别： 			
					<span class="select-box" style="width: 250px;"> 
					<select
							class="select" name="intentionLevel" size="1">
							<option value=""
								<c:if test="${customerSelectInfo.intentionLevel eq ''}"> selected="selected"</c:if>></option>
							<option value="0"
								<c:if test="${customerSelectInfo.intentionLevel eq '0'}"> selected="selected"</c:if>>0</option>
							<option value="A"
								<c:if test="${customerSelectInfo.intentionLevel eq 'A'}"> selected="selected"</c:if>>A</option>
							<option value="B"
								<c:if test="${customerSelectInfo.intentionLevel eq 'B'}"> selected="selected"</c:if>>B</option>
							<option value="C"
								<c:if test="${customerSelectInfo.intentionLevel eq 'C'}"> selected="selected"</c:if>>C</option>
							<option value="F0"
								<c:if test="${customerSelectInfo.intentionLevel eq 'F0'}"> selected="selected"</c:if>>F0</option>
							<option value="H"
								<c:if test="${customerSelectInfo.intentionLevel eq 'H'}"> selected="selected"</c:if>>H</option>
							<option value="N"
								<c:if test="${customerSelectInfo.intentionLevel eq 'N'}"> selected="selected"</c:if>>N</option>
						</select>
						</span>
						
				紧急度： 			
					<span class="select-box" style="width: 250px;"> 
					<select
							class="select" name="priorityLevel" size="1">
							<option value="0"
								<c:if test="${customerSelectInfo.priorityLevel eq ''}"> selected="selected"</c:if>></option>
							<option value="1"
								<c:if test="${customerSelectInfo.priorityLevel eq '1'}"> selected="selected"</c:if>>绿色</option>
							<option value="2"
								<c:if test="${customerSelectInfo.priorityLevel eq '2'}"> selected="selected"</c:if>>黄色</option>
							<option value="3"
								<c:if test="${customerSelectInfo.priorityLevel eq '3'}"> selected="selected"</c:if>>红色</option></select>
	
						</span>
			</div>

		<br>
			<div class="text-c">
				<button type="submit" class="btn btn-success" onclick="onSelectList()" id=""
					name="submitButton">
					<i class="Hui-iconfont">&#xe665;</i> 搜用户
				</button>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button type="submit" class="btn btn-success" onclick="onDownLoad()" id=""
					name="submitButton1">
					<i class="Hui-iconfont">&#xe665;</i> 下载excel
				</button>
				
			</div>



			<input type="hidden" name="name" value="${userinfo.name}"> <input
				type="hidden" name="passWord" value="${userinfo.passWord}">
			<input type="hidden" name="id" value="${userinfo.id}"> <input
				type="hidden" name="level" value="${userinfo.level}">
		</form>
		<div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="l"> <a href="javascript:;"
				onclick="admin_add('添加新客户','../customer/insertPage','800','500')"
				class="btn btn-primary radius"> <i class="Hui-iconfont">&#xe600;
				</i> 添加新客户
			</a></span>
		</div>
		<table class="table table-border table-bordered table-bg table-sort">
			<thead>

				<tr>
					<th scope="col" colspan="11">客户列表</th>
				</tr>
				<tr class="text-c">
					<td width="25">序号</td>
					<td width="25">姓名</td>
					<td width="25">电话</td>
					<td width="25">业务顾问</td>
					<td width="25">车系</td>
					<td width="25">车型</td>
					<td width="25">是否邀约</td>
					<td width="25">预计购车时间</td>
					<td width="25">意向级别</td>
					<td width="25">状态</td>
					<td width="130">备注</td>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty customerList}">
					<c:forEach items="${customerList}" var="a" varStatus="status">
					 <tr <c:if test="${a.priorityLevel ==1}"> class="success" </c:if> 
					 	 <c:if test="${a.priorityLevel ==2}"> class="warning" </c:if> 
					 	 <c:if test="${a.priorityLevel ==3}"> class="danger" </c:if>  
					 	 onclick="admin_add('修改客户','../customer/updatePage?customerId=${a.id}','1400','800')">
					 	 	<td>${status.index+1}</td>
							<td>${a.customerName}</td>
							<td>${a.phone}</td>
							<td>${a.salesManName}</td>
							<td>${a.carSystem}</td>
							<td>${a.carType}</td>
							<td>
							<c:if test="${a.invitationState == 1}">已邀约</c:if>
							</td>
							<td>${a.buyDate}</td>
							<td>${a.intentionLevel}</td>
							<td>${a.state}</td>
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
		
		$('.table-sort').dataTable({
			
		});
		
		function onDownLoad(){
			var newUrl = '../customer/downLoad'; //设置新提交地址
			$("div #customerFrom").attr('action', newUrl); //通过jquery为action属性赋值
			$("div #customerFrom").submit(); //提交ID为myform的表单
			
		}
		
		function onSelectList(){
			var newUrl = '../customer/list'; //设置新提交地址
			$("div #customerFrom").attr('action', newUrl); //通过jquery为action属性赋值
			$("div #customerFrom").submit(); //提交ID为myform的表单
			
		}
		
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
