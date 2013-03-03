package com.hp.team7.service;

import java.util.List;

import com.hp.team7.dao.CustomerDao;
import com.hp.team7.dao.UserDao;
import com.hp.team7.util.Page;
import com.hp.team7.vo.Dealer;
import com.hp.team7.vo.User;
import com.hp.team7.vo.UserProfile;

/**
 * 客户管理模块
 * @author k95
 */
public class CustomerService {
	private CustomerDao customerDao;
	private UserDao userDao;
	
	/**
	 * @return the userDao
	 */
	public UserDao getUserDao() {
		return userDao;
	}

	/**
	 * @param userDao the userDao to set
	 */
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	/**
	 * @return the customerDao
	 */
	public CustomerDao getCustomerDao() {
		return customerDao;
	}

	/**
	 * @param customerDao the customerDao to set
	 */
	public void setCustomerDao(CustomerDao customerDao) {
		this.customerDao = customerDao;
	}

	/**
	 * 查询客户信息
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
		return customerDao.queryCustomer(id,realName, userId, mobile, dealerId, fax, phone);
	}
	
	
	/**
	 * 分页查询客户信息
	 * @param id
	 * @param realName
	 * @param userId
	 * @param mobile
	 * @param dealerId
	 * @param fax
	 * @param phone
	 * @param pageSize
	 * @param currentPage
	 * @return
	 */
	public Page queryCustomerByPage(int id,String realName,int userId,
			String mobile,int dealerId,String fax,String phone,int pageSize,int currentPage){
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
		
		//调用Page类，初始化分页所用的参数
		int allRow = customerDao.getAllRowCount(selectUser);
		int totalPage = Page.countTotalPage(pageSize, allRow);
		final int offset = Page.countOffset(pageSize, currentPage);
		int length = pageSize;
		final int page = Page.countCurrentPage(currentPage); 
		//返回查询出的列表,offset为起始页，length为查询记录条数
		@SuppressWarnings("rawtypes")
		List list = customerDao.queryCustomerByPage(selectUser, offset, length);
		
		Page pageBean = new Page();
		pageBean.setAllRow(allRow);
		pageBean.setCurrentPage(page);
		pageBean.setPageSize(pageSize);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		pageBean.init();
		//返回Page对象
		return pageBean;
	}
	
	
	/**
	 * 查询所有用户信息，用于分页查询
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List listAll(){
		return userDao.listAll();
	}
	
	
	/**
	 * 根据用户ID查询客户信息
	 * @param userId
	 * @return
	 */
	public List<UserProfile> queryCustomerByUserId(int userId){
		return customerDao.queryCustomerByUserId(userId);
	}
	
	
	/**
	 * 添加客户信息
	 * @param realName
	 * @param userId
	 * @param mobile
	 * @param dealerId
	 * @param phone
	 * @param email
	 * @param department
	 * @param position
	 * @param fax
	 * @param address
	 * @param description
	 * @return
	 */
	public boolean addCustomer(String realName,int userId,String mobile, int dealerId,
			String phone,String email,String department,String position,String fax,
			String address,String description){
		UserProfile userProfile = new UserProfile();
		User user = new User();
		Dealer dealer = new Dealer();
		
		userProfile.setRealName(realName);
		userProfile.setMobile(mobile);
		userProfile.setPhone(phone);
		userProfile.setEmail(email);
		userProfile.setDepartment(department);
		userProfile.setPosition(position);
		userProfile.setFax(fax);
		userProfile.setAddress(address);
		userProfile.setDescription(description);
		
		user.setId(userId);
		userProfile.setUser(user);
		dealer.setId(dealerId);
		userProfile.setDealer(dealer);
		
		return(customerDao.addCustomer(userProfile));
	}
	
	
	/**
	 * 修改客户信息
	 * @param id
	 * @param mobile
	 * @param phone
	 * @param email
	 * @param department
	 * @param position
	 * @param fax
	 * @param address
	 * @param description
	 * @return
	 */
	public boolean modifyCustomer(int id,String mobile,String phone,String email,String department,
			String position,String fax,String address,String description){
		return customerDao.modifyCustomer(id, mobile, phone, email, department, position, fax, address, description);
	}
	
	
	/**
	 * 删除客户信息，同时会删除对应的系统用户,但不会删除经销商
	 * @param id
	 * @return
	 */
	public boolean deleteCustomer(int id){
		// 根据客户id，找到对应的用户id
		List<UserProfile> userProfileList = customerDao.queryCustomerById(id);
		int userId = 0;
		if(userProfileList != null){
			userId = userProfileList.get(0).getUser().getId();
		}
		
		boolean isSuccess = customerDao.deleteCustomer(id);
		
		//删除用户的记录
		userDao.deleteUser(userId);
		
		return isSuccess;
	}

}
