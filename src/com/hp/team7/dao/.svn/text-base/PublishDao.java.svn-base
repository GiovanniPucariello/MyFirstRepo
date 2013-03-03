/**
 * 
 */
package com.hp.team7.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hp.team7.vo.Dealer;
import com.hp.team7.vo.Product;
import com.hp.team7.vo.ProductDealer;

/**
 * @author
 * 产品发布模块
 */
public class PublishDao extends HibernateDaoSupport {
	
	
	/**
	 * 产品发布
	 * @param dealerId
	 * @param productId
	 * @param description
	 * @return
	 */
	public boolean publish(int dealerId, int productId, String description){
		try {
			Dealer dealer = new Dealer();
			Product product = new Product();
			ProductDealer productDealer = new ProductDealer();
			
			dealer.setId(dealerId);
			product.setId(productId);
			
			productDealer.setDealer(dealer);
			productDealer.setProduct(product);
			productDealer.setDescription(description);
			
			getHibernateTemplate().save(productDealer);
			return true;
		} catch (DataAccessException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	/**
	 * 分页查询产品发布信息
	 * @param select
	 * @param offset
	 * @param length
	 * @return
	 */
	public List<Object> queryPublishByPage(final String select, final int offset, final int length){
		@SuppressWarnings("unchecked")
		List<Object> List = getHibernateTemplate().executeFind(new HibernateCallback(){
			public Object doInHibernate(Session session)throws HibernateException, SQLException {
				Query query = session.createQuery(select); 
				query.setFirstResult(offset); 
				query.setMaxResults(length);
				List<Object> List = query.list();
				return List;
			}
		});
		if(List != null && List.size()>0){
			return List;
		}else{
			return null;
		}
	}
	
	
	/**
	 * 查询出所有记录,用于分页查询
	 * @return List
	 */
	@SuppressWarnings("unchecked")
	public List<Object> listAll() {
		return getHibernateTemplate().find("from ProductDealer");
	}
	
	
	/**
	 * 取得所有行数,用于分页查询
	 * @param hsql
	 * @return size
	 */
	public int getAllRowCount(String hsql) {
		return getHibernateTemplate().find(hsql).size();
	}
	
	
	/**
	 * 查询产品发布信息
	 * @param id
	 * @param dealerId
	 * @param productId
	 * @return
	 */
	public List<ProductDealer> queryPublish(int id, int dealerId, int productId){
		String select = "from ProductDealer prod where 1=1";
		if(id != 0){
			select += " and prod.id=" + id;
		}
		if(dealerId != 0){
			select += " and prod.dealer.id=" + dealerId;
		}
		if(productId != 0){
			select += " and prod.product.id=" + productId;
		}
		
		@SuppressWarnings("unchecked")
		List<ProductDealer> prodList = getHibernateTemplate().find(select);
		if(prodList != null && prodList.size()>0){
			return prodList;
		}else{
			return null;
		}
	}
	

	/**
	 * 删除指定id的发布产品
	 * @param id
	 * @return boolean
	 */
	public boolean deletePublish(int id){
		try{
			ProductDealer productDealer = new ProductDealer();
			productDealer.setId(id);
			getHibernateTemplate().delete(productDealer);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}		
	}
	
	
	/**
	 * 同时删除多个发布
	 * @param array
	 * @return
	 */
	public boolean deleteMorePublish(int[] array){
		try{
			for(int i=0;i<array.length;i++){
				ProductDealer productDealer=new ProductDealer();
				productDealer.setId(array[i]);
				getHibernateTemplate().delete(productDealer);
			}
	        return true;
		}catch(Exception e){
			return false;
		}
	}
		
}
