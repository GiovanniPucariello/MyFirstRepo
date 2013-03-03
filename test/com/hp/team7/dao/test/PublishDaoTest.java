package com.hp.team7.dao.test;

import org.junit.Test;
import org.springframework.test.AbstractTransactionalSpringContextTests;

import com.hp.team7.dao.PublishDao;

/**
 * 发布产品信息测试
 * @author k95
 */
public class PublishDaoTest extends AbstractTransactionalSpringContextTests {
	
	private PublishDao publishDao;
	
	/**
	 * @param publishDao
	 */
    public void setPublishDao(PublishDao publishDao) {  
        this.publishDao = publishDao;  
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
     * 发布产品测试
     */
	@Test
	public void testPublish() {
		assertTrue(publishDao.publish(1003, 12, "不锈钢"));
	}

	/**
	 * 产品发布查询测试
	 */
	@Test
	public void testQueryPublish() {
		assertNotNull(publishDao.queryPublish(23, 1003, 12));
		assertEquals(23, publishDao.queryPublish(23, 1003, 12).get(0).getId());
	}  

	/**
	 * 根据id删除发布测试
	 */
	@Test
	public void testDeletePublish() {
		assertTrue(publishDao.deletePublish(18));
	}

	/**
	 * 同时删除多个发布测试
	 */
	@Test
	public void testDeleteMorePublish() {
		int[] array = {21, 22, 23};
		assertTrue(publishDao.deleteMorePublish(array));
	}

}

