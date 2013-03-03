<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色功能分派</title>

<script type="text/javascript" src="js/jquery-1.2.6.min.js"></script>
<script type="text/javascript">
	function moveLeftToRight() {
		var leftSelect = document.selectFunctionForm.leftSelect;
		var rightSelect = document.selectFunctionForm.rightSelect;
		var arrSelValue = new Array();
		var arrSelText = new Array();
		for ( var i = 0; i < leftSelect.options.length; i++) {
			if (leftSelect.options[i].selected == true) {
				arrSelValue[0] = leftSelect.options[i].value;
				arrSelText[0] = leftSelect.options[i].text;

				var oOption = document.createElement("option");
				rightSelect.appendChild(oOption);
				oOption.text = arrSelText[0];
				oOption.value = arrSelValue[0];

				leftSelect.removeChild(leftSelect.options[i]);

			}
		}
	}

	function moveRightToLeft() {
		var leftSelect = document.selectFunctionForm.leftSelect;
		var rightSelect = document.selectFunctionForm.rightSelect;
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

	function moveAllLeftToRight() {
		var leftSelect = document.selectFunctionForm.leftSelect;
		var rightSelect = document.selectFunctionForm.rightSelect;
		//var arrSelValue = new Array();
		//var arrSelText = new Array();

		for ( var i = 0; i < leftSelect.options.length; i++) {
			var optionLeft = leftSelect.options[i];

			//arrSelValue[i] = leftSelect.options[i].value;
			//arrSelText[i] = leftSelect.options[i].text;

			var oOption = document.createElement("option");
			rightSelect.appendChild(oOption);
			oOption.text = optionLeft.text;
			oOption.value = optionLeft.value;

			leftSelect.removeChild(optionLeft);

		}
	}
	
	function moveAllRightToLeft() {
		var leftSelect = document.selectFunctionForm.leftSelect;
		var rightSelect = document.selectFunctionForm.rightSelect;
		var arrSelValue = new Array();
		var arrSelText = new Array();

		for ( var i = 0; i < rightSelect.options.length; i++) {
			// rightSelect.options[i].selected = "selected";

			arrSelValue[i] = rightSelect.options[i].value;
			arrSelText[i] = rightSelect.options[i].text;

			var oOption = document.createElement("option");
			leftSelect.appendChild(oOption);
			oOption.text = arrSelText[i];
			oOption.value = arrSelValue[i];

			rightSelect.removeChild(rightSelect.options[i]);

		}
	}
</script>
</head>
<body>
<jsp:include page="header.jsp" />
<h2 align="left">角色功能分派</h2>
	<form name="selectFunctionForm">
		<table align="center" width="40%">
			<tr>
				<td style="width:20%">角色名称</td>
				<td style="width:30%">
				<select style="width:80%">
						<option value="manager">客户经理</option>
						<option value="client">企业客户</option>
						<option value="admin">系统管理员</option>
				</select>
				</td>
				<td style="width:25%">&nbsp;&nbsp;&nbsp;角色描述</td>
				<td style="width:25%"><label id=“role_describe”></label>
				</td>
			</tr>
		</table>
		<br/><br/>

		<table align="center" width="40%">
			<tr>
				<th align="center" style="width:40%">未分派功能</th>
				<th align="center" style="width:20%">&nbsp;</th>
				<th align="center" style="width:40%">已分派功能</th>
			</tr>
			<tr>
				<td rowspan="4">
				<select multiple="multiple" name="leftSelect" 
					style="height:100%; width:100%">
						<option>订单审批1</option>
						<option>企业客户1</option>
						<option>产品类别维护1</option>
				</select>
				</td>

				<td align="center">
				<input type="button" name="add_function"
					onclick="moveLeftToRight()" value=">" class="addFunction_button"
					style="width:60%" />
				</td>

				<td rowspan="4"><select multiple="multiple" name="rightSelect"
					style="height:100%;width:100%">
						<option>订单审批2</option>
						<option>企业客户2</option>
						<option>产品类别维护2</option>
				</select>
				</td>
			</tr>
			<tr>
				<td align="center">
				<input type="button" name="delete_function" onclick="moveRightToLeft()" value="<" style="width:60%;">
				</td>
			</tr>
			<tr>
				<td align="center">
				<input type="button" name="addAll_function"
					onclick="moveAllLeftToRight()" value=">>"
					class="addAllFunction_button" style="width:60%" />
				</td>
			</tr>
			<tr>
				<td align="center">
				<input type="button" name="deleteAll_function" 
					onclick="moveAllRightToLeft()" value="<<" style="width:60%" />
				</td>
			</tr>
		</table>
		<table align="center" width="50%">
			<tr>
				<td align="center">
				<input type="submit" name="submit" value="保存" class="submit" /> 
				</td>
				<td align="center">				
				<input type="button" value="主页" onclick="javascript:window.location.href='index.jsp';" />
				</td>
			</tr>
		</table>
	</form>
	
	<jsp:include page="footer.jsp" />
</body>
</html>