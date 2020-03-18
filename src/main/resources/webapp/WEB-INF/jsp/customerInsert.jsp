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
<title>添加客户 - 客户管理</title>
</head>
<body>
	<input type="hidden" value="" name="genderss">
	<article class="page-container">
		<form class="form form-horizontal" name="form-coustomer-add"
			id="form-coustomer-add" method="post">
			<div class="row cl" id="customerName1">
				<label class="form-label col-xs-4 col-sm-3">客户姓名：</label>
				<div class="formControls col-xs-8 col-sm-9" id="customerName2">
					<input type="text" class="input-text" value="" placeholder=""
						name="customerName" onchange="customerNamechange(this)">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">性别：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box" style="width: 150px;"> <select
						class="select" name="gender" size="1"
						onchange="genderChange(this)">
							<option value="男" selected="selected">男</option>
							<option value="女">女</option>

					</select>
					</span>
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">电话：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="" name="phone"
						onchange="phonechange(this)">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">车系：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" id="carSystem"
						name="carSystem" onchange="carSystemChange(this)">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">车型：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" id="carType" name="carType" onchange="carTypeChange(this)">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">是否邀约：</label>
				<div class="formControls col-xs-8 col-sm-1">
					<input type="checkbox" class="input-text" id="invitationState" name="invitationState" onchange="invitationStateChange(this)">
				</div>
			</div>
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">价格：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" id="price" name="price" onchange="priceChange(this)">
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">意向级别：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box" style="width: 150px;"> <select
						class="select" name="intentionLevel_select" size="1"
						onchange="intentionLevelChange(this)">
							<option value="0" selected="selected">0</option>
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="C">C</option>
							<option value="F0">F0</option>
							<option value="H">H</option>
							<option value="N">N</option>
					</select>
					</span>
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">来源：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box" style="width: 150px;"> <select
						class="select" name="userSource_select" size="1" onchange="userSource_selectChange(this)">
							<option value="传统媒体广告户外" selected="selected">传统媒体广告户外</option>
							<option value="传统媒体广告其他">传统媒体广告其他</option>
							<option value="路过自然进店">路过自然进店</option>
							<option value="内部推送转介绍">内部推送转介绍</option>
							<option value="店头活动">店头活动</option>
							<option value="外展活动">外展活动</option>
							<option value="汽车之家会员">汽车之家会员</option>
					</select>
					</span> <input name="userSource" type="hidden" value="">
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">状态：</label>

				<div class="formControls col-xs-8 col-sm-9">
					<span class="select-box" style="width: 150px;"> <select
						class="select" name="state_select" size="1" onchange="state_selectChange(this)">
							<option value="订单跟踪" selected="selected">订单跟踪</option>
							<option value="交车">交车</option>
							<option value="意向跟踪">意向跟踪</option>
							<option value="战败待确认">战败待确认</option>
							<option value="战败跟踪">战败跟踪</option>
							
					</select>
					</span>
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">预计购车时间：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text"
						onfocus="WdatePicker()"
						id="buy_date" name="buy_date" class="input-text Wdate"
						style="width: 120px;" onchange="buy_dateChange(this)">
				</div>
			</div>

			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-3">备注：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<textarea name="remark" cols="" rows="" class="textarea"
						placeholder="说点什么..." dragonfly="true" onchange="remarkChange(this)"></textarea>
				</div>
			</div>
			<div class="row cl">
				<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
					<input class="btn btn-primary radius" type="submit"
						value="&nbsp;&nbsp;提交&nbsp;&nbsp;" onclick="updateCustomer()">
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
		ds.gender = "男";
		ds.intentionLevel = "0";
		ds.userSource = "传统媒体广告户外";
		ds.state = "订单跟踪";
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
		
		
		function invitationStateChange(a) {
			if ($(a).is(':checked')) {
				ds.invitationState = 1;
				
			}else {
				ds.invitationState = 0;
			}
			
		}	
		function priceChange(a) {
			ds.price = $(a).val();
			
		}
		
		function userSource_selectChange(a){
			ds.userSource = $(a).val();
			
		}
		
		function state_selectChange(a){
			ds.state = $(a).val();
			
		}
		
		
		function buy_dateChange(a){
			ds.buyDate = $(a).val();
			
		}
		
		function remarkChange(a) {
			ds.remark = $(a).val();
			
		}
		
		function updateCustomer() {

			$.ajax({
				type : "post",
				url : "../customer/insert",
				cache:false,
				async : false,
				dataType : "json",
				data : JSON.stringify(ds),
				contentType : 'application/json;charset=utf-8',
				success : function(data) {
					if (data.eorLog != null) {
						alert(data.eorLog);
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


				}
			});

		}
	</script>
</body>
</html>