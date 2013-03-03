package com.hp.team7.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.hp.team7.vo.Dealer;

/**
 * 
 * @author 张露
 * 经销商管理模块
 *
 */
public class DealerDao extends HibernateDaoSupport {

	/**
	 * 查询经销商信息
	 * @param dealerName
	 * @return dealerList List<Dealer>
	 */
	public List<Dealer> queryDealer(String dealerName) {

		String hql="from Dealer as d where 1=1";
		if(!"".equals(dealerName)){
			hql += " and d.name='" + dealerName + "'";
		}

		@SuppressWarnings("unchecked")
		List<Dealer> dealerList = getHibernateTemplate().find(hql);

		if(dealerList != null && dealerList.size() > 0) {
			return dealerList;
		} else {
			return null;
		}
	}

	/**
	 * 添加经销商信息
	 * @param name
	 * @param address
	 * @param description
	 * @return boolean
	 */
	public boolean addDealer(String name,String address,String description){
		Session session=getSession();
		Transaction tx=session.beginTransaction();
		try{
			tx.begin();

			Dealer dealer=new Dealer();
			dealer.setName(name);
			dealer.setAddress(address);
			dealer.setDescription(description);

			session.save(dealer);
			tx.commit();
			return true;
		}catch(Exception e){
			tx.rollback();
			return false;
		}finally{
			session.close();
		}
	}
	
	/**
	 * 删除经销商
	 * 删除指定id的经销商
	 * @param id
	 * @return boolean
	 */
	public boolean deleteDealer(int id){
		try{
			Dealer dealer = new Dealer();
			dealer.setId(id);
			getHibernateTemplate().delete(dealer);
			return true;
		}catch(Exception e){
			return false;
		}		
	}
	
	/**
	 * 修改供应商信息
	 * @param id
	 * @param description
	 * @param name
	 * @param address
	 * @return boolean
	 */
	public boolean modifyDealer(int id, String name,String address, String description){
		try{
			Dealer dealer=new Dealer();
			dealer.setId(id);
			dealer.setName(name);
			dealer.setAddress(address);
			dealer.setDescription(description);
			getHibernateTemplate().update(dealer);
			return true;
		}catch(Exception e){
			return false;
		}
	}

}
