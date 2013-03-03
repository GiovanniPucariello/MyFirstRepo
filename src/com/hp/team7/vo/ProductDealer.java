/**
 * 
 */
package com.hp.team7.vo;

import java.io.Serializable;

/**
 * @author 石辉
 *
 */
public class ProductDealer implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5902031289132635984L;
	
	private int id;	//经销商产品ID
	private String description;	//描述
	private Dealer dealer;
	private Product product;
	
	
	/**
	 * @return the dealer
	 */
	public Dealer getDealer() {
		return dealer;
	}
	/**
	 * @param dealer the dealer to set
	 */
	public void setDealer(Dealer dealer) {
		this.dealer = dealer;
	}
	/**
	 * @return the product
	 */
	public Product getProduct() {
		return product;
	}
	/**
	 * @param product the product to set
	 */
	public void setProduct(Product product) {
		this.product = product;
	}
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

}
