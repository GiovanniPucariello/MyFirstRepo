/**
 * 
 */
package com.hp.team7.action;

import java.util.List;

import com.hp.team7.service.DealerService;
import com.hp.team7.service.ProductService;
import com.hp.team7.service.PublishService;
import com.hp.team7.util.Page;
import com.hp.team7.vo.Dealer;
import com.hp.team7.vo.Product;
import com.opensymphony.xwork2.ActionSupport;

/**
 * @author
 *	发布产品模块
 */
public class PublishAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 4762904545738733776L;
	private PublishService publishService;
	private DealerService dealerService;
	private ProductService productService;
	
	//发布产品模块参数
	private String publishDealer; //经销商
	private String publishProduct; //产品
	private String publishDescription; //描述
	private List<Dealer> dList;//经销商列表
	private List<Product> pList;//产品列表

	private String deletePublishArray;  //用于删除的发布产品的ID数组
	
	//查询模块参数
	private String publishProductCatQ;	//产品类型
	private String publishDealerQ;		//经销商
	private String publishSerialQ;		//产品序列号
	private String publishProductNameQ;	//产品名
	
	private Page pageBeanPublish;//用于分页
	private int pagePublish;//当前页
	
	
	
	/**
	 * @return the dList
	 */
	public List<Dealer> getdList() {
		return dList;
	}
	/**
	 * @param dList the dList to set
	 */
	public void setdList(List<Dealer> dList) {
		this.dList = dList;
	}
	/**
	 * @return the pList
	 */
	public List<Product> getpList() {
		return pList;
	}
	/**
	 * @param pList the pList to set
	 */
	public void setpList(List<Product> pList) {
		this.pList = pList;
	}
	/**
	 * @return the deletePublishArray
	 */
	public String getDeletePublishArray() {
		return deletePublishArray;
	}
	/**
	 * @param deletePublishArray the deletePublishArray to set
	 */
	public void setDeletePublishArray(String deletePublishArray) {
		this.deletePublishArray = deletePublishArray;
	}
	/**
	 * @return the pageBeanPublish
	 */
	public Page getPageBeanPublish() {
		return pageBeanPublish;
	}
	/**
	 * @param pageBeanPublish the pageBeanPublish to set
	 */
	public void setPageBeanPublish(Page pageBeanPublish) {
		this.pageBeanPublish = pageBeanPublish;
	}
	/**
	 * @return the pagePublish
	 */
	public int getPagePublish() {
		return pagePublish;
	}
	/**
	 * @param pagePublish the pagePublish to set
	 */
	public void setPagePublish(int pagePublish) {
		this.pagePublish = pagePublish;
	}
	/**
	 * @return the publishDealer
	 */
	public String getPublishDealer() {
		return publishDealer;
	}
	/**
	 * @param publishDealer the publishDealer to set
	 */
	public void setPublishDealer(String publishDealer) {
		this.publishDealer = publishDealer;
	}
	/**
	 * @return the publishProduct
	 */
	public String getPublishProduct() {
		return publishProduct;
	}
	/**
	 * @param publishProduct the publishProduct to set
	 */
	public void setPublishProduct(String publishProduct) {
		this.publishProduct = publishProduct;
	}
	/**
	 * @return the publishDescription
	 */
	public String getPublishDescription() {
		return publishDescription;
	}
	/**
	 * @param publishDescription the publishDescription to set
	 */
	public void setPublishDescription(String publishDescription) {
		this.publishDescription = publishDescription;
	}
	/**
	 * @return the publishProductCatQ
	 */
	public String getPublishProductCatQ() {
		return publishProductCatQ;
	}
	/**
	 * @param publishProductCatQ the publishProductCatQ to set
	 */
	public void setPublishProductCatQ(String publishProductCatQ) {
		this.publishProductCatQ = publishProductCatQ;
	}
	/**
	 * @return the publishDealerQ
	 */
	public String getPublishDealerQ() {
		return publishDealerQ;
	}
	/**
	 * @param publishDealerQ the publishDealerQ to set
	 */
	public void setPublishDealerQ(String publishDealerQ) {
		this.publishDealerQ = publishDealerQ;
	}
	/**
	 * @return the publishSerialQ
	 */
	public String getPublishSerialQ() {
		return publishSerialQ;
	}
	/**
	 * @param publishSerialQ the publishSerialQ to set
	 */
	public void setPublishSerialQ(String publishSerialQ) {
		this.publishSerialQ = publishSerialQ;
	}
	/**
	 * @return the publishProductNameQ
	 */
	public String getPublishProductNameQ() {
		return publishProductNameQ;
	}
	/**
	 * @param publishProductNameQ the publishProductNameQ to set
	 */
	public void setPublishProductNameQ(String publishProductNameQ) {
		this.publishProductNameQ = publishProductNameQ;
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
	 * @return the productService
	 */
	public ProductService getProductService() {
		return productService;
	}
	/**
	 * @param productService the productService to set
	 */
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	/**
	 * @return the publishService
	 */
	public PublishService getPublishService() {
		return publishService;
	}
	/**
	 * @param publishService the publishService to set
	 */
	public void setPublishService(PublishService publishService) {
		this.publishService = publishService;
	}
	
	
	/**
	 * 发布产品
	 * @return
	 */
	public String publish(){
		int did = 0;
		int pid = 0;
		if(publishDealer != null){
			if(dealerService.queryDealer(publishDealer) != null){
				did = dealerService.queryDealer(publishDealer).get(0).getId();
			}
		}
		if(publishProduct != null){
			if(productService.queryProduct(0, publishProduct) != null){
				pid = productService.queryProduct(0, publishProduct).get(0).getId();
			}
		}
		
		if(publishDescription == null){
			publishDescription = "";
		}
		
		if(publishService.publish(did, pid, publishDescription)){
			return "success";
		}
		else{
			return "error";
		}
	}
	
	
	/**
	 * 分页查询产品发布信息
	 * @return
	 */
	public String queryPublishByPage(){
		int did = 0;//经销商ID
		int pid = 0;//产品ID
		String productCat = "";//产品类型
		if(publishProductCatQ !=null && !publishProductCatQ.equals("请选择...")){
			productCat = publishProductCatQ;
		}
		
		if(publishSerialQ == null){
			publishSerialQ = "";
		}
		
		if(publishDealerQ != null && !"".equals(publishDealerQ.trim())){
			if(dealerService.queryDealer(publishDealerQ) != null){
				did = dealerService.queryDealer(publishDealerQ).get(0).getId();
			}
		}
		if(publishProductNameQ != null && !"".equals(publishProductNameQ.trim())){
			if(productService.queryProduct(0, publishProductNameQ) != null){
				pid = productService.queryProduct(0, publishProductNameQ).get(0).getId();
			}
		}
		
		pageBeanPublish = publishService.queryPublishByPage(productCat, did, pid, publishSerialQ.trim(), 10, pagePublish);
		publishProductCatQ = "";
		publishSerialQ = "";
		return "success";
	}
	
	/**
	 * 删除发布产品
	 * @return
	 */
	public String deletePublish(){
		String [] parray = deletePublishArray.split(",");
		int[] array = new int[parray.length];
		for(int j=0;j<parray.length;j++){
			array[j] = Integer.parseInt(parray[j]);
		}
		
		if(array == null || array.length==0){
			return "error";
		}
		else if(publishService.deleteMorePublish(array)){
			return "success";
		}
		else{
			return "error";
		}
	}
	

	
	/**
	 * 发布产品时用于初始化经销商与产品列表信息
	 * @return
	 */
	public String publishInit(){
		dList = dealerService.queryDealer("");
		pList = productService.queryProduct(0, "");
		return "success";
	}
			
}
