<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改用户信息</title>
<link rel="stylesheet" type="text/css" href="css/main_style.css" media="screen">
</head>
<script type="text/javascript">
	function modifyUser(){
		var name = document.addForm.name;
		var p1 = document.addForm.password;
		var p2 = document.addForm.password_re;
		var id = document.addForm.id;
		var language = document.addForm.language_s;
		var locked = document.addForm.is_locked_s;
		var chgpwd = document.addForm.force_chg_pwd_s;
		//var role = document.addForm.userRole_s;
		if(id.value ==""){
			alert("用户ID不能为空");
		}
		else if(p1.value.trim()=="" || p2.value.trim()=="" ){
			alert("用户密码不能为空!");
		}
		else if(p1.value.trim()!= p2.value.trim() ){
			alert("两次密码输入必须一致!");
		}
		else if(name.value.trim()== "" ){
			alert("用户名不能为空");
		}
		else if(language.value == "请选择..." || locked.value=="请选择..." || chgpwd.value=="请选择..."){
			alert("请先选择好所有选项");
		}
		else{
			document.addForm.submit();
		}
	}
	
	function load(){
		
	}
	
</script>
<body>
<jsp:include page="header.jsp" />
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String uid = request.getParameter("id");
String uname = request.getParameter("name");
String uislock = request.getParameter("islock");
String uisforce = request.getParameter("isforce");
String ulanguage = request.getParameter("language");
String rid = request.getParameter("rid");

if(uid == null){
	uid = "";
}else{
	uid = new String(uid.getBytes("iso-8859-1"),"UTF-8");
}

if(uname == null){
	uname = "";
}else{
	uname = new String(uname.getBytes("iso-8859-1"),"UTF-8");
}

if(uislock == null){
	uislock = "";
}else{
	uislock = new String(uislock.getBytes("iso-8859-1"),"UTF-8");	
}

if(uisforce == null){
	uisforce = "";
}else{
	uisforce = new String(uisforce.getBytes("iso-8859-1"),"UTF-8");
}

if(ulanguage == null){
	ulanguage = "";
}else{
	ulanguage = new String(ulanguage.getBytes("iso-8859-1"),"UTF-8");
}

if(rid == null){
	rid = "";
}else{
	rid = new String(rid.getBytes("iso-8859-1"),"UTF-8");
}


%>
<form name="addForm" action="modifyUser.action" method="post">
<h2 align="left">修改用户信息</h2>
<table align="center"   class="one"  rules="all" width="70%">
	<tr>
		<td>用户ID</td>
		<td>
			<input type="text" name="id" value="<%=uid %>" readonly="readonly" maxlength="20"/>
		</td>
		<td>语言</td>
		<td>
			<s:set name="lan" value="<%=ulanguage %>"></s:set>
			<select name="language_s" id="language_s" style="width:150px">
				<option>
				请选择...
				</option>
				
				<option
					<s:if test="${lan==1}">
						selected='selected'
					</s:if>
				>英语</option>
				
				<option
					<s:if test="${lan==2}">
						selected='selected'
					</s:if>
				>简体中文</option>
				
				<option
					<s:if test="${lan==3}">
						selected='selected'
					</s:if>
				>繁体中文</option>

			</select>
		</td>
	</tr>
	<tr>
		<td>用户名</td>
		<td>
			<input type="text" name="name" value="<%=uname %>" readonly="readonly" maxlength="20"/>
		</td>
		<td>是否禁用</td>
		<td>
			<s:set name="lock" value="<%=uislock %>"></s:set>
			<select name="is_locked_s" id="is_locked_s" style="width:150px">
				<option>请选择...</option>
				
				<option
					<s:if test="${lock==1}">
						selected='selected'
					</s:if>
				>是</option>
				
				<option
					<s:if test="${lock==0}">
						selected='selected'
					</s:if>
				>否</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>新的密码</td>
		<td>
			<input type="password" name="password" maxlength="25"/>
		</td>
		<td>是否更改密码</td>
		<td>
			<s:set name="force" value="<%=uisforce %>"></s:set>
			<select name="force_chg_pwd_s" id="force_chg_pwd_s" style="width:150px">
				<option>请选择...</option>
				<option
					<s:if test="${force==1}">
						selected='selected'
					</s:if>
				>是</option>
				
				<option
					<s:if test="${force==0}">
						selected='selected'
					</s:if>
				>否</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>确认密 码</td>
		<td>
			<input type="password" name="password_re" maxlength="25"/>
		</td>
		<td></td>
		<td></td>
		<!--  
		<td>用户角色</td>
		<td>
			<s:set name="rid" value="<%=rid %>"></s:set>
			<select name="userRole_s" id="userRole_s" style="width:150px">
				<option>请选择...</option>
				
				<option
					<s:if test="${rid==1}">
						selected='selected'
					</s:if>
				>客户经理</option>
				
				<option
					<s:if test="${rid==2}">
						selected='selected'
					</s:if>
				>企业客户</option>
				
				<option
					<s:if test="${rid==3}">
						selected='selected'
					</s:if>
				>系统管理员</option>
			</select>
		</td>
		-->
	</tr>
    
	<tr align="center">
		<td colspan="4">
		<br />
		<input type="button" name="return1" value="查看用户信息" onclick="window.location.href='queryUserByPage.action';" />
		<input type="button" name="save" value="更新用户信息" onclick="modifyUser()" />
		</td>
	</tr>
</table>
</form>

<jsp:include page="footer.jsp" />
</body>
</html>