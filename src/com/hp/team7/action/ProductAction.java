package com.hp.team7.action;

import java.util.List;

import com.hp.team7.service.ProductService;
import com.hp.team7.util.Page;
import com.hp.team7.vo.Product;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 产品信息管理Action类
 * @author k95
 */
public class ProductAction extends ActionSupport {

	private static final long serialVersionUID = 2497661631974306907L;

	private ProductService productService;
	private int productId;

	private String productName;   // 获取查询产品信息的产品名称
	private List<Product> productList;  // 获取查询产品的信息列表

	private String productDescription;//产品描述
	private String productCatSelect;        //产品类别下拉列表
	private String productSerialNum;  //产品条形码 
	private String productLot;  //产品批次
	private String manufactureDate;  //产品生产日期
	private String validityDate;  //产品有效期
	private float price;          //产品价格

	private Page pageBeanProduct;//用于分页
	private int pageProduct;//当前页



	/**
	 * @return the price
	 */
	public float getPrice() {
		return price;
	}

	/**
	 * @param price the price to set
	 */
	public void setPrice(float price) {
		this.price = price;
	}

	/**
	 * @return the manufactureDate
	 */
	public String getManufactureDate() {
		return manufactureDate;
	}

	/**
	 * @param manufactureDate the manufactureDate to set
	 */
	public void setManufactureDate(String manufactureDate) {
		this.manufactureDate = manufactureDate;
	}

	/**
	 * @return the validityDate
	 */
	public String getValidityDate() {
		return validityDate;
	}

	/**
	 * @param validityDate the validityDate to set
	 */
	public void setValidityDate(String validityDate) {
		this.validityDate = validityDate;
	}

	/**
	 * @return the productLot
	 */
	public String getProductLot() {
		return productLot;
	}

	/**
	 * @param productLot the productLot to set
	 */
	public void setProductLot(String productLot) {
		this.productLot = productLot;
	}

	/**
	 * @return the productSerialNum
	 */
	public String getProductSerialNum() {
		return productSerialNum;
	}

	/**
	 * @param productSerialNum the productSerialNum to set
	 */
	public void setProductSerialNum(String productSerialNum) {
		this.productSerialNum = productSerialNum;
	}

	/**
	 * @return the pageBeanProduct
	 */
	public Page getPageBeanProduct() {
		return pageBeanProduct;
	}

	/**
	 * @param pageBeanProduct the pageBeanProduct to set
	 */
	public void setPageBeanProduct(Page pageBeanProduct) {
		this.pageBeanProduct = pageBeanProduct;
	}

	/**
	 * @return the pageProduct
	 */
	public int getPageProduct() {
		return pageProduct;
	}

	/**
	 * @param pageProduct the pageProduct to set
	 */
	public void setPageProduct(int pageProduct) {
		this.pageProduct = pageProduct;
	}

	private Product queryProduct;

	/**
	 * @return the productCatSelect
	 */
	public String getProductCatSelect() {
		return productCatSelect;
	}

	/**
	 * @param productCatSelect the productCatSelect to set
	 */
	public void setProductCatSelect(String productCatSelect) {
		this.productCatSelect = productCatSelect;
	}

	/**
	 * @return the productId
	 */
	public int getProductId() {
		return productId;
	}

	/**
	 * @param productId the productId to set
	 */
	public void setProductId(int productId) {
		this.productId = productId;
	}

	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}

	/**
	 * @param productName the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}

	/**
	 * @return the productList
	 */
	public List<Product> getProductList() {
		return productList;
	}

	/**
	 * @param productList the productList to set
	 */
	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}

	/**
	 * @return the productDescription
	 */
	public String getProductDescription() {
		return productDescription;
	}

	/**
	 * @param productDescription the productDescription to set
	 */
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	/**
	 * @return the productService
	 */
	public ProductService getProductService() {
		return productService;
	}

	/**
	 * @param productService the productService to set
	 */
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	/**
	 * @return the queryProduct
	 */
	public Product getQueryProduct() {
		return queryProduct;
	}

	/**
	 * @param queryProduct the queryProduct to set
	 */
	public void setQueryProduct(Product queryProduct) {
		this.queryProduct = queryProduct;
	}

	/**
	 * 产品信息查询通过id和name
	 * @return
	 */
	public String queryProduct(){
		productList = productService.queryProduct(productId, productName);
		clear();//清空原来的查询信息
		return "success";
	}

	/**
	 * 分页查询用户信息
	 * @return
	 */
	public String queryProductByPage(){
		if("请选择...".equals(productCatSelect) || productCatSelect==null){
			productCatSelect = "";
		}
		if(productName==null){
			productName = "";
		}

		if(productSerialNum == null){
			productSerialNum = "";
		}
		if(productLot == null){
			productLot = "";
		}
		if(manufactureDate == null){
			manufactureDate = "";
		}
		if(validityDate == null){
			validityDate = "";
		}

		//返回产品详细信息
		pageBeanProduct = productService.queryProductByPage( productName, productSerialNum, productLot, productCatSelect,
				manufactureDate, validityDate, 5, pageProduct);
		clear();//清空原来的查询信息
		pageProduct = 0;
		return "success";
	}

	/**
	 * 添加产品信息
	 * @return
	 */
	public String addProduct(){
		if("请选择...".equals(productCatSelect) || "请选择...".equals(productCatSelect)){
			return "error";//用户未选择
		}
		else if(productName.trim()==""){
			return "error";//验证产品名
		}
		else if(productSerialNum.trim()==""){
			return "error";//验证序列号
		}
		else if(manufactureDate.trim()==""){
			return "error";//验证生产日期
		}

		Product addProduct = new Product();

		addProduct.setLot(productLot);
		addProduct.setManufactureDate(manufactureDate);
		addProduct.setValidityDate(validityDate);
		addProduct.setDescription(productDescription);
		addProduct.setPrice(price);
		addProduct.setProductCat(productCatSelect);
		addProduct.setProductName(productName);
		addProduct.setSerialNum(productSerialNum);

		clear();

		if(productService.addProduct(addProduct)){
			return "success";
		}else{
			return "error";
		}
	}

	/**
	 * 删除产品
	 * @return
	 */
	public String deleteProduct() {
		boolean isSuccess = productService.deleteProduct(productId);

		if(isSuccess == true) {
			return "success";
		} else {
			return "error";
		}

	}

	/**
	 * 修改产品信息
	 * @return
	 */
	public String modifyProduct(){
		Product modifyProduct = new Product();
		
		modifyProduct.setId(productId);
		modifyProduct.setLot(productLot);
		modifyProduct.setManufactureDate(manufactureDate);
		modifyProduct.setValidityDate(validityDate);
		modifyProduct.setDescription(productDescription);
		modifyProduct.setPrice(price);
		modifyProduct.setProductCat(productCatSelect);
		modifyProduct.setProductName(productName);
		modifyProduct.setSerialNum(productSerialNum);

		clear();

		if(productService.modifyProduct(modifyProduct)){
			return "success";
		}else{
			return "error";
		}
	}

	/**
	 * 清空残留信息
	 */
	public void clear(){
		productName = "";
		productId = 0;
		productSerialNum = "";
		productLot = "";
		productDescription = "";
		productCatSelect = "";
	}

}
