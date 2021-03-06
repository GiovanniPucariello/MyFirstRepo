package com.hp.team7.dao.test;

import org.junit.Assert;
import org.junit.Test;
import org.springframework.test.AbstractTransactionalSpringContextTests;

import com.hp.team7.dao.ProductDao;
import com.hp.team7.vo.Product;

/**
 * 产品信息测试
 * @author k95
 */
public class ProductDaoTest extends AbstractTransactionalSpringContextTests {
	
	private ProductDao productDao;
	
	/**
	 * @param productDao
	 */
    public void setProductDao(ProductDao productDao) {  
        this.productDao = productDao;  
    }

    /**
     * 设置get方法
     * 自动注入applicationContext.xml文件
     */
    @Override
    public String[] getConfigLocations() {  
		String[] configLocations = { "spring/applicationContext.xml"};  
		return configLocations;  
	}

    /**
     * 产品信息查询测试
     */
	@Test
	public void testQueryProduct() {
		assertNotNull(productDao.queryProduct(11,"奥迪"));
		assertEquals("奥迪", productDao.queryProduct(11,"奥迪").get(0).getProductName());
	}
	
	/**
	 * 产品信息新增测试
	 */
	@Test
	public void testAddProduct() {
		Product product=new Product();
		product.setProductName("美的空调");
		product.setProductCat("空调");
		product.setSerialNum("20121010E006");
		product.setLot("8");
		product.setManufactureDate("2010-08-01");
		product.setValidityDate("2020-08-01");
		product.setDescription("家备");
		product.setPrice(8000);
	    boolean result=productDao.addProduct(product);
	    Assert.assertEquals(true, result);
	}

	/**
	 * 产品信息删除测试
	 */
	@Test
	public void testDeleteProduct() {
		assertTrue(productDao.deleteProduct(10));
	}

	/**
	 * 产品信息修改测试
	 */
	@Test
	public void testModifyProduct() {
		//String hql="update com.hp.team7.vo.Product set productCat='手机' where productCat='汽车' ";
		Product product=new Product();
		product.setProductName("布加迪威龙");
		//修改产品类型
		product.setProductCat("汽车");
		//修改产品条形码
		product.setSerialNum("20080808B008");
		product.setManufactureDate("2012-08-01");
		product.setValidityDate("2062-08-01");
		product.setDescription("车车");
		boolean result=productDao.modifyProduct(product);
		Assert.assertEquals(true, result);
	}

}
