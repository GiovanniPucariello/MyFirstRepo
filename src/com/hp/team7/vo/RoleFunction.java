package com.hp.team7.vo;

import java.io.Serializable;

public class RoleFunction implements Serializable {


	private static final long serialVersionUID = 9107345335952349733L;

	private int roleId; //角色ID
	private int funcId; //功能ID
	
	
	/**
	 * @return the roleId
	 */
	public int getRoleId() {
		return roleId;
	}
	/**
	 * @param roleId the roleId to set
	 */
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
	/**
	 * @return the funcId
	 */
	public int getFuncId() {
		return funcId;
	}
	/**
	 * @param funcId the funcId to set
	 */
	public void setFuncId(int funcId) {
		this.funcId = funcId;
	}
	
	
}
