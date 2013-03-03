<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>产品信息维护</title>


<link href="css/user.css" rel="Stylesheet" type="text/css" />
<script type="text/javascript" src="js/js.js"></script>
<script src="js/jsdate.js" type="text/javascript"></script>

<script type="text/javascript">
	function queryProduct() {
		document.form1.submit();
	}

	function deleteProduct() {
		var c = document.getElementsByName("radio");
		var pid;
		var checked = false;
		for ( var i = 0; i < c.length; i++) {
			if (c[i].checked) {
				pid = c[i].value;
				checked = true;
			}
		}
		if (!checked) {
			alert("请先选择一个要删除的产品！");
		} else {
			window.location.href = "deleteProduct.action?productId=" + pid;
		}
	}

	function modifyProduct() {
		var pName = document.getElementsByName("p0");
		var productCat = document.getElementsByName("p1");
		var serialNum = document.getElementsByName("p2");
		var lot = document.getElementsByName("p3");
		var manufactureDate = document.getElementsByName("p4");
		var validityDate = document.getElementsByName("p5");
		var description = document.getElementsByName("p6");
		var price = document.getElementsByName("p7");
		var id = document.getElementsByName("p8");

		var c = document.getElementsByName("radio");

		var p0;
		var p1;
		var p2;
		var p3;
		var p4;
		var p5;
		var p6;
		var p7;
		var p8;

		var checked = false;
		for ( var i = 0; i < c.length; i++) {
			if (c[i].checked) {
				checked = true;
				p0 = pName[i].value;
				p1 = productCat[i].value;
				p2 = serialNum[i].value;
				p3 = lot[i].value;
				p4 = manufactureDate[i].value;
				p5 = validityDate[i].value;
				p6 = description[i].value;
				p7 = price[i].value;
				p8 = id[i].value;

			}
		}
		if (!checked) {
			alert("请至少选择一个要修改的产品！");
		} else {
			window.location.href = "modifyProduct.jsp?pName=" + p0
					+ "&productCat=" + p1 + "&serialNum=" + p2 + "&lot=" + p3
					+ "&manufactureDate=" + p4 + "&validityDate=" + p5
					+ "&description=" + p6 + "&price=" + p7 + "&pid=" + p8;
		}
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<%@ taglib prefix="s" uri="/struts-tags"%>
	<h2 align="left">产品信息维护</h2>
	<form name="form1" action="queryProductByPage.action" method="post">
		<table id="table1" class="one" rules="all" align="center" width="80%">
			<tr>
				<td width="13%">产品名</td>
				<td width="37%"><input type="text" name="productName"
					id="productName" maxlength="50" style="width: 80%" />
				</td>
				<td width="13%">产品条形码</td>
				<td width="37%"><input type="text" name="productSerialNum"
					id="serialNum" maxlength="50" style="width: 80%" />
				</td>
			</tr>
			<tr>
				<td width="13%">产品批次</td>
				<td width="37%"><input type="text" name="productLot" id="price"
					maxlength="20" style="width: 80%" />
				</td>
				<td width="13%">产品类别</td>
				<td width="37%"><select name="productCatSelect"
					style="width: 80%">
						<option>请选择...</option>
						<option>汽车</option>
						<option>电视机</option>
						<option>笔记本</option>
						<option>台式电脑</option>
						<option>手机</option>
						<option>游戏机</option>
						<option>沙发</option>
						<option>餐桌</option>
				</select></td>
			</tr>
			<tr>
				<td width="13%">生产日期</td>
				<td width="37%"><input type="text" name="manufactureDate"
					id="manufactureDate" maxlength="20" size="35"
					onclick="SelectDate(this,'yyyy-MM-dd')" />
				</td>
				<td width="13%">有效期</td>
				<td width="37%"><input type="text" name="validityDate"
					id="validityDate" maxlength="20" size="35"
					onclick="SelectDate(this,'yyyy-MM-dd')" />
				</td>
			</tr>
		</table>
		<table class="one1" align="center" width="40%"
			style="margin-top: 2px;">
			<tr style="width: 100%">
				<td><input class="one" type="button" name="query" value="查询"
					style="width: 80%" onclick="queryProduct()" /></td>
				<td><input type="button" class="one" name="addCustomer"
					value="增加" style="width: 80%"
					onclick="javascript:window.location.href='addProduct.jsp';" /></td>
				<td><input type="button" class="one" name="modify" value="修改"
					style="width: 80%" onclick="modifyProduct()" /></td>
				<td><input type="button" class="one" name="delete" value="删除"
					style="width: 80%"
					onclick="if(confirm('确定要删除所选产品吗？')){deleteProduct();}" /></td>
			</tr>
		</table>
	</form>
	<hr />
	<div style="margin-top: 25px">
		<table rules="cols" align="center" width="90%"
			style="margin-top: 2px;">
			<tr style="background: #CFDEFF;">
				<th></th>
				<th>产品名</th>
				<th>产品条形码</th>
				<th>产品价格</th>
				<th>产品批次</th>
				<th>产品类别</th>
				<th>生产日期</th>
				<th>有效期</th>
			</tr>
			<s:iterator id="product" value="pageBeanProduct.list">
				<s:hidden name="p0" value="${product.productName}" id="p0"></s:hidden>
				<s:hidden name="p1" value="${product.productCat}" id="p1"></s:hidden>
				<s:hidden name="p2" value="${product.serialNum}" id="p2"></s:hidden>
				<s:hidden name="p3" value="${product.lot}" id="p3"></s:hidden>
				<s:hidden name="p4" value="${product.manufactureDate}" id="p4"></s:hidden>
				<s:hidden name="p5" value="${product.validityDate}" id="p5"></s:hidden>
				<s:hidden name="p6" value="${product.description}" id="p6"></s:hidden>
				<s:hidden name="p7" value="${product.price}" id="p7"></s:hidden>
				<s:hidden name="p8" value="${product.id}" id="p8"></s:hidden>

				<tr>
					<td><input type="radio" name="radio" id="radio"
						value="${product.id}" /></td>
					<td><s:property value="productName" /></td>
					<td><s:property value="serialNum" /></td>
					<td><s:property value="price" /></td>
					<td><s:property value="lot" /></td>
					<td><s:property value="productCat" /></td>
					<td><s:property value="manufactureDate" /></td>
					<td><s:property value="validityDate" /></td>
				</tr>
			</s:iterator>

		</table>
	</div>
	<div>
		<table align="center" style="margin-top: 10px">
			<tr style="color: black">
				<td colspan="3">总共: <s:property value="pageBeanProduct.allRow" />
					条记录</td>
					<td>&nbsp;&nbsp;</td>
				<td>共：<s:property value="pageBeanProduct.totalPage" />页</td>
				<td>&nbsp;&nbsp;</td>
				<td>当前第 <s:property value="pageBeanProduct.currentPage" />页</td>
				<td>&nbsp;&nbsp;</td>
				<td><s:if test="%{pageBeanProduct.currentPage == 1}">
 	  			第一页 上一页
 	  		</s:if> <s:else>
						<a href="queryProductByPage.action?pageProduct=1">第一页</a>
						<a
							href="queryProductByPage.action?pageProduct=<s:property value="%{pageBeanProduct.currentPage-1}"/>">上一页</a>
					</s:else></td>
					<td>&nbsp;&nbsp;</td>
				<td colspan="2"><s:if
						test="%{pageBeanProduct.currentPage != pageBeanProduct.totalPage}">
						<a
							href="queryProductByPage.action?pageProduct=<s:property value="%{pageBeanProduct.currentPage+1}"/>">下一页</a>
						<a
							href="queryProductByPage.action?pageProduct=<s:property value="%{pageBeanProduct.totalPage}"/>">最后一页</a>
					</s:if> <s:else>
 	  	     	下一页 最后一页
 	  	     </s:else></td>
			</tr>

		</table>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>