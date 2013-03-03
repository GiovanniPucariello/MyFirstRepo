package com.hp.team7.action;

import java.util.List;

import com.hp.team7.service.DealerService;
import com.hp.team7.vo.Dealer;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 经销商Action类
 *@author k95
 */
public class DealerAction extends ActionSupport {

	
	private static final long serialVersionUID = 8703927209439588409L;
	private DealerService dealerService;
	private int dealerId;
	
	private String dealerName;   // 获取查询经销商信息的经销商名称
	private List<Dealer> dealerList;  // 获取查询经销商的信息列表
	
	private String dealerAddress;	//经销商地址
	private String dealerDescription;//经销商描述
	
	
	/*****************get和set方法定义*********************/

	/**
	 * @param deealerName the deealerId to set
	 */
	public int getDealerId() {
		return dealerId;
	}
	/**
	 * @return the dealerAddress
	 */
	public String getDealerAddress() {
		return dealerAddress;
	}
	/**
	 * @param dealerAddress the dealerAddress to set
	 */
	public void setDealerAddress(String dealerAddress) {
		this.dealerAddress = dealerAddress;
	}
	/**
	 * @return the dealerDescription
	 */
	public String getDealerDescription() {
		return dealerDescription;
	}
	/**
	 * @param dealerDescription the dealerDescription to set
	 */
	public void setDealerDescription(String dealerDescription) {
		this.dealerDescription = dealerDescription;
	}
	/**
	 * @return the dealerId
	 */
	public void setDealerId(int dealerId) {
		this.dealerId = dealerId;
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
	 * @return the deealerName
	 */
	public String getDealerName() {
		return dealerName;
	}

	/**
	 * @param deealerName the deealerName to set
	 */
	public void setDealerName(String dealerName) {
		this.dealerName = dealerName;
	}
	
	/**
	 * @return the dealerList
	 */
	public List<Dealer> getDealerList() {
		return dealerList;
	}

	/**
	 * @param dealerList the dealerList to set
	 */
	public void setDealerList(List<Dealer> dealerList) {
		this.dealerList = dealerList;
	}
	/*****************get和set方法定义结束*********************/

	/**
	 * 查询经销商信息
	 */
	public String queryDealer() {
		if(dealerName == null){
			dealerName = "";
		}
		dealerList = dealerService.queryDealer(dealerName);
		clear();
		return "success";
	}

	/**
	 * 添加经销商信息
	 * @return
	 */
	public String addDealer(){
		if("".equals(dealerName.trim()) || dealerName==null){
			clear();
			return "error";
		}
		else{
			if(dealerService.addDealer(dealerName,dealerAddress,dealerDescription)){
				clear();
				return "success";
			}else{
				clear();
				return "error";
			}
		}
	}
	
	/**
	 * 删除经销商
	 * 检查指定名字的经销商是否有客户，并删除该经销商
	 * @return
	 */
	public String deleteDealer() {
		boolean isSuccess = dealerService.deleteDealer(dealerId);
		
		if(isSuccess == true) {
			return "success";
		} else {
			return "error";
		}
		
	}
	
	/**
	 * 修改供应商信息
	 * @return
	 */
	public String modifyDealer(){
		if(dealerService.modifyDealer(dealerId, dealerName, dealerAddress,dealerDescription)){
			clear();
			return "success";
		}else{
			clear();
			return "error";
		}
	}
	
	/**
	 * 清理残留信息
	 */
	public void clear(){
		dealerName="";
		dealerAddress="";
		dealerDescription="";
	}

}
