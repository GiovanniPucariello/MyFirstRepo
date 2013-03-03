package com.hp.team7.service;


import java.util.List;

import com.hp.team7.dao.RoleDao;
import com.hp.team7.vo.Role;

/**
 * 角色模块Service
 * @author k95
 */
public class RoleService {
	private RoleDao roleDao;
	
	/**
	 * @return the roleDao
	 */
	public RoleDao getRoleDao() {
		return roleDao;
	}


	/**
	 * @param roleDao the roleDao to set
	 */
	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}


	/**
	 * 查询角色信息列表
	 * @param name
	 * @return
	 */
	public List<Role> queryRole(String roleName) {
		return roleDao.queryRole(roleName);
	}
	
	
	/**
	 * 添加角色
	 * @param name
	 * @param description
	 * @return
	 */
	public boolean addRole(String name,String description){
		List<Role> ro = roleDao.queryRole(name);
		if(ro == null){
			return roleDao.addRole(name,description);
		}else{
			return false;
		}
		
	}
	
	/**
	 * 删除角色
	 * @param roleName
	 * @return
	 */
	public boolean deleteRole(int id){
		return roleDao.deleteRole(id);
	}
	
	
	/**
	 * 修改角色信息
	 * @param id
	 * @param description
	 * @return
	 */
	public boolean modifyRole(int id, String description, String name){
		return roleDao.modifyRole(id, description, name);
	}


}
