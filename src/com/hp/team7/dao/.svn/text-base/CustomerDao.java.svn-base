/**
 * 
 */
package com.hp.team7.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hp.team7.vo.User;
import com.hp.team7.vo.UserProfile;

/**
 * @author 石辉
 * 客户信息管理模块
 */
public class CustomerDao extends HibernateDaoSupport {
	
	
	/**
	 * 添加企业客户
	 * @param userProfile
	 * @return boolean
	 */
	public boolean addCustomer(UserProfile userProfile){
		try{
			getHibernateTemplate().save(userProfile);
			return true;
		}catch(Exception e){
			return false;
		}
	}
	
	
	/**
	 * 更新客户信息
	 * @param id
	 * @param mobile
	 * @param phone
	 * @param email
	 * @param department
	 * @param position
	 * @param fax
	 * @param address
	 * @param description
	 * @return boolean
	 */
	public boolean modifyCustomer(int id,String mobile,String phone,String email,String department,
			String position,String fax,String address,String description){
		try{
			//先查询出客户信息，再修改
			UserProfile userProfile = queryCustomerById(id).get(0);
			userProfile.setId(id);
			userProfile.setMobile(mobile);
			userProfile.setPhone(phone);
			userProfile.setEmail(email);
			userProfile.setDepartment(department);
			userProfile.setPosition(position);
			userProfile.setFax(fax);
			userProfile.setAddress(address);
			userProfile.setDescription(description);
			getHibernateTemplate().update(userProfile);
			return true;
		}catch(Exception e){
			return false;
		}
	}
	
	/**
	 * 查询客户信息
	 * @param id
	 * @param realName
	 * @param userId
	 * @param mobile
	 * @param dealerId
	 * @param fax
	 * @param phone
	 * @return 
	 */
	public List<Object> queryCustomer(int id,String realName,int userId,
			String mobile,int dealerId,String fax,String phone){
		String selectUser = "select userp.realName,user.name,userp.phone,dealer.name,userp.mobile," +
				"userp.email,userp.department,userp.position,userp.fax,userp.address,userp.description,userp.id" +
				" from UserProfile userp,User user,Dealer dealer where userp.dealer.id=dealer.id and userp.user.id=user.id";
		if(!"".equals(realName)){
			selectUser += " and userp.realName='" + realName + "'";
		}
		if(!"".equals(mobile)){
			selectUser += " and userp.mobile='" + mobile + "'";
		}
		if(!"".equals(fax)){
			selectUser += " and userp.fax='" + fax + "'";
		}
		if(!"".equals(phone)){
			selectUser += " and userp.phone='" + phone + "'";
		}
		if(userId != 0){
			selectUser += " and userp.user.id=" + userId;
		}
		if(dealerId != 0){
			selectUser += " and userp.dealer.id=" + dealerId;
		}
		if(id != 0){
			selectUser += " and userp.id=" + id;
		}
		
		@SuppressWarnings("unchecked")
		List<Object> profileList = getHibernateTemplate().find(selectUser);
		
		if(profileList != null && profileList.size()>0){
			return profileList;
		}else{
			return null;
		}
	}
	
	/**
	 * 通过经销商id查询企业客户信息
	 * @param dealerId
	 * @return profileList<UserProfile>
	 */
	public List<UserProfile> queryCustomerByDealerId(int dealerId){
		String selectUserById = "from UserProfile as userp where userp.dealer.id=" + dealerId;

		@SuppressWarnings("unchecked")
		List<UserProfile> profileList = getHibernateTemplate().find(selectUserById);

		if(profileList != null && profileList.size()>0){
			return profileList;
		}else{
			return null;
		}
	}
	
	
	/**
	 * 通过用户id查询企业客户信息
	 * @param dealerId
	 * @return profileList<UserProfile>
	 */
	public List<UserProfile> queryCustomerByUserId(int userId){
		String selectUserById = "from UserProfile as userp where userp.user.id=" + userId;

		@SuppressWarnings("unchecked")
		List<UserProfile> profileList = getHibernateTemplate().find(selectUserById);

		if(profileList != null && profileList.size()>0){
			return profileList;
		}else{
			return null;
		}
	}
	
	
	/**
	 * 根据ID查询客户信息，返回UserProfile类型
	 * @param id
	 * @return boolean
	 */
	public List<UserProfile> queryCustomerById(int id){
		String sql = "from UserProfile pro where 1=1";
		if(id != 0){
			sql += " and pro.id=" + id;
		}
		@SuppressWarnings("unchecked")
		List<UserProfile> plist = getHibernateTemplate().find(sql);
		
		if(plist != null && plist.size()>0){
			return plist;
		}else{
			return null;
		}
	}
	
	
	/**
	 * 删除客户信息
	 * @param id
	 * @return boolean
	 */
	public boolean deleteCustomer(int id){
		try{
			UserProfile userProfile = new UserProfile();
			userProfile.setId(id);
			getHibernateTemplate().delete(userProfile);
			return true;
		}catch(Exception e){
			return false;
		}
	}
	
	
	/**
	 * 分页查询客户信息
	 * @param selectUser
	 * @param offset
	 * @param length
	 * @return userList<Object>
	 */
	public List<Object> queryCustomerByPage(final String selectUser,final int offset,final int length){

		@SuppressWarnings("unchecked")
		List<Object> userList = getHibernateTemplate().executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session)throws HibernateException, SQLException {
				Query query = session.createQuery(selectUser); 
				query.setFirstResult(offset); 
				query.setMaxResults(length);
				List<Object> userList = query.list();
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
	 * 查询出所有记录,用于分页查询
	 * @return List
	 */
	@SuppressWarnings("unchecked")
	public List<User> listAll() {
		return getHibernateTemplate().find("from UserProfile");
	}
	
	
	/**
	 * 取得所有行数,用于分页查询
	 * @param hsql
	 * @return size int
	 */
	public int getAllRowCount(String hsql) {
		return getHibernateTemplate().find(hsql).size();
	}
		
	
}
