package com.hp.team7.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.hp.team7.dao.UserDao;
import com.hp.team7.util.Page;
import com.hp.team7.vo.User;

/**
 * 用户管理模块Service
 * @author k95
 */
public class UserService {
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
	 * 用户登录
	 * @param name
	 * @param password
	 * @return
	 */
	public User userLogin(String name, String password) {
		return userDao.selectUserLoginInfo(name, password);
	}
	
	
	/**
	 * 用户信息查询
	 * @param userID
	 * @param userName
	 * @return
	 */
	public List<User> queryUser(int userID, String userName, int language, char locked){
		return userDao.queryUser(userID, userName, language, locked);
	}
	
	/**
	 * 用户信息查询，返回单个用户信息
	 * @param userName
	 * @return
	 */
	public User queryUserByName(String userName){
		return userDao.queryUserByName(userName);
	}
	
	
	/**
	 * 根据角色查询系统用户
	 * @param roleID
	 * @param customer
	 * @return
	 */
	public List<User> queryUserByRole(int roleID, int customer){
		return userDao.queryUserByRole(roleID,customer);
	}
	
	/**
	 * 查询用户信息，用于用户角色分派,排除企业客户
	 * @return
	 */
	public List<User> queryUserForRoleDistribute(){
		return userDao.queryUserForRoleDistribute();
	}
	
	
	/**
	 * 添加用户信息
	 * @param name
	 * @param password
	 * @param role_id
	 * @param is_locked
	 * @param force_chg_pwd
	 * @param language
	 * @return
	 */
	public boolean addUser(String name,String password, int role_id,
            char is_locked,char force_chg_pwd,int language){
		List<User> res = userDao.queryUser(0, name,language,is_locked);
		if(res == null){
			return userDao.addUser(name, password, role_id, is_locked, force_chg_pwd, language);
		}else{
			return false;
		}
		
	}
	

	/**
	 * 修改用户信息
	 * @param name
	 * @param password
	 * @param role_id
	 * @param is_locked
	 * @param force_chg_pwd
	 * @param language
	 * @return
	 */
	public boolean modifyUser(String name,String password,int id,
            char is_locked,char force_chg_pwd,int language){
		return userDao.modifyUser(name, password, id, is_locked, force_chg_pwd, language);
		
	} 
	
	
	/**
	 * 修改用户角色
	 * @param id
	 * @param role_id
	 * @return
	 */
	public boolean modifyUserRole(int id,int role_id){
		return userDao.modifyUserRole(id, role_id);
	}
	
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	public boolean deleteUser(int id){
		HttpSession session = ServletActionContext.getRequest().getSession();
		String uid = session.getAttribute("UserId").toString();
		if(uid.equals(Integer.toString(id))){
			return false;
		}else{
			return userDao.deleteUser(id);
		}
	}
	
	
	/**
	 * 删除多个用户
	 * @param array
	 * @return
	 */
	public boolean deleteMoreUser(int[] array){
		HttpSession session = ServletActionContext.getRequest().getSession();
		String uid = session.getAttribute("UserId").toString();
		boolean result = false;
		for(int i=0;i<array.length;i++){
			if(Integer.toString(array[i]).equals(uid)){
				result = true;
			}
		}
		if(result){
			return false;
		}else{
			return userDao.deleteMoreUser(array);
		}
	}
	
	
	/**
	 * 分页查询用户信息
	 * @param userID
	 * @param userName
	 * @param language
	 * @param locked
	 * @param pageSize
	 * @param currentPage
	 * @return
	 */
	public Page queryUserByPage(int userID, String userName, int language, char locked,int pageSize,int currentPage){
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
		
		int allRow = userDao.getAllRowCount(selectUser);
		int totalPage = Page.countTotalPage(pageSize, allRow);
		final int offset = Page.countOffset(pageSize, currentPage);
		int length = pageSize;
		final int page = Page.countCurrentPage(currentPage); 
		@SuppressWarnings("rawtypes")
		List list = userDao.queryUserByPage(selectUser, offset, length);
		
		Page pageBean = new Page();
		pageBean.setAllRow(allRow);
		pageBean.setCurrentPage(page);
		pageBean.setPageSize(pageSize);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		pageBean.init();
		return pageBean;
	}
	
	/**
	 * 查询出所有信息，用于分页
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public List listAll(){
		return userDao.listAll();
	}
	
}
