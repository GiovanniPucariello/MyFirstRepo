package com.hp.team7.service;

import java.util.List;

import com.hp.team7.dao.ProductDao;
import com.hp.team7.util.Page;
import com.hp.team7.vo.Product;

/**
 * 产品管理模块
 * @author k95
 */
public class ProductService {

	private ProductDao productDao;

	/**
	 * @return the productDao
	 */
	public ProductDao getProductDao() {
		return productDao;
	}

	/**
	 * @param productDao the productDao to set
	 */
	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	/**
	 * 产品信息查询
	 * @param productID
	 * @param productName
	 * @return List
	 */
	public List<Product> queryProduct(int productID, String productName){
		return productDao.queryProduct(productID, productName);
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
	public Page queryProductByPage(String productName, String productSerialNum, String productLot, String productCatSelect,
			String manufactureDate, String validityDate, int pageSize, int currentPage){

		String selectProduct = "from com.hp.team7.vo.Product as p where 1=1";

		if(!"".equals(productName)){
			selectProduct += " and p.productName='" + productName + "'";
		}
		if(!"".equals(productSerialNum)){
			selectProduct += " and p.serialNum='" + productSerialNum + "'";
		}
		if(!"".equals(productLot)){
			selectProduct += " and p.lot='" + productLot + "'";
		}
		if(!"".equals(productCatSelect)){
			selectProduct += " and p.productCat='" + productCatSelect + "'";
		}
		if(!"".equals(manufactureDate)){
			selectProduct += " and p.manufactureDate='" + manufactureDate + "'";
		}
		if(!"".equals(validityDate)){
			selectProduct += " and p.validityDate='" + validityDate + "'";
		}




		int allRow = productDao.getAllRowCount(selectProduct);
		int totalPage = Page.countTotalPage(pageSize, allRow);
		final int offset = Page.countOffset(pageSize, currentPage);
		int length = pageSize;
		final int page = Page.countCurrentPage(currentPage); 
		@SuppressWarnings("rawtypes")
		List list = productDao.queryProductByPage(selectProduct, offset, length);

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
	 * 添加产品信息
	 * @param name
	 * @param description
	 * @return
	 */
	public boolean addProduct(Product product){
		// 检查相同name的产品是否已存在，不存在，则允许添加
		if(productDao.queryProduct(0, product.getProductName()) == null) {
			return productDao.addProduct(product);
		} else {
			return false;
		}
	}
	
	/**
	 * 修改产品信息
	 * @return boolean
	 */
	public boolean modifyProduct(Product product){
		return productDao.modifyProduct(product);
	}

	/**
	 * 删除产品信息
	 * @param id
	 * @return
	 */
	public boolean deleteProduct(int id){
		if(productDao.deleteProduct(id)){
			return true;
		} else {
			return false;
		}
	}
}
