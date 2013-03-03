package com.hp.team7.action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import com.hp.team7.service.CustomerService;
import com.hp.team7.service.DealerService;
import com.hp.team7.service.UserService;
import com.hp.team7.util.Page;
import com.hp.team7.vo.Dealer;
import com.hp.team7.vo.User;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 企业客户Action类
 * @author k95
 */
public class CustomerAction extends ActionSupport {

	private static final long serialVersionUID = -3945763142291961808L;
	private CustomerService customerService;
	private UserService userService;//用于查询user
	private DealerService dealerService;//用于查询dealer
	
	//查询模块参数
	private String realNameQ;//真实名字
	private String sysNameQ;//系统用户名
	private String mobileQ;//电话
	private String dealerNameQ;//经销商名字
	private String faxQ;//传真
	private String phoneQ;//手机
	private List<Object> profileList;//查询返回的详细信息
	private List<User> uuList;//返回系统企业客户的用户名
	private List<Dealer> ddList;//返回经销商名字
	private int uuid;//从用户信息传来的用户ID
	private String uuname;//从用户信息传来的用户名
	
	//新增客户模块参数
	private String realName;//真实名字
	private String userSelect;//系统用户名
	private String phone;//联系电话
	private String dealerSelect;//所属经销商
	private String mobile;//手机
	private String email;//电子邮件
	private String department;//所属部门
	private String position;//职位
	private String fax;//传真
	private String address;//地址
	private String customerDesc;//客户描述
	
	//修改客户模块参数
	private int customerID;//客户ID
	private String phoneM;//联系电话
	private String mobileM;//手机
	private String emailM;//电子邮件
	private String departmentM;//所属部门
	private String positionM;//职位
	private String faxM;//传真
	private String addressM;//地址
	private String customerDescM;//客户描述
	
	//删除模块参数
	private int cid;//客户ID
	
	private Page pageBeanCustomer;//用于分页
	private int pageCustomer;//当前页
	
	
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
	 * @return the dealerService
	 */
	public DealerService getDealerService() {
		return dealerService;
	}


	/**
	 * @param dealerService the dealerService to set
	 */
	public void setDealerService(DealerService dealerService) {
		this.dealerService = dealerService;
	}


	/**
	 * @return the realNameQ
	 */
	public String getRealNameQ() {
		return realNameQ;
	}


	/**
	 * @param realNameQ the realNameQ to set
	 */
	public void setRealNameQ(String realNameQ) {
		this.realNameQ = realNameQ;
	}


	/**
	 * @return the sysNameQ
	 */
	public String getSysNameQ() {
		return sysNameQ;
	}


	/**
	 * @param sysNameQ the sysNameQ to set
	 */
	public void setSysNameQ(String sysNameQ) {
		this.sysNameQ = sysNameQ;
	}


	/**
	 * @return the mobileQ
	 */
	public String getMobileQ() {
		return mobileQ;
	}


	/**
	 * @param mobileQ the mobileQ to set
	 */
	public void setMobileQ(String mobileQ) {
		this.mobileQ = mobileQ;
	}


	/**
	 * @return the dealerNameQ
	 */
	public String getDealerNameQ() {
		return dealerNameQ;
	}


	/**
	 * @param dealerNameQ the dealerNameQ to set
	 */
	public void setDealerNameQ(String dealerNameQ) {
		this.dealerNameQ = dealerNameQ;
	}


	/**
	 * @return the faxQ
	 */
	public String getFaxQ() {
		return faxQ;
	}


	/**
	 * @param faxQ the faxQ to set
	 */
	public void setFaxQ(String faxQ) {
		this.faxQ = faxQ;
	}


	/**
	 * @return the phoneQ
	 */
	public String getPhoneQ() {
		return phoneQ;
	}


	/**
	 * @param phoneQ the phoneQ to set
	 */
	public void setPhoneQ(String phoneQ) {
		this.phoneQ = phoneQ;
	}


	/**
	 * @return the profileList
	 */
	public List<Object> getProfileList() {
		return profileList;
	}


	/**
	 * @param profileList the profileList to set
	 */
	public void setProfileList(List<Object> profileList) {
		this.profileList = profileList;
	}


	/**
	 * @return the uuList
	 */
	public List<User> getUuList() {
		return uuList;
	}


	/**
	 * @param uuList the uuList to set
	 */
	public void setUuList(List<User> uuList) {
		this.uuList = uuList;
	}


	/**
	 * @return the ddList
	 */
	public List<Dealer> getDdList() {
		return ddList;
	}


	/**
	 * @param ddList the ddList to set
	 */
	public void setDdList(List<Dealer> ddList) {
		this.ddList = ddList;
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
	 * @return the realName
	 */
	public String getRealName() {
		return realName;
	}


	/**
	 * @param realName the realName to set
	 */
	public void setRealName(String realName) {
		this.realName = realName;
	}


	/**
	 * @return the userSelect
	 */
	public String getUserSelect() {
		return userSelect;
	}


	/**
	 * @param userSelect the userSelect to set
	 */
	public void setUserSelect(String userSelect) {
		this.userSelect = userSelect;
	}


	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}


