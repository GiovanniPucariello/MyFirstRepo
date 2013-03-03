<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改角色信息页面</title>

<script type="text/javascript">
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
<%
String uid = request.getParameter("id");
String uname = request.getParameter("name");
String desc = request.getParameter("description");
if(uid != null){
	uid = new String(uid.getBytes("iso-8859-1"),"UTF-8");
}
if(uname != null){
	uname = new String(uname.getBytes("iso-8859-1"),"UTF-8");
}
if(desc != null){
	desc = new String(desc.getBytes("iso-8859-1"),"UTF-8");
}
%>
	<form name="form1" action="modifyRole.action" method="post">
		<h2 align="left">修改角色信息</h2>
		<input type="hidden" name="id" id="id"  value="<%=uid %>" />
		<table align="center"  class="one" width="70%">
			<tr>
				<td>角色名</td>
				<td>
					<input type="text" name="name" value="<%=uname %>" readonly="readonly" />
				</td>
			</tr>
			<tr>
				<td>角色描述</td>
				<td><textarea name="description" cols="25" rows="10" maxlength="50" ><%=desc %></textarea>
				</td>
			</tr>
			<tr>
			<td colspan="2" align="center" >
				<input type="button" name="qrole" value="查看角色信息" 
						onclick="javascript:window.location.href='queryRole.action'" />
				<input type="submit" name="save" value="更新角色信息" />
			</td>
			</tr>
		</table>
	</form>
	
	<jsp:include page="footer.jsp" />
</body>
</html>