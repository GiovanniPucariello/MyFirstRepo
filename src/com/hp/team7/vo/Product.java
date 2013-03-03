/**
 * 
 */
package com.hp.team7.vo;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

/**
 * @author 石辉
 *
 */
public class Product implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8804263977199213553L;
	
	private int id;		//产品ID
	private String productName;//产品名
	private String productCat;//所属类型
	private String serialNum; //产品序列号
	private String lot;	//产品批次号
	private String manufactureDate;	//生产日期
	private String validityDate;	//产品有效期
	private String description;	//产品描述
	private float price;	//产品价格
	private Set<ProductDealer> productDealers = new HashSet<ProductDealer>();
	
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the lot
	 */
	public String getLot() {
		return lot;
	}
	/**
	 * @param lot the lot to set
	 */
	public void setLot(String lot) {
		this.lot = lot;
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
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	/**
	 * @return the productCat
	 */
	public String getProductCat() {
		return productCat;
	}
	/**
	 * @param productCat the productCat to set
	 */
	public void setProductCat(String productCat) {
		this.productCat = productCat;
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
	 * @return the serialNum
	 */
	public String getSerialNum() {
		return serialNum;
	}
	/**
	 * @param serialNum the serialNum to set
	 */
	public void setSerialNum(String serialNum) {
		this.serialNum = serialNum;
	}
	/**
	 * @return the productDealers
	 */
	public Set<ProductDealer> getProductDealers() {
		return productDealers;
	}
	/**
	 * @param productDealers the productDealers to set
	 */
	public void setProductDealers(Set<ProductDealer> productDealers) {
		this.productDealers = productDealers;
	}
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
	
}
