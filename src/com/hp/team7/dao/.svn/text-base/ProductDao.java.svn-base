package com.hp.team7.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hp.team7.vo.Product;


/**
 * 产品信息管理DAO
 * @author k95
 */
public class ProductDao extends HibernateDaoSupport {

	/**
	 * 通过ID和name查询产品信息
	 * @param productID
	 * @param productName
	 * @return
	 */
	public List<Product> queryProduct(int productID, String productName){
		String selectProduct = "from com.hp.team7.vo.Product as p where 1=1";
		if(productID != 0){
			selectProduct += " and p.id=" + productID;
		}
		if(!"".equals(productName)){
			selectProduct += " and p.productName='" + productName + "'";
		}

		@SuppressWarnings("unchecked")
		List<Product> productList = getHibernateTemplate().find(selectProduct);

		if(productList != null && productList.size()>0){
			return productList;
		}else{
			return null;
		}
	}

	/**
	 * 获得行数，用于分页
	 * @param hsql
	 * @return
	 */
	public int getAllRowCount(String hsql) {
		return getHibernateTemplate().find(hsql).size();
	}

	/**
	 * 分页查询产品信息
	 * @param selectProduct
	 * @param offset  开始记录
	 * @param length  一次查询几条记录
	 * @return productList List<Product>
	 */
	public List<Product> queryProductByPage(final String selectProduct,final int offset,final int length){
		@SuppressWarnings("unchecked")
		List<Product> productList = getHibernateTemplate().executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session)throws HibernateException, SQLException {
				Query query = session.createQuery(selectProduct); 
				query.setFirstResult(offset); 
				query.setMaxResults(length);
				List<Product> productList = query.list();
				return productList;
			}
		});

		if(productList != null && productList.size()>0){
			return productList;
		}else{
			return null;
		}
	}

	/**
	 * 添加产品信息
	 * @param product
	 * @return boolean
	 */
	public boolean addProduct(Product product){
		try{
			getHibernateTemplate().save(product);
			return true;
		}catch(Exception e){
			return false;
		}
	}

	/**
	 * 删除产品
	 * @param id
	 * @return boolean
	 */
	public boolean deleteProduct(int id){
		try{
			Product product = new Product();
			product.setId(id);
			getHibernateTemplate().delete(product);
			return true;
		}catch(Exception e){
			return false;
		}		
	}
	
	/**
	 * 修改产品信息
	 * @param Product product
	 * @return boolean
	 */
	public boolean modifyProduct(Product product){
		try{
			getHibernateTemplate().update(product);
			return true;
		}catch(Exception e){
			return false;
		}
	}

}
