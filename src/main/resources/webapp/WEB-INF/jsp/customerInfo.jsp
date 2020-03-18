<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<html>
<head>
<title>客户详细资料</title>
</head>
<body>
	<form action="user/login" style="center">
		<table>
			<tr>
				<td colspan="10"><input type="hidden" name="name" value="${user.name}" > 
				    			<input type="hidden" name="passWord" value="${user.passWord}">
				 				<input type="hidden" name="id" value="${user.id}"> 
				 				<input type="hidden" name="level" value="${user.level}">     			
				</td>
			</tr>
			<tr>
				<td>销售员：</td>
				<td><input type="text" name="" value=""></td>
				<td>姓名：</td>
				<td><input type="text" name="" value=""></td>
				<td>电话：</td>
				<td><input type="text" name="" value=""></td>
				<td>车系：</td>
				<td><input type="text" name="" value=""></td>
				<td>车型：</td>
				<td><input type="text" name="" value=""></td>
				<td>备注：</td>
				<td><input type="text" name="" value=""></td>
			</tr>

			<tr>


			</tr>
			<tr>
				<td><input type="submit" name="查询" value=""> </td>
				<td></td>
			</tr>
		</table>


	</form>
</body>
</html>
