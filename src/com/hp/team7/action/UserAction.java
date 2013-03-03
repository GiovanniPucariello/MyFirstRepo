package com.hp.team7.action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.hp.team7.service.CustomerService;
import com.hp.team7.service.UserService;
import com.hp.team7.util.Encryption;
import com.hp.team7.util.Page;
import com.hp.team7.vo.User;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 用户管理Action类 
 * @author k95
 */
public class UserAction extends ActionSupport {
	
	private static final long serialVersionUID = 4952413582915480320L;
	
	private String name;	//用户姓名
	private String password;	//用户密码
	private UserService userService;	
	private CustomerService customerService;
	private List<User> userList;//用户信息查询返回列表
	private List<User> rrList; //根据角色查询返回的用户列表
	private int id;			//用户ID
	private String is_locked_s;//是否禁用
	private String force_chg_pwd_s;//首次登录是否修改密码
	private String language_s;//语言
	private String userRole_s;//所选角色
	private User user;
	private String deletearray;//用于删除的用户ID数组
	private String languageSelect;//用户所选语言
	private String nameRole;//角色分派中的用户名
	private User userRole;//角色分派中返回的对象
	private int uuid;//用于显示详细信息的参数
	private String uuname;//用于显示详细信息的参数
	private Page pageBean;//用于分页
	private int page;//当前页
	private String isLockedSelect;

	
	/**
	 * @return the uuname
	 */
	public String getUuname() {
		return uuname;
	}

	/**
	 * @param uuname the uuname to set
	 */
	public void setUuname(String uuname) {
		this.uuname = uuname;
	}

	/**
	 * @return the rrList
	 */
	public List<User> getRrList() {
		return rrList;
	}

	/**
	 * @param rrList the rrList to set
	 */
	public void setRrList(List<User> rrList) {
		this.rrList = rrList;
	}
	/**
	 * @return the page
	 */
	public int getPage() {
		return page;
	}

	/**
	 * @param page the page to set
	 */
	public void setPage(int page) {
		this.page = page;
	}
	/**
	 * @return the pageBean
	 */
	public Page getPageBean() {
		return pageBean;
	}

	/**
	 * @param pageBean the pageBean to set
	 */
	public void setPageBean(Page pageBean) {
		this.pageBean = pageBean;
	}
	
	/**
	 * @return the uuid
	 */
	public int getUuid() {
		return uuid;
	}

	/**
	 * @param uuid the uuid to set
	 */
	public void setUuid(int uuid) {
		this.uuid = uuid;
	}

	/**
	 * @return the customerService
	 */
	public CustomerService getCustomerService() {
		return customerService;
	}

	/**
	 * @param customerService the customerService to set
	 */
	public void setCustomerService(CustomerService customerService) {
		this.customerService = customerService;
	}
	
	/**
	 * @return the userRole
	 */
	public User getUserRole() {
		return userRole;
	}

	/**
	 * @param userRole the userRole to set
	 */
	public void setUserRole(User userRole) {
		this.userRole = userRole;
	}
	
	/**
	 * @return the nameRole
	 */
	public String getNameRole() {
		return nameRole;
	}

	/**
	 * @param nameRole the nameRole to set
	 */
	public void setNameRole(String nameRole) {
		this.nameRole = nameRole;
	}

	/**
	 * @return the languageSelect
	 */
	public String getLanguageSelect() {
		return languageSelect;
	}

	/**
	 * @param languageSelect the languageSelect to set
	 */
	public void setLanguageSelect(String languageSelect) {
		this.languageSelect = languageSelect;
	}

	/**
	 * @return the isLockedSelect
	 */
	public String getIsLockedSelect() {
		return isLockedSelect;
	}

