<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色信息维护页面</title>
</head>

<script type="text/javascript">
	function queryRole() {
			document.roleForm.submit();

	}
	function deleteRole(){
		var c = document.getElementsByName("radio");
		var rname = 1;
		var checked = false;
		for(var i=0; i<c.length; i++){
			if(c[i].checked){
				rname = c[i].value;
				checked = true;
			}
		}
		if(!checked){
			alert("请先选择一个要删除的角色！");
		}
		else{
			window.location.href="deleteRole.action?id=" + rname;
		}
	}
	function modifyRole(){
		var uname = document.getElementsByName("u1");
		var ud = document.getElementsByName("u2");
		var c = document.getElementsByName("radio");
		
		var uid = 1;
		var uu1;
		var uu2;

		var checked = false;
		for(var i=0; i<c.length; i++){
			if(c[i].checked){
				checked = true;
				uid = c[i].value;
				uu1 = uname[i].value;
				uu2 = ud[i].value;
			}
		}
		if(!checked){
			alert("请至少选择一个要修改的用户！");
		}
		else{
			window.location.href="modifyRole.jsp?id=" + uid + "&name=" + uu1
				+ "&description=" + uu2;
		}
	}
</script>

<body>
<jsp:include page="header.jsp" />
	<h2 align="left">角色信息维护</h2>
	<form name="roleForm" action="queryRole.action" method="post">
	<table class="one1" align="center" class="one" rules="all" width="80%">
		<tr>
			<td>角色名称</td>
			<td width="50%"><input type="text" name="name" style="width:80%" /></td>
			<td align="center">
			<input type="button" name="query" value="查询" onclick="queryRole()" /> 
			<input type="button" name="add" value="增加" onclick="javascript:window.location.href='addRole.jsp';" /> 
			<input type="button" name="modify" value="修改" onclick="modifyRole();" /> 
			<input type="button" name="delete" value="删除" onclick="if(confirm('确定要删除所选角色吗？')){deleteRole();}" /> 
			</td>
		</tr>
	</table>
	
	<br/>
	<hr />
	<table rules="cols" align="center" width="80%">
		<tr style="background:#CFDEFF;">
			<th></th>
			<th>角色名称</th>
			<th>角色描述</th>
		</tr>
		<s:iterator id="role" value="roleList">
			<s:hidden name="u1" value="${role.name}" id="u1"></s:hidden>
			<s:hidden name="u2" value="${role.description}" id="u2"></s:hidden>
			<tr>
				<td><input type="radio" name="radio" id="radio" value="${role.id}" /></td>
				<td><s:property value="name" /></td>
				<td><s:property value="description" /></td>
			</tr>
		</s:iterator>
	</table>
	</form>
	
	<jsp:include page="footer.jsp" />
</body>
</html>















