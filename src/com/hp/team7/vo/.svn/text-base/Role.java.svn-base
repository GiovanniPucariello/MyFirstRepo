package com.hp.team7.vo;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;


public class Role implements Serializable {

	
	private static final long serialVersionUID = 1236543096060387784L;
	private int id;			//角色ID
	private String name;	//角色名
	private String description;//角色描述
	private Set<User> users = new HashSet<User>();//一个角色对应多个用户
	
	
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
	 * @return the users
	 */
	public Set<User> getUsers() {
		return users;
	}
	/**
	 * @param users the users to set
	 */
	public void setUsers(Set<User> users) {
		this.users = users;
	}	

    
}
