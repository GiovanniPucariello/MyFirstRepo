<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改经销商信息页面</title>
<link rel="stylesheet" type="text/css" href="css/main_style.css" media="screen">

<script type="text/javascript">

/* 限制textarea长度 使用方法在textarea标签上加上 maxlength="XX"长度属性 */
function isMaxLen(o) {
	var nMaxLen = o.getAttribute ? parseInt(o.getAttribute("maxlength"))
			: "";
	if (o.getAttribute && o.value.length > nMaxLen) {
		o.value = o.value.substring(0, nMaxLen)
	}
}

</script>

</head>
<body>
<jsp:include page="header.jsp" />
	<%@ taglib prefix="s" uri="/struts-tags" %>
	<%
		String dId = request.getParameter("dealerId");
		String dName = request.getParameter("dealerName");
		String dAddress=request.getParameter("dealerAddress");
		String dDescription=request.getParameter("dealerDescription");
		if (dId == null) {
			dId = "";
		}else {
			dId = new String(dId.getBytes("iso-8859-1"), "UTF-8");
		}
		if (dName == null) {
			dName = "";
		}else {
			dName = new String(dName.getBytes("iso-8859-1"), "UTF-8");
		}
		if (dAddress == null) {
			dAddress = "";
		}else {
			dAddress = new String(dAddress.getBytes("iso-8859-1"), "UTF-8");
		}
		if (dDescription == null) {
			dDescription = "";
		}else {
			dDescription = new String(dDescription.getBytes("iso-8859-1"), "UTF-8");
		}
	%>	
	<form name="addForm" action="modifyDealer.action" method="post">
	<h2 align="left">修改经销商信息</h2>
	<table align="center" class="one" width="70%">
		<tr>
			<td>经销商ID</td>
			<td>
				<input type="text" name="dealerId" value="<%=dId%>" readonly="readonly" maxlength="20"/>
			</td>

			<td>经销商名称</td>
			<td>
				<input type="text" name="dealerName" value="<%=dName%>" maxlength="20"/>
			</td>				
		</tr>
		<tr>
			<td align="center">描述</td>
				<td>
					<textarea name="dealerDescription" cols="20" rows="5" maxlength="50" ><%=dDescription %>
					</textarea>
				</td>			
				<td>经销商地址</td>
				<td>
					<input type="text" name="dealerAddress" value="<%=dAddress%>" maxlength="20"/>
				</td>
		</tr>
		<tr align="center">
			<td colspan="4">
				<br/>
				<input type="reset" name="reset" value="重置" />
				<input type="button" name="return1" value="查看经销商信息" 
					 onclick="window.location.href='queryDealer.action';" />
				<input type="submit" name="save" value="更新经销商信息"/>
			</td>
		</tr>
</table>
</form>
<jsp:include page="footer.jsp" />
</body>
</html>