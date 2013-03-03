<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增角色页面</title>
<link rel="stylesheet" type="text/css" href="css/main_style.css" media="screen">
<script type="text/javascript">
	
	function addrole() {
		var name = document.addform.name.value;
		if (name.trim() == "") {
			alert("必须要输角色名");
		} else {
			document.addform.submit();
		}
	}
	
	/* 限制textarea长度 使用方法在textarea标签上加上 maxlength="XX"长度属性 */
	function isMaxLen(o){  
		 var nMaxLen=o.getAttribute? parseInt(o.getAttribute("maxlength")):"";  
		 if(o.getAttribute && o.value.length>nMaxLen){  
		 o.value=o.value.substring(0,nMaxLen)  
		 }  
		}  
</script>
</head>
<body>
<jsp:include page="header.jsp" />
	<form name="addform" action="addRole.action" method="post">
		<h2 align="left">新增角色信息</h2>
		<table align="center" class="one"  width="70%">
			<tr>
				<td>角色名：</td>
				<td><input type="text" name="name" maxlength="20" style="width:230px" /></td>
			</tr>
			<tr>
				<td>角色描述：</td>
				<td><textarea id="description" name="description" cols="30" rows="10" maxlength="50" onkeyup="return isMaxLen(this)" ></textarea>
				</td>
			</tr>
			<tr>
			<td colspan="2"  align="center" >
		<input type="reset" name="reset" value="重置" />
		<input type="button" name="qrole" value="查看角色信息" onclick="javascript:window.location.href='queryRole.action'" />
		<input type="button" name="save" value="保存" onclick="addrole()"/>
		</td>
			</tr>
		</table>
	</form>
	
<jsp:include page="footer.jsp" />
</body>
</html>