	/**
	 * @param phone the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}


	/**
	 * @return the dealerSelect
	 */
	public String getDealerSelect() {
		return dealerSelect;
	}


	/**
	 * @param dealerSelect the dealerSelect to set
	 */
	public void setDealerSelect(String dealerSelect) {
		this.dealerSelect = dealerSelect;
	}


	/**
	 * @return the mobile
	 */
	public String getMobile() {
		return mobile;
	}


	/**
	 * @param mobile the mobile to set
	 */
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}


	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}


	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}


	/**
	 * @return the department
	 */
	public String getDepartment() {
		return department;
	}


	/**
	 * @param department the department to set
	 */
	public void setDepartment(String department) {
		this.department = department;
	}


	/**
	 * @return the position
	 */
	public String getPosition() {
		return position;
	}


	/**
	 * @param position the position to set
	 */
	public void setPosition(String position) {
		this.position = position;
	}


	/**
	 * @return the fax
	 */
	public String getFax() {
		return fax;
	}


	/**
	 * @param fax the fax to set
	 */
	public void setFax(String fax) {
		this.fax = fax;
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
	 * @return the customerDesc
	 */
	public String getCustomerDesc() {
		return customerDesc;
	}


	/**
	 * @param customerDesc the customerDesc to set
	 */
	public void setCustomerDesc(String customerDesc) {
		this.customerDesc = customerDesc;
	}


	/**
	 * @return the customerID
	 */
	public int getCustomerID() {
		return customerID;
	}


	/**
	 * @param customerID the customerID to set
	 */
	public void setCustomerID(int customerID) {
		this.customerID = customerID;
	}


	/**
	 * @return the phoneM
	 */
	public String getPhoneM() {
		return phoneM;
	}


	/**
	 * @param phoneM the phoneM to set
	 */
	public void setPhoneM(String phoneM) {
		this.phoneM = phoneM;
	}


	/**
	 * @return the mobileM
	 */
	public String getMobileM() {
		return mobileM;
	}


	/**
	 * @param mobileM the mobileM to set
	 */
	public void setMobileM(String mobileM) {
		this.mobileM = mobileM;
	}


	/**
	 * @return the emailM
	 */
	public String getEmailM() {
		return emailM;
	}


	/**
	 * @param emailM the emailM to set
	 */
	public void setEmailM(String emailM) {
		this.emailM = emailM;
	}


	/**
	 * @return the departmentM
	 */
	public String getDepartmentM() {
		return departmentM;
	}


	/**
	 * @param departmentM the departmentM to set
	 */
	public void setDepartmentM(String departmentM) {
		this.departmentM = departmentM;
	}


	/**
	 * @return the positionM
	 */
	public String getPositionM() {
		return positionM;
	}


	/**
	 * @param positionM the positionM to set
	 */
	public void setPositionM(String positionM) {
		this.positionM = positionM;
	}


	/**
	 * @return the faxM
	 */
	public String getFaxM() {
		return faxM;
	}


	/**
	 * @param faxM the faxM to set
	 */
	public void setFaxM(String faxM) {
		this.faxM = faxM;
	}


	/**
	 * @return the addressM
	 */
	public String getAddressM() {
		return addressM;
	}


	/**
	 * @param addressM the addressM to set
	 */
	public void setAddressM(String addressM) {
		this.addressM = addressM;
	}


	/**
	 * @return the customerDescM
	 */
	public String getCustomerDescM() {
		return customerDescM;
	}


	/**
	 * @param customerDescM the customerDescM to set
	 */
	public void setCustomerDescM(String customerDescM) {
		this.customerDescM = customerDescM;
	}


	/**
	 * @return the cid
	 */
	public int getCid() {
		return cid;
	}


	/**
	 * @param cid the cid to set
	 */
	public void setCid(int cid) {
		this.cid = cid;
	}


	/**
	 * @return the pageBeanCustomer
	 */
	public Page getPageBeanCustomer() {
		return pageBeanCustomer;
	}


	/**
	 * @param pageBeanCustomer the pageBeanCustomer to set
	 */
	public void setPageBeanCustomer(Page pageBeanCustomer) {
		this.pageBeanCustomer = pageBeanCustomer;
	}


	/**
	 * @return the pageCustomer
	 */
	public int getPageCustomer() {
		return pageCustomer;
	}


	/**
	 * @param pageCustomer the pageCustomer to set
	 */
	public void setPageCustomer(int pageCustomer) {
		this.pageCustomer = pageCustomer;
	}


	/**
	 * 查询客户信息
	 * @return
	 */
	public String queryCustomer(){
		User userq = null;
		Dealer dealerq = null;
		int userid = 0;
		int dealerid = 0;
		
		//根据系统用户名、经销商名查询出userId,dealerId
		if(sysNameQ != null && !sysNameQ.equals("")){
			userq = userService.queryUserByName(sysNameQ);
		}
		if(dealerNameQ != null && !dealerNameQ.equals("") ){
			dealerq = dealerService.queryDealer(dealerNameQ).get(0);
		}
		
		if(userq != null){
			userid = userq.getId();
		}
		if(dealerq != null){
			dealerid = dealerq.getId();
		}
		if(uuid != 0){
			userid = uuid;
		}
		
		if(realNameQ == null){
			realNameQ = "";
		}
		if(mobileQ == null){
			mobileQ = "";
		}
		if(faxQ == null){
			faxQ = "";
		}
		if(phoneQ == null){
			phoneQ = "";
		}
		
		//返回客户详细信息
		profileList = customerService.queryCustomer(0,realNameQ, userid, mobileQ,dealerid, faxQ, phoneQ);
		clear();
		uuid = 0;
		return "success";
	}
	
	/**
	 * 分页查询客户信息
	 * @return
	 */
	public String queryCustomerByPage(){
		User userq = null;
		Dealer dealerq = null;
		int userid = 0;
		int dealerid = 0;
		
		//根据系统用户名、经销商名查询出userId,dealerId
		if(sysNameQ != null && !sysNameQ.equals("")){
			userq = userService.queryUserByName(sysNameQ);
		}
		if(dealerNameQ != null && !dealerNameQ.equals("") ){
			dealerq = dealerService.queryDealer(dealerNameQ).get(0);
		}
		
		if(userq != null){
			userid = userq.getId();
		}
		if(dealerq != null){
			dealerid = dealerq.getId();
		}
		if(uuid != 0){
			userid = uuid;
		}
		
		if(realNameQ == null){
			realNameQ = "";
		}
		if(mobileQ == null){
			mobileQ = "";
		}
		if(faxQ == null){
			faxQ = "";
		}
		if(phoneQ == null){
			phoneQ = "";
		}
		
		//返回客户详细信息
		pageBeanCustomer = customerService.queryCustomerByPage(0,realNameQ, userid, 
				mobileQ,dealerid, faxQ, phoneQ, 5, pageCustomer);
		clear();
		pageCustomer = 0;
		uuid = 0;
		return "success";
	}
	
	
	/**
	 * 返回新增企业客户,初始化用户名与经销商名列表
	 * @return
	 */
	public String getUDList(){
		uuList = userService.queryUserByRole(2,1);
		ddList = dealerService.queryDealer("");
		if(uuname != null){
			try {
				uuname = new String(uuname.getBytes("iso-8859-1"),"UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return "success";
	}
	
	
	/**
	 * 添加客户信息
	 * @return
	 */
	public String addCustomer(){
		if("请选择...".equals(userSelect) || "请选择...".equals(dealerSelect)){
			return "error";//用户未选择
		}
		else if(getUserIdByName(userSelect)==0 || getDealerIdByName(dealerSelect)==0){
			return "error";//没有查找到Id
		}
		else if(realName.trim()==""){
			return "error";//验证用户名
		}
		else{
			boolean result = false;
			int uid = getUserIdByName(userSelect);
			int did = getDealerIdByName(dealerSelect);
			if(customerService.queryCustomer(0, "", uid, "", did, "", "") == null){
				result = customerService.addCustomer(realName, uid, mobile, did, phone, email, department, position, fax, address, customerDesc);
				if(result){
					realName="";
					uid = 0;
					did = 0;
					return "success";
				}else{
					realName="";
					uid = 0;
					did = 0;
					return "error";
				}
			}
			else{
				realName="";
				uid = 0;
				did = 0;
				return "error";
			}

		}
	}
	
	
	/**
	 * 修改客户信息
	 * @return
	 */
	public String modifyCustomer(){
		if(customerID==0){
			return "error";
		}
		else{
			boolean result = false;
			result = customerService.modifyCustomer(customerID, mobileM, phoneM, emailM, departmentM, positionM, faxM, addressM, customerDescM);
			if(result){
				customerID = 0;
				return "success";
			}else{
				customerID = 0;
				return "error";
			}
		}
		
	}
	
	
	/**
	 * 删除企业客户，配置级联删除关系，同时删除系统用户
	 * @return
	 */
	public String deleteCustomer(){
		if(cid == 0){
			return "error";
		}
		else{
			if(customerService.deleteCustomer(cid)){
				return "success";
			}else{
				return "error";
			}
		}
	}
	
	
	/**
	 * 根据用户名查找用户Id
	 * @param userName
	 * @return
	 */
	public int getUserIdByName(String userName){
		int result = 0;
		User u = userService.queryUserByName(userName);
		if(u != null){
			result = u.getId();
		}
		return result;
	}
	
	/**
	 * 根据经销商名查找Id
	 * @param dealerName
	 * @return
	 */
	public int getDealerIdByName(String dealerName){
		int result = 0;
		Dealer d = dealerService.queryDealer(dealerName).get(0);
		if(d != null){
			result = d.getId();
		}
		return result;
	}
	
	
	/**
	 * 清空残留信息
	 */
	public void clear(){
		realNameQ = "";//真实名字
		sysNameQ = "";//系统用户名
		mobileQ = "";//电话
		dealerNameQ = "";//经销商名字
		faxQ = "";//传真
		phoneQ = "";//手机	
	}

}
