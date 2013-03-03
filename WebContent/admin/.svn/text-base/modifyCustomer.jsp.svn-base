<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业客户信息修改</title>
<link href="css/user.css" rel="Stylesheet" type="text/css" />
<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript">
/* 限制textarea长度 使用方法在textarea标签上加上 maxlength="XX"长度属性 */
function isMaxLen(o) {
	var nMaxLen = o.getAttribute ? parseInt(o.getAttribute("maxlength"))
			: "";
	if (o.getAttribute && o.value.length > nMaxLen) {
		o.value = o.value.substring(0, nMaxLen)
	}
}

function modifyCustomer(){
	var realName = document.form1.realNameM.value;
	var sysName = document.form1.sysNameM.value;
	var dealerName = document.form1.dealerNameM.value;
	if(realName.trim()=="" || sysName.trim()=="" || dealerName.trim()==""){
		alert("必须要填入客户真实姓名、系统用户名与经销商名！");
	}
	else{
		document.form1.submit();
	}
	
}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<%@ taglib prefix="s" uri="/struts-tags"%>
	<%
	String u0 = request.getParameter("realName");
	String u1 = request.getParameter("sysName");
	String u2 = request.getParameter("phone");
	String u3 = request.getParameter("dealerName");
	String u4 = request.getParameter("mobile");
	String u5 = request.getParameter("email");
	String u6 = request.getParameter("department");
	String u7 = request.getParameter("position");
	String u8 = request.getParameter("fax");
	String u9 = request.getParameter("address");
	String u10 = request.getParameter("description");
	String u11 = request.getParameter("customerId");
	
	if(u0 == null){
		u0 = "";
	}else{
		u0 = new String(u0.getBytes("iso-8859-1"),"UTF-8");
	}
	if(u1 == null){
		u1 = "";
	}else{
		u1 = new String(u1.getBytes("iso-8859-1"),"UTF-8");
	}
	if(u2 == null){
		u2 = "";
	}else{
		u2 = new String(u2.getBytes("iso-8859-1"),"UTF-8");
	}
	if(u3 == null){
		u3 = "";
	}else{
		u3 = new String(u3.getBytes("iso-8859-1"),"UTF-8");
	}
	if(u4 == null){
		u4 = "";
	}else{
		u4 = new String(u4.getBytes("iso-8859-1"),"UTF-8");
	}
	if(u5 == null){
		u5 = "";
	}else{
		u5 = new String(u5.getBytes("iso-8859-1"),"UTF-8");
	}
	if(u6 == null){
		u6 = "";
	}else{
		u6 = new String(u6.getBytes("iso-8859-1"),"UTF-8");
	}
	if(u7 == null){
		u7 = "";
	}else{
		u7 = new String(u7.getBytes("iso-8859-1"),"UTF-8");
	}
	if(u8 == null){
		u8 = "";
	}else{
		u8 = new String(u8.getBytes("iso-8859-1"),"UTF-8");
	}
	if(u9 == null){
		u9 = "";
	}else{
		u9 = new String(u9.getBytes("iso-8859-1"),"UTF-8");
	}
	if(u10 == null){
		u10 = "";
	}else{
		u10 = new String(u10.getBytes("iso-8859-1"),"UTF-8");
	}
	if(u11 == null){
		u11 = "";
	}else{
		u11 = new String(u11.getBytes("iso-8859-1"),"UTF-8");
	}
	%>
	<h2 align="left">企业客户信息修改</h2>
	<form name="form1" action="modifyCustomer.action" method="post">
		<input type="hidden" name="customerID" id="customerID"  value="<%=u11 %>" />
		<table id="table1" class="one" rules="all" align="center" width="80%">
			<tr>
				<td width="15%">真实姓名</td>
				<td width="35%">
					<input type="text" name="realNameM" id="realNameM" readonly="readonly"
					maxlength="50" value="<%=u0 %>" style="width: 90%;background:#DCE6F4" /></td>
				<td width="15%">系统用户名</td>
				<td width="35%">
					<input type="text" name="sysNameM" id="sysNameM" readonly="readonly"
					maxlength="50" value="<%=u1 %>" style="width: 90%;background:#DCE6F4" />
				</td>
			</tr>
			<tr>
				<td width="15%">联系电话</td>
				<td width="35%">
					<input type="text" name="phoneM" id="phone" value="<%=u2 %>"
					maxlength="20" style="width: 90%" /></td>
				<td width="15%">所属经销商</td>
				<td width="35%">
					<input type="text" name="dealerNameM" id="dealerNameM" readonly="readonly"
					maxlength="50" value="<%=u3 %>" style="width: 90%;background:#DCE6F4" /></td>
			</tr>
			<tr>
				<td width="15%">手机</td>
				<td width="35%">
					<input type="text" name="mobileM" id="mobileM" value="<%=u4 %>"
					maxlength="20" style="width: 90%" /></td>
				<td width="15%">Email：</td>
				<td width="35%">
					<input type="text" name="emailM" id="emailM" value="<%=u5 %>"
					maxlength="50" style="width: 90%" /></td>
			</tr>
			<tr>
				<td width="15%">所属部门</td>
				<td width="35%">
					<input type="text" name="departmentM" id="departmentM" value="<%=u6 %>"
					maxlength="50" style="width: 90%" /></td>
				<td width="15%">现任职位</td>
				<td width="35%">
					<input type="text" name="positionM" id="positionM" value="<%=u7 %>"
					maxlength="50" style="width: 90%" /></td>
			</tr>
			<tr>
				<td width="15%">传真</td>
				<td width="35%">
					<input type="text" name="faxM" id="faxM" value="<%=u8 %>"
					maxlength="50" style="width: 90%" /></td>
				<td width="15%">地址</td>
				<td width="35%">
					<input type="text" name="addressM" id="addressM" maxlength="150" 
					style="width: 90%" value="<%=u9 %>" />
				</td>
			</tr>
			<tr>
				<td width="15%">描述</td>
				<td colspan="3">
					<textarea name="customerDescM"  style="width:95%;height:80px" maxlength="50" ><%=u10 %>
					</textarea>
				</td>
			</tr>
		</table>
		<table align="center" width="40%" style="margin-top: 2px;">
			<tr style="width: 100%">
				<td><input type="reset" name="reset" value="重置"
					style="width: 40%" onclick="" />
				</td>
				<td><input type="button" name="add" value="保存"
					style="width: 40%" onclick="modifyCustomer()" />
				</td>
			</tr>
		</table>
	</form>
	<jsp:include page="footer.jsp" />
</body>
</html>