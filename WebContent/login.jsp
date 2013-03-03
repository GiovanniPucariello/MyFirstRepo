<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登陆</title>

<link rel="stylesheet" type="text/css" href="css/main_style.css" media="screen">

<script type="text/javascript">
function login() {
	var name = document.loginForm.name.value;
	var password = document.loginForm.password.value;
	
	var isWrite = true;
	
	if(name == null || name == "") {
		isWrite = false;
		alert("请输入用户名");
		
	} else if(password == null || password == "") {
		isWrite = false;
		alert("请输入密码");
	}

	if( isWrite == true) {
		document.loginForm.submit();
	}
}
</script>
</head>

<body onload="document.loginForm.name.focus();"> 
<%@ taglib prefix="s" uri="/struts-tags"%>
	<br/><br/>
	<table align="center" width="100%">
	 <tr>
	 	<td><img width="100%" height="100" src="./images/Tylandlogo.png" /></td>
	 </tr>
	</table>
	<br/><br/><br/>
	<form action="login.action" name="loginForm" method="post">
		<table align="center" >
			<tr>
				<td rowspan="5" style="padding-right:50px"><img src="./images/login_pic.png" width="300" height="200" /></td>
			</tr>
		
			<tr>
				<td colspan="2" align="left">用户登录</td>
			</tr>
			<tr>
				<td><label for="name"><img src="images/login_user.png" width="40" height="40" /> </label>
				</td>
				<td><input type="text" name="name" id="name" value="" size="25" /></td>
			</tr>

			<tr>
				<td><label for="password"><img src="images/login_pwd.png" width="40" height="40" /> </label>
				</td>
				<td><input type="password" name="password" id="password" size="25" 
			     	onkeypress= "if (event.keyCode==13) this.form.loginButton.onclick();" /></td>
			</tr>

			<tr>
				<td colspan="2" align="right">
				<!-- <input type="image" name="loginButton" src="images/loginbutton.gif" onclick="login()" /> -->
				<input type="button" name="loginButton" value="登录" onclick="login()" />
				&nbsp;
				<!-- <input type="image" name="login_reset" src="images/resetbutton.gif" onclick="javascript:window.location.href='login.jsp';"/> -->
				<input type="reset" name="login_reset" value="重置" />
				</td>
			</tr>
		</table>
	</form>
	<!-- /login -->
	<s:include value="message.jsp"></s:include>  
</body>
</html>