<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业客户信息增加</title>
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

	function addCustomer() {
		var realName = document.form1.realName.value;
		var sysName = document.form1.userSelect.value;
		var dealerName = document.form1.dealerSelect.value;
		if (realName.trim() == "") {
			alert("请输入客户姓名!")
		} else if (sysName == "请选择..." || dealerName == "请选择...") {
			alert("请选择系统用户名与经销商！");
		} else {
			document.form1.submit();
		}
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<%@ taglib prefix="s" uri="/struts-tags"%>
	<h2 align="left">企业客户信息增加</h2>
	<form name="form1" action="addCustomer.action" method="post">
		<table id="table1" class="one" rules="all" align="center" width="80%">
			<tr>
				<td width="13%">真实姓名</td>
				<td width="37%">
					<input type="text" name="realName" id="realName"
					maxlength="50" style="width: 80%" /></td>
				<td width="13%">系统用户名</td>
				<td width="37%">
				<select name="userSelect" style="width: 80%">
					<option>请选择...</option>
					<s:iterator id="uu" value="uuList">
					<option
						<s:if test="${uu.name==uuname}" >
						selected="selected"
						</s:if>
					><s:property value="name" /></option>
					</s:iterator>
				</select>
				</td>
			</tr>
			<tr>
				<td width="13%">联系电话</td>
				<td width="37%">
					<input type="text" name="phone" id="phone"
					maxlength="20" style="width: 80%" /></td>
				<td width="13%">所属经销商</td>
				<td width="37%">
				<select name="dealerSelect" style="width: 80%">
					<option>请选择...</option>
					<s:iterator id="dd" value="ddList">
					<option><s:property value="name" /></option>
					</s:iterator>
				</select>
				</td>
			</tr>
			<tr>
				<td width="13%">手机</td>
				<td width="37%">
					<input type="text" name="mobile" id="mobile"
					maxlength="20" style="width: 80%" /></td>
				<td width="13%">Email：</td>
				<td width="37%">
					<input type="text" name="email" id="email"
					maxlength="50" style="width: 80%" /></td>
			</tr>
			<tr>
				<td width="13%">所属部门</td>
				<td width="37%">
					<input type="text" name="department" id="department"
					maxlength="50" style="width: 80%" /></td>
				<td width="13%">现任职位</td>
				<td width="37%">
					<input type="text" name="position" id="position"
					maxlength="50" style="width: 80%" /></td>
			</tr>
			<tr>
				<td width="13%">传真</td>
				<td width="37%">
					<input type="text" name="fax" id="fax"
					maxlength="50" style="width: 80%" /></td>
				<td width="13%">地址</td>
				<td width="37%">
					<input type="text" name="address" id="address" maxlength="150" style="width: 80%" />
				</td>
			</tr>
			<tr>
				<td width="13%">描述</td>
				<td colspan="3">
					<textarea name="customerDesc"  style="width:91%;height:80px" maxlength="50" >
					</textarea>
				</td>
			</tr>
		</table>
		<table  class="one" align="center" width="40%" style="margin-top: 2px;">
			<tr style="width: 100%">
				<td><input type="reset" class="one" name="reset" value="重置"
					style="width: 40%" onclick="" />
				</td>
				<td><input type="button" name="add" value="增加"
					style="width: 40%" onclick="addCustomer()" />
				</td>
			</tr>
		</table>
	</form>
	<jsp:include page="footer.jsp" />
</body>
</html>