/**
 * 
 */
package com.hp.team7.service;

import java.util.List;

import com.hp.team7.dao.PublishDao;
import com.hp.team7.util.Page;

/**
 * @author k95
 *	产品发布模块
 */
public class PublishService {
	
	private PublishDao publishDao;
	/**
	 * @return the publishDao
	 */
	public PublishDao getPublishDao() {
		return publishDao;
	}
	/**
	 * @param publishDao the publishDao to set
	 */
	public void setPublishDao(PublishDao publishDao) {
		this.publishDao = publishDao;
	}
	
	
	/**
	 * 产品发布
	 * @param dealerId
	 * @param productId
	 * @param description
	 * @return
	 */
	public boolean publish(int dealerId, int productId, String description){
		if(publishDao.queryPublish(0, dealerId, productId)==null){
			return publishDao.publish(dealerId, productId, description);
		}
		else{
			return false;
		}
	}
	
	
	/**
	 * 产品发布信息分页查询
	 * @param productCat
	 * @param dealerId
	 * @param productId
	 * @param serial
	 * @param pageSize
	 * @param currentPage
	 * @return
	 */
	public Page queryPublishByPage(String productCat,int dealerId,int productId,String serial,int pageSize,int currentPage){
		String select = "select product.productCat,product.serialNum,product.productName,dealer.name,productDealer.description,productDealer.id"
				+ " from Product product, Dealer dealer, ProductDealer productDealer"
				+ " where productDealer.product.id=product.id and productDealer.dealer.id=dealer.id";
		if(!"".equals(productCat)){
			select += " and product.productCat='" + productCat + "'"; 
		}
		if(!"".equals(serial)){
			select += " and product.serialNum ='" + serial + "'"; 
		}
		if(0 != dealerId){
			select += " and dealer.id=" + dealerId;
		}
		if(0 != productId){
			select += " and product.id=" + productId;
		}
		
		//调用Page类，初始化分页所用的参数
		int allRow = publishDao.getAllRowCount(select);
		int totalPage = Page.countTotalPage(pageSize, allRow);
		final int offset = Page.countOffset(pageSize, currentPage);
		int length = pageSize;
		final int page = Page.countCurrentPage(currentPage); 
		//返回查询出的列表,offset为起始页，length为查询记录条数
		@SuppressWarnings("rawtypes")
		List list = publishDao.queryPublishByPage(select, offset, length);
		
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
	 * 同时删除多个发布
	 * @param array
	 * @return
	 */
	public boolean deleteMorePublish(int[] array){
		return publishDao.deleteMorePublish(array);
	}
}
