package com.hp.team7.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hp.team7.vo.Role;
import com.hp.team7.vo.User;


/**
 * 
 * @author 
 * 用户管理模块
 */
public class UserDao extends HibernateDaoSupport {	
	
	/**
	 * 验证用户名和密码是否正确
	 * @param name
	 * @param password
	 * @return
	 */
	public User selectUserLoginInfo(String name, String password) {
		String[] param = new String[] { name, password };
		String selectUserLoginHql = "from User as user where user.name=? and user.password=?"; 
		
		@SuppressWarnings("unchecked")
		List<User> userList = getHibernateTemplate().find(selectUserLoginHql, param);
		
		if(userList != null && userList.size() > 0) {
			return userList.get(0);
		} else {
			return null;
		}
	}
	
	
	/**
	 * 查询用户信息
	 * @param userID
	 * @param userName
	 * @param language
	 * @param locked
	 * @return userList List<User>
	 */
	public List<User> queryUser(int userID, String userName, int language, char locked){
		String selectUser = "from com.hp.team7.vo.User as user where 1=1";
		if(userID != 0){
			selectUser += " and user.id=" + userID;
		}
		if(!"".equals(userName)){
			selectUser += " and user.name='" + userName + "'";
		}
		if(language != 0){
			selectUser += " and user.language=" + language;
		}
		if(locked != '2'){
			selectUser += " and user.is_locked='" + locked + "'";
		}
		
		@SuppressWarnings("unchecked")
		List<User> userList = getHibernateTemplate().find(selectUser);
		
		if(userList != null && userList.size()>0){
			return userList;
		}else{
			return null;
		}
	}
	
	
	/**
	 * 用户信息查询，返回单个用户信息
	 * @param userName
	 * @return user User
	 */
	public User queryUserByName(String userName){
		String selectUser = "from com.hp.team7.vo.User as user where user.name='" 
					+ userName + "'";
		@SuppressWarnings("unchecked")
		List<User> userlist = getHibernateTemplate().find(selectUser);
		
		if(userlist != null && userlist.size()>0){
			return userlist.get(0);
		}else{
			return null;
		}
	}
	
	/**
	 * 根据角色查询系统用户
	 * @param roleID
	 * @param customer
	 * @return rlist List<User>
	 */
	public List<User> queryUserByRole(int roleID, int customer){
		/*select * from user where user.role_id=2 and user.id not in(select user_id from user_profile);
		 * 如果customer为1，表示添加客户时只列出没有被使用过的用户信息
		 */
		String selectUser = "from com.hp.team7.vo.User as user where user.role.id=" + roleID;
		if(customer == 1){
			selectUser += " and user.id not in(select userp.user.id from UserProfile userp)";
		}
		@SuppressWarnings("unchecked")
		List<User> rlist = getHibernateTemplate().find(selectUser);
		
		if(rlist != null && rlist.size()>0){
			return rlist;
		}else{
			return null;
		}
	}
	
	
	/**
	 * 查询用户信息，用于用户角色分派,排除企业客户
	 * @return
	 */
	public List<User> queryUserForRoleDistribute(){
		String selectUser = "from com.hp.team7.vo.User as user where user.role.id !=2";
		@SuppressWarnings("unchecked")
		List<User> distributelist = getHibernateTemplate().find(selectUser);
		
		if(distributelist != null && distributelist.size()>0){
			return distributelist;
		}else{
			return null;
		}
	}
	
	
	/**
	 * 添加用户信息
	 * @param name
	 * @param password
	 * @param role_id
	 * @param is_locked
	 * @param force_chg_pwd
	 * @param language
	 * @return boolean
	 */
	public boolean addUser(String name,String password, int role_id,
        char is_locked,char force_chg_pwd,int language){
		try{
			User user=new User();
			Role role=new Role();
			
			role.setId(role_id);

			user.setName(name);
			user.setPassword(password);
			user.setIs_locked(is_locked);
			user.setForce_chg_pwd(force_chg_pwd);
			user.setLanguage(language);
			user.setRole(role);
			
			getHibernateTemplate().save(user);
			return true;
		}catch(Exception e){
			return false;
		}
	}
	
	
	/**
	 * 修改用户信息
	 * @param name
	 * @param password
	 * @param id
	 * @param role_id
	 * @param is_locked
	 * @param force_chg_pwd
	 * @param language
	 * @return boolean
	 */
	public boolean modifyUser(String name,String password,int id,
			                  char is_locked,char force_chg_pwd,int language){
		try{
			String selectUser = "from com.hp.team7.vo.User as user where user.id=" + id;
			@SuppressWarnings("unchecked")
			List<User> ulist = getHibernateTemplate().find(selectUser);
			User user= ulist.get(0);
			
			user.setName(name);
			user.setPassword(password);
			user.setId(id);
			user.setIs_locked(is_locked);
			user.setForce_chg_pwd(force_chg_pwd);
			user.setLanguage(language);
			
			getHibernateTemplate().update(user);
			return true;
		}catch(Exception e){
			return false;
		}
	} 
	
	
	/**
	 * 修改用户角色
	 * @param id
	 * @param role_id
	 * @return boolean
	 */
	public boolean modifyUserRole(int id,int role_id){
		String selectUser = "from com.hp.team7.vo.User as user where user.id=" + id;
		String selectRole = "from com.hp.team7.vo.Role as role where role.id=" + role_id;
		@SuppressWarnings("unchecked")
		List<User> userlist = getHibernateTemplate().find(selectUser);
		@SuppressWarnings("unchecked")
		List<Role> rolelist = getHibernateTemplate().find(selectRole);
		if(userlist != null && userlist.size()>0 && rolelist != null && rolelist.size()>0){
			User user = userlist.get(0);
			Role role = rolelist.get(0);
			
			role.setId(role_id);
			user.setId(id);
			user.setRole(role);
			
			getHibernateTemplate().update(user);
			return true;
		}else{
			return false;
		}
	}
	
	
	/**
	 * 删除用户
	 * @param id
	 * @return boolean
	 */
	public boolean deleteUser(int id){
		try{
			User user=new User();
			user.setId(id);
			getHibernateTemplate().delete(user);
			return true;
		}
		catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * 删除多个用户
	 */
	public boolean deleteMoreUser(int[] array){
		try{
			for(int i=0;i<array.length;i++){
				User user=new User();
				user.setId(array[i]);
				getHibernateTemplate().delete(user);
			}
	        return true;
		}catch(Exception e){
			return false;
		}
	}
	
	
	/**
	 * 分页查询用户信息
	 * @param selectUser
	 * @param offset  开始记录
	 * @param length  一次查询几条记录
	 * @return userList List<User>
	 */
	public List<User> queryUserByPage(final String selectUser,final int offset,final int length){
		@SuppressWarnings("unchecked")
		List<User> userList = getHibernateTemplate().executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session)throws HibernateException, SQLException {
				Query query = session.createQuery(selectUser); 
				query.setFirstResult(offset); 
				query.setMaxResults(length);
				List<User> userList = query.list();
				return userList;
			}
		});
		if(userList != null && userList.size()>0){
			return userList;
		}else{
			return null;
		}
	}
	
	/**
	 * 查询出所有用户信息，用于分页
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<User> listAll() {
		return getHibernateTemplate().find("from User");
	}
	
	/**
	 * 获得行数，用于分页
	 * @param hsql
	 * @return
	 */
	public int getAllRowCount(String hsql) {
		return getHibernateTemplate().find(hsql).size();
	}
				

}
