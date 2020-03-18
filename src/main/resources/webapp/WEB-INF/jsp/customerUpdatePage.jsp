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
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css"
	href="../h-ui/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="../h-ui/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="../h-ui/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="../h-ui/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="../h-ui/static/h-ui.admin/css/style.css" />
<script type="text/javascript"
	src="../h-ui/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>修改客户 - 客户管理</title>
</head>
<body>
	<input type="hidden" value="" name="genderss">
	<article class="page-container">
		<form class="form form-horizontal" name="form-coustomer-add"
			id="form-coustomer-add" method="post">
			<div class="row cl" id="customerName1">
				<label class="form-label col-xs-4 col-sm-3">客户姓名：</label>
				<div class="formControls col-xs-8 col-sm-9" id="customerName2">
					<input type="text" class="input-text"
						value="${customer.customerName}" placeholder=""
						name="customerName" onchange="customerNamechange(this)">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">性别：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box" style="width: 150px;"> <select
						class="select" name="gender" size="1"
						onchange="genderChange(this)">
							<c:if test="${customer.gender eq '男'}">
								<option value="男" selected="selected">男</option>
								<option value="女">女</option>
							</c:if>
							<c:if test="${customer.gender eq '女'}">
								<option value="男">男</option>
								<option value="女" selected="selected">女</option>
							</c:if>
					</select>
					</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">电话：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${customer.phone}"
						name="phone" onchange="phonechange(this)">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">车系：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" id="carSystem"
						name="carSystem" onchange="carSystemChange(this)"
						value="${customer.carSystem}">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">车型：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" id="carType" name="carType"
						onchange="carTypeChange(this)" value="${customer.carType}">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">是否邀约：</label>
				<div class="formControls col-xs-8 col-sm-1">
					<input type="checkbox" class="input-text" id="invitationState" name="invitationState"
						onchange="invitationStateChange(this)"  <c:if test="${customer.invitationState == 1}">checked="checked"</c:if>>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">价格：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" id="price" name="price"
						onchange="priceChange(this)" value="${customer.price}">
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">意向级别：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box" style="width: 150px;"> <select
						class="select" name="intentionLevel_select" size="1"
						onchange="intentionLevelChange(this)">
							<option value="0"
								<c:if test="${customer.intentionLevel eq '0'}"> selected="selected"</c:if>>0</option>
							<option value="A"
								<c:if test="${customer.intentionLevel eq 'A'}"> selected="selected"</c:if>>A</option>
							<option value="B"
								<c:if test="${customer.intentionLevel eq 'B'}"> selected="selected"</c:if>>B</option>
							<option value="C"
								<c:if test="${customer.intentionLevel eq 'C'}"> selected="selected"</c:if>>C</option>
							<option value="F0"
								<c:if test="${customer.intentionLevel eq 'F0'}"> selected="selected"</c:if>>F0</option>
							<option value="H"
								<c:if test="${customer.intentionLevel eq 'H'}"> selected="selected"</c:if>>H</option>
							<option value="N"
								<c:if test="${customer.intentionLevel eq 'N'}"> selected="selected"</c:if>>N</option>
					</select>
					</span>
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">来源：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box" style="width: 150px;"> <select
						class="select" name="userSource_select" size="1"
						onchange="userSource_selectChange(this)">
							<option value="传统媒体广告户外"
								<c:if test="${customer.userSource eq '传统媒体广告户外'}"> selected="selected"</c:if>>传统媒体广告户外</option>
							<option value="传统媒体广告其他"
								<c:if test="${customer.userSource eq '传统媒体广告其他'}"> selected="selected"</c:if>>传统媒体广告其他</option>
							<option value="路过自然进店"
								<c:if test="${customer.userSource eq '路过自然进店'}"> selected="selected"</c:if>>路过自然进店</option>
							<option value="内部推送转介绍"
								<c:if test="${customer.userSource eq '内部推送转介绍'}"> selected="selected"</c:if>>内部推送转介绍</option>
							<option value="店头活动"
								<c:if test="${customer.userSource eq '店头活动'}"> selected="selected"</c:if>>店头活动</option>
							<option value="外展活动"
								<c:if test="${customer.userSource eq '外展活动'}"> selected="selected"</c:if>>外展活动</option>
							<option value="汽车之家会员"
								<c:if test="${customer.userSource eq '汽车之家会员'}"> selected="selected"</c:if>>汽车之家会员</option>
					</select>
					</span> <input name="userSource" type="hidden" value="">
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">状态：</label>

				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box" style="width: 150px;"> <select
						class="select" name="state_select" size="1"
						onchange="state_selectChange(this)">
							<option value="订单跟踪"
								<c:if test="${customer.state eq '订单跟踪'}"> selected="selected"</c:if>>订单跟踪</option>
							<option value="交车"
								<c:if test="${customer.state eq '交车'}"> selected="selected"</c:if>>交车</option>
							<option value="意向跟踪"
								<c:if test="${customer.state eq '意向跟踪'}"> selected="selected"</c:if>>意向跟踪</option>
							<option value="战败待确认"
								<c:if test="${customer.state eq '战败待确认'}"> selected="selected"</c:if>>战败待确认</option>
							<option value="战败跟踪"
								<c:if test="${customer.state eq '战败跟踪'}"> selected="selected"</c:if>>战败跟踪</option>

					</select>
					</span>
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">预计购车时间：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text"
						onfocus="WdatePicker()"
						id="buy_date" name="buyDate" class="input-text Wdate"
						style="width: 120px;" onchange="buy_dateChange(this)"
						value="${customer.buyDate}">
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">备注：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<textarea name="remark" cols="" rows="" class="textarea"
						placeholder="说点什么..." dragonfly="true"
						onchange="remarkChange(this)">${customer.remark}</textarea>
				</div>
			</div>

			<%
			User user = (User)request.getSession().getAttribute("user");
			if(user.getLevel() == 1){
				 %>
				
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">指定销售人员：</label>

				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box" style="width: 150px;"> <select
						class="select" name="userId" size="1"
						onchange="userId_selectChange(this)">
						<c:forEach items="${userList}" var="a" varStatus="status">
							<option value="${a.id}"
							<c:if test="${user.id == a.id}">selected="selected"</c:if> >${a.name}</option>
						</c:forEach>
					</select>
					</span>
				</div>
			</div>
			<%} %>

			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input class="btn btn-primary radius" type="submit"
						value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onclick="updateCustomer()">

					<input class="btn btn-primary radius" type="button"
						value="&nbsp;&nbsp;更进明细&nbsp;&nbsp;" onclick="admin_add('更进明细','../customer/logList?customerId=${customer.id}','1200','800')">
				</div>
			</div>
		</form>
	</article>

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
		src="../h-ui/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
	<script type="text/javascript"
		src="../h-ui/lib/jquery.validation/1.14.0/validate-methods.js"></script>
	<script type="text/javascript"
		src="../h-ui/lib/jquery.validation/1.14.0/messages_zh.js"></script>
	<script type="text/javascript" src="../h-ui/json2.js"></script>

	<script type="text/javascript">
		var ds = {};
		ds.id = "${customer.id}";
		ds.phone = "${customer.phone}";
		ds.customerName = "${customer.customerName}";
		ds.carSystem = "${customer.carSystem}";
		ds.carType = "${customer.carType}";
		ds.buyDate = "${customer.buyDate}";
		ds.price = "${customer.price}";
		ds.remark = "${customer.remark}";
		ds.gender = "${customer.gender}";
		ds.intentionLevel = "${customer.intentionLevel}";
		ds.userSource = "${customer.userSource}";
		ds.state = "${customer.state}";
		ds.state = "${customer.invitationState}";
		function phonechange(a) {
			ds.phone = $(a).val();

		}

		function customerNamechange(a) {
			ds.customerName = $(a).val();

		}

		function genderChange(a) {
			ds.gender = $(a).val();

		}

		function intentionLevelChange(a) {
			ds.intentionLevel = $(a).val();

		}

		function carSystemChange(a) {
			ds.carSystem = $(a).val();

		}

		function carTypeChange(a) {
			ds.carType = $(a).val();

		}

		function priceChange(a) {
			ds.price = $(a).val();

		}

		function userSource_selectChange(a) {
			ds.userSource = $(a).val();

		}

		function state_selectChange(a) {
			ds.state = $(a).val();

		}

		function buy_dateChange(a) {
			ds.buyDate = $(a).val();

		}

		function remarkChange(a) {
			ds.remark = $(a).val();

		}
		
		function invitationStateChange(a) {

			if ($(a).is(':checked')) {
				ds.invitationState = 1;
				
			}else {
				ds.invitationState = 0;
			}
			
		}	
		
		function admin_add(title, url, w, h) {
			layer_show(title, url, w, h);
		}
		
		function userId_selectChange(a) {
			ds.userId = $(a).val();

		}
		
		function updateCustomer() {

			$.ajax({
				type : "post",
				url : "../customer/update",
				cache : false,
				async : false,
				dataType : "json",
				data : JSON.stringify(ds),
				contentType : 'application/json;charset=utf-8',
				success : function(data) {
					if (data != null) {
						var index = parent.layer.getFrameIndex(window.name);
						parent.$('.btn-refresh').click();
						window.parent.customerFromSubmit();
						parent.layer.close(index);

					} else {
						var index = parent.layer.getFrameIndex(window.name);
						parent.$('.btn-refresh').click();
						window.parent.customerFromSubmit();
						parent.layer.close(index);

					}
					var index = parent.layer.getFrameIndex(window.name);
					parent.$('.btn-refresh').click();
					window.parent.customerFromSubmit();
					parent.layer.close(index);

				},

				fail : function(e) {

				},

				error : function(e) {

					alert(e);

				}
			});

		}
	</script>
</body>
</html>