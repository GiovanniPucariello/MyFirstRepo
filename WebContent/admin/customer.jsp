<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>企业客户信息维护</title>


<link href="css/user.css" rel="Stylesheet" type="text/css" />
<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript">
	function queryCustomer() {
		document.form1.submit();
	}
	function deleteCustomer() {
		var c = document.getElementsByName("radio");
		var id = document.getElementsByName("p11");
		var u11;
		var checked = false;
		for ( var i = 0; i < c.length; i++) {
			if (c[i].checked) {
				u11 = id[i].value;
				checked = true;
			}
		}
		if (!checked) {
			alert("请至少选择一个要删除的客户！");
		} else {
			window.location.href = "deleteCustomer.action?cid=" + u11;
		}
	}
	function modifyCustomer() {
		var realName = document.getElementsByName("p0");
		var sysName = document.getElementsByName("p1");
		var phone = document.getElementsByName("p2");
		var dealerName = document.getElementsByName("p3");
		var mobile = document.getElementsByName("p4");
		var email = document.getElementsByName("p5");
		var department = document.getElementsByName("p6");
		var position = document.getElementsByName("p7");
		var fax = document.getElementsByName("p8");
		var address = document.getElementsByName("p9");
		var desc = document.getElementsByName("p10");
		var id = document.getElementsByName("p11");
		var c = document.getElementsByName("radio");

		var u0;
		var u1;
		var u2;
		var u3;
		var u4;
		var u5;
		var u6;
		var u7;
		var u8;
		var u9;
		var u10;
		var u11;

		var checked = false;
		for ( var i = 0; i < c.length; i++) {
			if (c[i].checked) {
				checked = true;
				u0 = realName[i].value;
				u1 = sysName[i].value;
				u2 = phone[i].value;
				u3 = dealerName[i].value;
				u4 = mobile[i].value;
				u5 = email[i].value;
				u6 = department[i].value;
				u7 = position[i].value;
				u8 = fax[i].value;
				u9 = address[i].value;
				u10 = desc[i].value;
				u11 = id[i].value;

			}
		}
		if (!checked) {
			alert("请至少选择一个要修改的客户！");
		} else {
			window.location.href = "modifyCustomer.jsp?realName=" + u0
					+ "&sysName=" + u1 + "&phone=" + u2 + "&dealerName=" + u3
					+ "&mobile=" + u4 + "&email=" + u5 + "&department=" + u6
					+ "&position=" + u7 + "&fax=" + u8 + "&address=" + u9
					+ "&description=" + u10 + "&customerId=" + u11;
		}
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<%@ taglib prefix="s" uri="/struts-tags"%>
	<h2 align="left">企业客户信息维护</h2>
	<form name="form1" action="queryCustomerByPage.action" method="post">
		<table id="table1" class="one" rules="all" align="center" width="80%">
			<tr>
				<td width="13%">真实姓名</td>
				<td width="20%"><input type="text" name="realNameQ"
					id="realNameQ" maxlength="30" style="width: 95%" /></td>

				<td width="13%">系统用户名</td>
				<td width="20%"><input type="text" name="sysNameQ"
					id="sysNameQ" maxlength="30" style="width: 95%" /></td>

				<td width="13%">手机</td>
				<td width="20%"><input type="text" name="mobileQ" id="mobileQ"
					maxlength="30" style="width: 95%" /></td>
			</tr>
			<tr>
				<td width="13%">所属经销商</td>
				<td width="20%"><input type="text" name="dealerNameQ"
					id="dealerNameQ" maxlength="30" style="width: 95%" /></td>

				<td width="13%">传真</td>
				<td width="20%"><input type="text" name="faxQ" id="faxQ"
					maxlength="30" style="width: 95%" /></td>
				<td width="13%">联系电话</td>
				<td width="20%"><input type="text" name="phoneQ" id="phoneQ"
					maxlength="30" style="width: 95%" /></td>
			</tr>
		</table>
		<table class="one1" align="center" width="40%"
			style="margin-top: 2px;">
			<tr style="width: 100%">
				<td><input class="one" type="button" name="query" value="查询"
					style="width: 80%" onclick="queryCustomer()" />
				</td>
				<td><input type="button" class="one" name="addCustomer"
					value="增加" style="width: 80%"
					onclick="window.location.href='customerInit.action'" />
				</td>
				<td><input type="button" class="one" name="modify" value="修改"
					style="width: 80%" onclick="modifyCustomer()" />
				</td>
				<td><input type="button" class="one" name="delete" value="删除"
					style="width: 80%"
					onclick="if(confirm('确定要删除所选客户吗？')){deleteCustomer();}" />
				</td>
			</tr>
		</table>
	</form>
	<hr />
	<div style="margin-top: 25px">
		<table rules="cols" align="center" width="90%"
			style="margin-top: 2px;">
			<tr style="background: #CFDEFF; border: 1px;">
				<th></th>
				<th>真实姓名</th>
				<th>用户名</th>
				<th>联系电话</th>
				<th>所属经销商</th>
				<th>手机</th>
				<th>Email</th>
				<th>部门</th>
				<th>职位</th>
				<th>传真</th>
				<th>地址</th>
				<th>描述</th>
			</tr>
			<s:iterator id="pro" value="pageBeanCustomer.list">
				<s:hidden name="p0" value="%{#pro[0]}" id="p0"></s:hidden>
				<s:hidden name="p1" value="%{#pro[1]}" id="p1"></s:hidden>
				<s:hidden name="p2" value="%{#pro[2]}" id="p2"></s:hidden>
				<s:hidden name="p3" value="%{#pro[3]}" id="p3"></s:hidden>
				<s:hidden name="p4" value="%{#pro[4]}" id="p4"></s:hidden>
				<s:hidden name="p5" value="%{#pro[5]}" id="p5"></s:hidden>
				<s:hidden name="p6" value="%{#pro[6]}" id="p6"></s:hidden>
				<s:hidden name="p7" value="%{#pro[7]}" id="p7"></s:hidden>
				<s:hidden name="p8" value="%{#pro[8]}" id="p8"></s:hidden>
				<s:hidden name="p9" value="%{#pro[9]}" id="p9"></s:hidden>
				<s:hidden name="p10" value="%{#pro[10]}" id="p10"></s:hidden>
				<s:hidden name="p11" value="%{#pro[11]}" id="p11"></s:hidden>
				<tr>
					<td><input type="radio" name="radio" id="radio" />
					</td>
					<td><s:property value="#pro[0]" />
					</td>
					<td><s:property value="#pro[1]" />
					</td>
					<td><s:property value="#pro[2]" />
					</td>
					<td><s:property value="#pro[3]" />
					</td>
					<td><s:property value="#pro[4]" />
					</td>
					<td><s:property value="#pro[5]" />
					</td>
					<td><s:property value="#pro[6]" />
					</td>
					<td><s:property value="#pro[7]" />
					</td>
					<td><s:property value="#pro[8]" />
					</td>
					<td><s:property value="#pro[9]" />
					</td>
					<td><s:property value="#pro[10]" />
					</td>
				</tr>
			</s:iterator>

		</table>
	</div>
	<div style="margin-top: 10px">
		<table align="center">
			<tr style="color: black">
				<td colspan="3">总共: <s:property value="pageBeanCustomer.allRow" />
					条记录</td>
					<td>&nbsp;&nbsp;</td>
				<td>共：<s:property value="pageBeanCustomer.totalPage" />页</td>
				<td>&nbsp;&nbsp;</td>
				<td>当前第 <s:property value="pageBeanCustomer.currentPage" />页</td>
				<td>&nbsp;&nbsp;</td>
				<td><s:if test="%{pageBeanCustomer.currentPage == 1}">
 	  			第一页 上一页
 	  		</s:if> <s:else>
						<a href="queryCustomerByPage.action?pageCustomer=1">第一页</a>
						<a
							href="queryCustomerByPage.action?pageCustomer=<s:property value="%{pageBeanCustomer.currentPage-1}"/>">上一页</a>
					</s:else>
				</td>
				<td>&nbsp;&nbsp;</td>
				<td colspan="2"><s:if
						test="%{pageBeanCustomer.currentPage != pageBeanCustomer.totalPage}">
						<a
							href="queryCustomerByPage.action?pageCustomer=<s:property value="%{pageBeanCustomer.currentPage+1}"/>">下一页</a>
						<a
							href="queryCustomerByPage.action?pageCustomer=<s:property value="%{pageBeanCustomer.totalPage}"/>">最后一页</a>
					</s:if> <s:else>
 	  	     	下一页 最后一页
 	  	     </s:else>
				</td>
				
			</tr>
		</table>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>