<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息维护</title>
<link href="css/user.css" rel="Stylesheet" type="text/css" />
<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript">
	function queryUser() {
		var id = document.form1.id;
		var name = document.getElementById("name");
		if (isInt(id.value)) {
			document.form1.submit();
		} else {
			alert("请输入正确的ID,必须为整数!");
		}

	}
	function deleteUser() {
		var c = document.getElementsByName("check");
		var array = new Array();
		var checked = false;
		for ( var i = 0; i < c.length; i++) {
			if (c[i].checked) {
				array.push(c[i].value);
				checked = true;
			}
		}
		if (!checked) {
			alert("请至少选择一个要删除的用户！");
		} else {
			window.location.href = "deleteUser.action?deletearray="
					+ array.toString();
		}
	}
	function modifyUser() {
		var uname = document.getElementsByName("u1");
		var ulock = document.getElementsByName("u2");
		var uforcepwd = document.getElementsByName("u3");
		var ulanguage = document.getElementsByName("u4");
		var rid = document.getElementsByName("u5");
		var c = document.getElementsByName("check");

		var uid;
		var uu1;
		var uu2;
		var uu3;
		var uu4;
		var uu5;
		var count = 0;
		var checked = false;
		for ( var i = 0; i < c.length; i++) {
			if (c[i].checked) {
				checked = true;
				count++;
				uid = c[i].value;
				uu1 = uname[i].value;
				uu2 = ulock[i].value;
				uu3 = uforcepwd[i].value;
				uu4 = ulanguage[i].value;
				uu5 = rid[i].value;
			}
		}
		if (!checked) {
			alert("请至少选择一个要修改的用户！");
		} else if (count > 1) {
			alert("一次只能修改一个用户！");
		} else {
			window.location.href = "modifyUser.jsp?id=" + uid + "&name=" + uu1
					+ "&islock=" + uu2 + "&isforce=" + uu3 + "&language=" + uu4
					+ "&rid=" + uu5;
		}
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />

	<%@ taglib prefix="s" uri="/struts-tags"%>
	<h2 align="left">用户信息维护</h2>
	<form name="form1" id="form1" action="queryUserByPage.action"
		method="post">
		<table id="table1" class="one" rules="all" align="center" width="80%">

			<tr>
				<td width="15%">用户ID</td>
				<td width="35%"><input type="text" name="id" maxlength="16"
					style="width: 88%" /></td>
				<td width="15%">语言</td>
				<td width="35%"><select name="languageSelect"
					style="width: 90%">
						<option>请选择...</option>
						<option>英语</option>
						<option>简体中文</option>
						<option>繁体中文</option>
				</select></td>
			</tr>
			<tr>
				<td width="15%">用户名</td>
				<td width="35%"><input type="text" name="name" id="name"
					maxlength="30" style="width: 88%" /></td>
				<td width="15%">是否禁用</td>
				<td width="35%"><select name="isLockedSelect"
					style="width: 90%">
						<option>请选择...</option>
						<option>是</option>
						<option>否</option>
				</select></td>
			</tr>
		</table>

		<table class="one1" align="center" width="40%"
			style="margin-top: 2px;">
			<tr style="width: 100%;">
				<td><input type="button" name="query" value="查询"
					style="width: 80%" onclick="queryUser();" />
				</td>
				<td><input type="button" name="add" value="增加"
					style="width: 80%"
					onclick="javascript:window.location.href='addUser.jsp';" />
				</td>
				<td><input type="button" name="modify" value="修改"
					style="width: 80%" onclick="modifyUser();" />
				</td>
				<td><input type="button" name="delete" value="删除"
					style="width: 80%"
					onclick="if(confirm('确定要删除所选用户吗？')){deleteUser();}" />
				</td>
			</tr>
		</table>
	</form>

	<hr />
	<table rules="cols" align="center" width="90%" style="margin-top: 2px;">
		<tr style="background: #CFDEFF;">
			<th></th>
			<th>用户ID</th>
			<th>用户名</th>
			<th>是否禁用</th>
			<th>是否更改密码</th>
			<th>语言</th>
			<th>角色</th>
		</tr>
		<s:iterator id="user" value="pageBean.list">
			<s:set name="ro" value="${user.role.id}" />
			<s:hidden name="u0" value="${user.id}" id="u0"></s:hidden>
			<s:hidden name="u1" value="${user.name}" id="u1"></s:hidden>
			<s:hidden name="u2" value="${user.is_locked}" id="u2"></s:hidden>
			<s:hidden name="u3" value="${user.force_chg_pwd}" id="u3"></s:hidden>
			<s:hidden name="u4" value="${user.language}" id="u4"></s:hidden>
			<s:hidden name="u5" value="${user.role.id}" id="u5"></s:hidden>
			<tr>
				<td><input type="checkbox" name="check" value='${user.id}' />
				</td>
				<td><a
					<s:if test="${ro==2 }" >class="mylink" href="moreInfo.action?uuid=${user.id}&uuname=${user.name }"</s:if>>
						<s:property value="id" /> </a>
				</td>
				<td><s:property value="name" />
				</td>
				<td><s:if test="#user.is_locked=='1'">是</s:if> <s:else>否</s:else>
				</td>
				<td><s:if test="#user.force_chg_pwd=='1'">是</s:if> <s:else>否</s:else>
				</td>
				<td><s:if test="#user.language==1">英语</s:if> <s:elseif
						test="#user.language==2">简体中文</s:elseif> <s:elseif
						test="#user.language==3">繁体中文</s:elseif> <s:else>其他语言</s:else></td>
				<td><s:if test="#user.role.id==1">客户经理</s:if> <s:elseif
						test="#user.role.id==2">企业客户</s:elseif> <s:elseif
						test="#user.role.id==3">系统管理员</s:elseif> <s:else>其他角色</s:else></td>
			</tr>
		</s:iterator>

	</table>
	<table align="center" style="margin-top: 10px">
		<tr style="color: black">
			<td class="1">总共: <s:property value="pageBean.allRow" /> 条记录</td>
			<td>&nbsp;&nbsp;</td>
			<td>共：<s:property value="pageBean.totalPage" />页</td>
			<td>&nbsp;&nbsp;</td>
			<td>当前第 <s:property value="pageBean.currentPage" />页</td>
			<td>&nbsp;&nbsp;</td>
			<td><s:if test="%{pageBean.currentPage == 1}">
 	  			第一页  上一页
 	  		</s:if> <s:else>
					<a href="queryUserByPage.action?page=1">第一页</a>
					<a
						href="queryUserByPage.action?page=<s:property value="%{pageBean.currentPage-1}"/>">上一页</a>
				</s:else></td>
			<td>&nbsp;&nbsp;</td>
			<td><s:if test="%{pageBean.currentPage != pageBean.totalPage}">
					<a
						href="queryUserByPage.action?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
					<a
						href="queryUserByPage.action?page=<s:property value="%{pageBean.totalPage}"/>">最后一页</a>
				</s:if> <s:else>
 	  	     	下一页 最后一页
 	  	     </s:else></td>


		</tr>
	</table>

	<jsp:include page="footer.jsp" />
</body>
</html>