<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户角色分派</title>

<script type="text/javascript" src="js/jquery-1.2.6.min.js"></script>
<script type="text/javascript">
	function moveLeftToRight() {
		var leftSelect = document.selectForm.leftSelect;
		var rightSelect = document.selectForm.rightSelect;
		var arrSelValue = new Array();
		var arrSelText = new Array();

		for ( var i = 0; i < leftSelect.options.length; i++) {
			if (leftSelect.options[i].selected == true) {
				arrSelValue[0] = leftSelect.options[i].value;
				arrSelText[0] = leftSelect.options[i].text;
				
				arrSelValue[1] = rightSelect.options[0].value;
				arrSelText[1] = rightSelect.options[0].value;
				
				rightSelect.removeChild(rightSelect.options[0]);
				var option1 = document.createElement("option");
				leftSelect.appendChild(option1);
				option1.text = arrSelText[1];
				option1.value = arrSelValue[1];

				var oOption = document.createElement("option");
				rightSelect.appendChild(oOption);
				oOption.text = arrSelText[0];
				oOption.value = arrSelValue[0];

				leftSelect.removeChild(leftSelect.options[i]);

			}
		}
	}

	function moveRightToLeft() {
		var leftSelect = document.selectForm.leftSelect;
		var rightSelect = document.selectForm.rightSelect;
		var arrSelValue = new Array();
		var arrSelText = new Array();

		for ( var i = 0; i < rightSelect.options.length; i++) {
			if (rightSelect.options[i].selected == true) {
				arrSelValue[0] = rightSelect.options[i].value;
				arrSelText[0] = rightSelect.options[i].text;

				var oOption = document.createElement("option");
				leftSelect.appendChild(oOption);
				oOption.text = arrSelText[0];
				oOption.value = arrSelValue[0];

				rightSelect.removeChild(rightSelect.options[i]);

			}
		}
	}
	
	function changeNameSelect(){
		var name = document.selectForm.name.value;
		window.location.href="queryUserByName.action?nameRole=" + name;
	}
	
	function loadcreate(){
		var roleid = document.selectForm.roleid.value;
		var leftSelect = document.selectForm.leftSelect;
		var rightSelect = document.selectForm.rightSelect;
		if(roleid == 1){//如果是客户经理
			var oOption = document.createElement("option");
			rightSelect.appendChild(oOption);
			oOption.text = "客户经理";
			
			/**
			var oOption = document.createElement("option");
			leftSelect.appendChild(oOption);
			oOption.text = "企业客户";
			*/
			
			var oOption = document.createElement("option");
			leftSelect.appendChild(oOption);
			oOption.text = "系统管理员";
			
		}else if(roleid == 2){//如果是企业客户
			/**
			var oOption = document.createElement("option");
			leftSelect.appendChild(oOption);
			oOption.text = "客户经理";
			
			var oOption = document.createElement("option");
			leftSelect.appendChild(oOption);
			oOption.text = "系统管理员";
			*/
			
			var oOption = document.createElement("option");
			rightSelect.appendChild(oOption);
			oOption.text = "企业客户";
			
			
		}else if(roleid == 3){//如果是系统管理员
			var oOption = document.createElement("option");
			leftSelect.appendChild(oOption);
			oOption.text = "客户经理";
			
			/**
			var oOption = document.createElement("option");
			leftSelect.appendChild(oOption);
			oOption.text = "企业客户";
			*/
			
			var oOption = document.createElement("option");
			rightSelect.appendChild(oOption);
			oOption.text = "系统管理员";
		}else{
			
		}
	}
	function modify(){
		var roleid = document.selectForm.roleid.value;
		var id = document.selectForm.id.value;
		var select = document.selectForm.rightSelect[0].value;
		if(roleid=="" || id==""){
			alert("请先选择用户!");
			location.reload();
		}else{
			window.location.href="modifyUserRole.action?userRole_s=" + select + "&id=" + id;
		}
	}
</script>
</head>
<body onload=loadcreate()>
<jsp:include page="header.jsp" />
	<h2 align="left">用户角色分派</h2>
	<form name="selectForm" action="modifyUserRole.action" method="post">
		<input type="hidden" value="<s:property value='userRole.getRole().getId()'/>" name="roleid" />
		<input type="hidden" value="<s:property value='userRole.id'/>" name="id" />
		<table align="center" class="one"   rules="all" width="40%">
			<tr>
				<td style="width: 20%">用户名</td>
				<td style="width: 30%">
				<select name="name" onchange="changeNameSelect()" style="width: 160px;">
						<option>请选择...</option>
						<s:iterator id="users" value="rrList">
						<s:set name="rrName" value="${users.name}" />
							<option
							<s:if test="${rrName==userRole.name}">
								selected='selected'
							</s:if>
							><s:property value="name" /></option>
						</s:iterator>
				</select>
				</td>
			</tr>
			<tr>
				<td style="width: 20%">用户ID</td>
				<td style="width: 30%">
					<label id="userid">
					<s:property value="userRole.id" />
					</label>
				</td>
			</tr>
			<tr>
				<td style="width: 20%">用户名</td>
				<td style="width: 30%">
					<label id="username">
					<s:property value="userRole.name" />
					</label>
				</td>
			</tr>
		</table>
		<br /> <br />
		<hr />
		
		<table align="center" class="one" width="40%" height="50%">
			<tr>
				<th align="center" style="width: 40%">未分派角色</th>
				<th align="center" style="width: 20%">&nbsp;</th>
				<th align="center" style="width: 40%">已分派角色</th>
			</tr>
			<tr style="width:200px;height:100px">
				<td rowspan="4">
				<select multiple="multiple" name="leftSelect"
					style="height: 100%; width: 100%">
				</select>
				</td>

				<td align="center">
				    <input type="button" name="left_right"
					onclick="moveLeftToRight()" value=">" class="addFunction_button"
					style="width: 60%;margin-top:20%;" />
				</td>

				<td rowspan="4">
				<select multiple="multiple" name="rightSelect"
					style="height: 100%; width: 100%">
				</select>
				</td>
			</tr>
		</table>
		<br/>
		<table align="center" width="50%">
			<tr align="right">
			 <td rowspan="2" align="center">
				<input type="button" name="saveuser" value="保存" onclick="modify()" />
				<input type="button" value="主页" onclick="javascript:window.location.href='index.jsp';" />
			 </td>
			</tr>
		</table>
	</form>
	
	<jsp:include page="footer.jsp" />
</body>
</html>