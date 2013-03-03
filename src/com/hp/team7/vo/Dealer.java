package com.hp.team7.vo;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Dealer implements Serializable {
	
	private static final long serialVersionUID = -3091708022145687752L;
	
	private int id;			//经销商ID
	private String name;	//经销商名字
	private String address;	//经销商地址
	private String description;	//经销商描述
	private Set<UserProfile> userProfiles = new HashSet<UserProfile>();
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
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	/**
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}
	
	/**
	 * @param address the address to set
	 */
	public void setAddress(String address) {
		this.address = address;
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
	 * @return the userProfiles
	 */
	public Set<UserProfile> getUserProfiles() {
		return userProfiles;
	}
	
	/**
	 * @param userProfiles the userProfiles to set
	 */
	public void setUserProfiles(Set<UserProfile> userProfiles) {
		this.userProfiles = userProfiles;
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
	
}
