package com.hp.team7.service;

import java.util.List;

import com.hp.team7.dao.CustomerDao;
import com.hp.team7.dao.DealerDao;
import com.hp.team7.vo.Dealer;
import com.hp.team7.vo.UserProfile;

/**
 * 经销商管理模块
 * @author k95
 */
public class DealerService {
	private DealerDao dealerDao;
	private CustomerDao customerDao;

	/**
	 * @return the dealerDao
	 */
	public DealerDao getDealerDao() {
		return dealerDao;
	}

	/**
	 * @param dealerDao the dealerDao to set
	 */
	public void setDealerDao(DealerDao dealerDao) {
		this.dealerDao = dealerDao;
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
	 * 查询经销商信息列表
	 * @param name
	 * @return
	 */
	public List<Dealer> queryDealer(String dealerName) {
		return dealerDao.queryDealer(dealerName);
	}

	/**
	 * 添加经销商信息
	 * @param name
	 * @param description
	 * @return
	 */
	public boolean addDealer(String name,String address,String description){
		// 检查相同name的经销商是否已存在，不存在，则允许添加
		if(dealerDao.queryDealer(name) == null) {
			return dealerDao.addDealer(name,address,description);
		} else {
			return false;
		}
	}

	/**
	 * 删除经销商
	 * 检查指定id的经销商是否有客户，若没有则删除经销商，若有则不允许删除
	 * @param id
	 * @return
	 */
	public boolean deleteDealer(int id){
		List<UserProfile> checkCustomerList = customerDao.queryCustomerByDealerId(id);

		if(checkCustomerList == null) {
			dealerDao.deleteDealer(id);
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 修改供应商信息
	 * @param id
	 * @param description
	 * @param address
	 * @param name
	 * @return
	 */
	public boolean modifyDealer(int id, String name,String address, String description){
		return dealerDao.modifyDealer(id, name,address,description);
	}


}