	/**
	 * @param isLockedSelect the isLockedSelect to set
	 */
	public void setIsLockedSelect(String isLockedSelect) {
		this.isLockedSelect = isLockedSelect;
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
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the userService
	 */
	public UserService getUserService() {
		return userService;
	}

	/**
	 * @param userService the userService to set
	 */
	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	/**
	 * @return the userList
	 */
	public List<User> getUserList() {
		return userList;
	}

	/**
	 * @param userList the userList to set
	 */
	public void setUserList(List<User> userList) {
		this.userList = userList;
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
	 * @return the is_locked_s
	 */
	public String getIs_locked_s() {
		return is_locked_s;
	}

	/**
	 * @param is_locked_s the is_locked_s to set
	 */
	public void setIs_locked_s(String is_locked_s) {
		this.is_locked_s = is_locked_s;
	}

	/**
	 * @return the force_chg_pwd_s
	 */
	public String getForce_chg_pwd_s() {
		return force_chg_pwd_s;
	}

	/**
	 * @param force_chg_pwd_s the force_chg_pwd_s to set
	 */
	public void setForce_chg_pwd_s(String force_chg_pwd_s) {
		this.force_chg_pwd_s = force_chg_pwd_s;
	}

	/**
	 * @return the language_s
	 */
	public String getLanguage_s() {
		return language_s;
	}

	/**
	 * @param language_s the language_s to set
	 */
	public void setLanguage_s(String language_s) {
		this.language_s = language_s;
	}

	/**
	 * @return the userRole_s
	 */
	public String getUserRole_s() {
		return userRole_s;
	}

	/**
	 * @param userRole_s the userRole_s to set
	 */
	public void setUserRole_s(String userRole_s) {
		this.userRole_s = userRole_s;
	}

	/**
	 * @return the user
	 */
	public User getUser() {
		return user;
	}

	/**
	 * @param user the user to set
	 */
	public void setUser(User user) {
		this.user = user;
	}

	/**
	 * @return the deletearray
	 */
	public String getDeletearray() {
		return deletearray;
	}

	/**
	 * @param deletearray the deletearray to set
	 */
	public void setDeletearray(String deletearray) {
		this.deletearray = deletearray;
	}

	/**
	 * 用户登录
	 */
	public String login() throws Exception {
		Encryption md=new Encryption();
		password=md.md5Encryption(password);
		HttpSession session = ServletActionContext.getRequest().getSession();
		if("".equals(name.trim())){
			return "error";
		}
		else{
			User user = userService.userLogin(name, password);
			clear();
			if(user == null) {
				return "error";
			} else {
				session.setAttribute("UserName", user.getName());
				session.setAttribute("UserRoleId", user.getRole().getId());
				session.setAttribute("UserId", user.getId());
				String uuid = session.getAttribute("UserRoleId").toString();//用户角色ID
				if(uuid.equals("3")){//系统管理员
					return "admin_success";
				}else if(uuid.equals("1")){//客户经理
					return "manager_success";
				}else{//企业客户
					return "customer_success";
				}
			}
		}
	}
	
	
	/**
	 * 用户退出
	 * @return
	 * @throws Exception
	 */
	public String logout() throws Exception{
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("UserName", null);
		session.setAttribute("UserRoleId", null);
		session.setAttribute("UserId", null);
		return "success";
	}
	
	
	/**
	 * 用户信息查询
	 * @return
	 */
	public String queryUser(){
		if(languageSelect == null){
			languageSelect = "请选择...";
		}
		if(isLockedSelect == null){
			isLockedSelect  = "请选择...";
		}
		if(name==null){
			name = "";
		}
		int language = chg_language(languageSelect);
		char locked = chg_is_locked(isLockedSelect);
		userList = userService.queryUser(id, name, language, locked);
		clear();//清空原来的查询信息
		return "success";
	}
	
	
	/**
	 * 查询用户信息，用于用户角色分派,排除企业客户
	 * @return
	 */
	public String queryUserForRoleDistribute(){
		rrList = userService.queryUserForRoleDistribute();
		return "success";
	}
	
	
	/**
	 * 分页查询用户信息
	 * @return
	 */
	public String queryUserByPage(){
		if(languageSelect == null){
			languageSelect = "请选择...";
		}
		if(isLockedSelect == null){
			isLockedSelect  = "请选择...";
		}
		if(name==null){
			name = "";
		}
		int language = chg_language(languageSelect);
		char locked = chg_is_locked(isLockedSelect);
		pageBean = userService.queryUserByPage(id, name, language, locked, 10, page);
		clear();//清空原来的查询信息
		page = 0;
		return "success";
	}
	
	
	
	/**
	 * 用户信息查询，返回单个用户信息
	 * @return
	 */
	public String queryUserByName(){
		try {
			nameRole = new String(nameRole.getBytes("iso-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		userRole = userService.queryUserByName(nameRole);
		clear();
		return "success";
	}
	
	
	/**
	 * 添加用户信息
	 * @param id
	 * @param name
	 * @param password
	 * @param is_locked
	 * @param force_chg_pwd
	 * @param language
	 * @return
	 */
	public String addUser(){
		Encryption md=new Encryption();
		password=md.md5Encryption(password);
		if(userRole_s.equals("请选择...") || is_locked_s.equals("请选择...") || force_chg_pwd_s.equals("请选择...") || language_s.equals("请选择...")){
			clear();
			return "error";
		}else if("".equals(name.trim())){
			clear();
			return "error";
		}else{
			int role_id = chg_role_id(userRole_s);
			char is_locked = chg_is_locked(is_locked_s);
			char force_chg_pwd = chg_force_pwd(force_chg_pwd_s);
			int language = chg_language(language_s);
			if(userService.addUser(name, password, role_id, is_locked, force_chg_pwd, language)){
				if(role_id == 2){
					uuname = name;
					clear();
					return "success_info";
				}
				else{
					clear();
					return "success";
				}
			}else{
				clear();
				return "error";
			}
		}

	}  
	

	/**
	 * 修改用户信息
	 * @param id
	 * @param name
	 * @param password
	 * @param is_locked
	 * @param force_chg_pwd
	 * @param language
	 * @return
	 */
	public String modifyUser(){
		if(is_locked_s.equals("请选择...") || force_chg_pwd_s.equals("请选择...") || language_s.equals("请选择...")){
			clear();
			return "error";
		}else if(id==0 || "".equals(name.trim())){
			clear();
			return "error";
		}else{
			Encryption md=new Encryption();
			password=md.md5Encryption(password);
			char is_locked = chg_is_locked(is_locked_s);
			char force_chg_pwd = chg_force_pwd(force_chg_pwd_s);
			int language = chg_language(language_s);
			if(userService.modifyUser(name, password, id, is_locked, force_chg_pwd, language)){
				clear();
				return "success";
			}else{
				clear();
				return "error";
			}
		}
	}
	
	
	/**
	 * 修改用户角色
	 * @return
	 */
	public String modifyUserRole(){
		try {
			userRole_s = new String(userRole_s.getBytes("iso-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			clear();
			e.printStackTrace();
		}
		int roleid = chg_role_id(userRole_s);
		if(id==0 || roleid==0){
			clear();
			return "error";
		}
		else if(userService.modifyUserRole(id, roleid)){
			clear();
			return "success";
		}else{
			clear();
			return "error";
		}
	}
	
	/**
	 * 删除用户
	 * @return
	 */
	public String deleteUser(){
		String [] darray = deletearray.split(",");
		int[] array = new int[darray.length];
		for(int j=0;j<darray.length;j++){
			array[j] = Integer.parseInt(darray[j]);
		}
		
		if(array == null || array.length==0){
			clear();
			return "error";
		}
		else if(userService.deleteMoreUser(array)){
			clear();
			return "success";
		}
		else{
			clear();
			return "error";
		}
	}
	
	
	/**
	 * 查看客户详细信息
	 * @return
	 */
	public String moreInfo(){
		if( null == customerService.queryCustomerByUserId(uuid)){
			return "newCustomer";
		}
		else{
			return "customerInfo";
		}
	}
	
	
	/**
	 * 清空残留信息
	 */
	public void clear(){
		name = "";
		password = "";
		id = 0;
	}
	
	
	/**
	 * 转换select中的值,用户角色
	 * @param r
	 * @return
	 */
	public int chg_role_id(String r){
		int result;
		if(r.equals("客户经理")){
			result = 1;
		}
		else if(r.equals("企业客户")){
			result = 2;
		}
		else if(r.equals("系统管理员")){
			result = 3;
		}
		else{
			result = 0;
		}
		return result;
	}
	
	/**
	 * 转换select中的值,用户语言
	 * @param r
	 * @return
	 */
	public int chg_language(String r){
		int result;
		if(r.equals("英语")){
			result = 1;
		}
		else if(r.equals("简体中文")){
			result = 2;
		}
		else if(r.equals("繁体中文")){
			result = 3;
		}
		else{
			result = 0;
		}
		return result;
	}
	
	/**
	 * 转换select中的值，是否禁用
	 * @param r
	 * @return
	 */
	public char chg_is_locked(String r){
		char result;
		if(r.equals("是")){
			result = '1';
		}
		else if(r.equals("否")){
			result = '0';
		}else{
			result = '2';
		}
		return result;
	}
	
	/**
	 * 转换select中的值，是否更改密码
	 * @param r
	 * @return
	 */
	public char chg_force_pwd(String r){
		char result;
		if(r.equals("是")){
			result = '1';
		}
		else if(r.equals("否")){
			result = '0';
		}else{
			result = '2';
		}
		return result;
	}

}
