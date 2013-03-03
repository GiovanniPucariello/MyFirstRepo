<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户信息</title>
</head>
<script type="text/javascript">
	function addUser(){
		var name = document.addForm.name;
		var p1 = document.addForm.password;
		var p2 = document.addForm.password_re;
		var language = document.addForm.language_s;
		var locked = document.addForm.is_locked_s;
		var chgpwd = document.addForm.force_chg_pwd_s;
		var role = document.addForm.userRole_s;
		if(name.value.trim() == "" ){
			alert("用户名不能为空!");
		}
		else if(p1.value.trim()=="" || p2.value.trim()=="" ){
			alert("用户密码不能为空!");
		}
		else if(p1.value.trim()!= p2.value.trim() ){
			alert("两次密码输入必须一致!");
		}
		else if(language.value == "请选择..." || locked.value=="请选择..." || chgpwd.value=="请选择..." || role.value=="请选择..."){
			alert("请先选择好所有选项");
		}
		else{
			document.addForm.submit();
		}
	}
</script>
<body>
<jsp:include page="header.jsp" />
<form name="addForm" action="addUser.action" method="post">
<h2 align="left">添加用户信息</h2>
<table align="center"  class="one" rules="all" width="70%">
	<tr>
		<td>用户名</td>
		<td>
			<input type="text" name="name" maxlength="20"/>
		</td>
		<td>语言</td>
		<td>
			<select name="language_s" id="language_s" style="width:150px">
				<option>请选择...</option>
				<option>英语</option>
				<option>简体中文</option>
				<option>繁体中文</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>密 &nbsp; 码</td>
		<td>
			<input type="password" name="password" maxlength="25"/>
		</td>
		<td>是否禁用</td>
		<td>
			<select name="is_locked_s" id="is_locked_s" style="width:150px">
				<option>请选择...</option>
				<option>是</option>
				<option>否</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>确认密 码</td>
		<td>
			<input type="password" name="password_re" maxlength="25"/>
		</td>
		<td>是否更改密码</td>
		<td>
			<select name="force_chg_pwd_s" id="force_chg_pwd_s" style="width:150px">
				<option>请选择...</option>
				<option>是</option>
				<option>否</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>用户角色</td>
		<td>
			<select name="userRole_s" id="userRole_s" style="width:160px;">
				<option>请选择...</option>
				<option>客户经理</option>
				<option>企业客户</option>
				<option>系统管理员</option>
			</select>
		</td>
		<td></td>
		<td></td>
	</tr>
    
	<tr align="center">
		<td colspan="4">
		<br />
		<input type="reset" name="reset" value="重置" />
		<input type="button" name="return1" value="查看用户信息" onclick="window.location.href='queryUserByPage.action';" />
		<input type="button" name="save" value="添加用户" onclick="addUser()" />
		</td>
	</tr>
</table>
</form>

<jsp:include page="footer.jsp" />
</body>
</html>