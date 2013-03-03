package com.hp.team7.dao.test;

import org.junit.Test;
import org.springframework.test.AbstractTransactionalSpringContextTests;

import com.hp.team7.dao.UserDao;
import com.hp.team7.util.Encryption;

/**
 * UserDao测试类
 *
 */
public class UserDaoTest extends AbstractTransactionalSpringContextTests {
	private UserDao userDao;
	
	  
	/**
	 * 通过set方法自动从context里注入userDao bean
	 * 而不用显示调用applicationContext.getBean
	 * @param userDao
	 */
    public void setUserDao(UserDao userDao) {  
        this.userDao = userDao;  
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
     * 测试用户登录
     */
	@Test
	public void testSelectUserLoginInfo() {
		//创建一个加密对象
		Encryption egit = new Encryption();
		//将password加密
		String password = egit.md5Encryption("admin");
		//判断查询结果是否正确
		assertNotNull(userDao.selectUserLoginInfo("admin", password));
	}

	/**
	 * 测试查询用户信息方法
	 */
	@Test
	public void testQueryUser() {
		assertNotNull(userDao.queryUser(0, "admin", 0, '2'));
		assertEquals("admin", userDao.queryUser(0, "admin", 0, '2').get(0).getName());
	}

	/**
	 * 测试通过用户名查询用户信息方法
	 */
	@Test
	public void testQueryUserByName() {
		assertNotNull(userDao.queryUserByName("admin"));
		
		//判断查询结果是否正确
		assertEquals("admin", userDao.queryUserByName("admin").getName());
	}

	/**
	 * 测试通过用户角色查询用户信息方法
	 */
	@Test
	public void testQueryUserByRole() {
		//判断查询结果是否是预期的非空
		assertNotNull(userDao.queryUserByRole(1, 0));
		
		//判断查询结果的列表长度是否和数据库满足条件的记录长度相同
		//assertEquals(3, userDao.queryUserByRole(1, 0).size());
	}

	/**
	 * 测试添加用户方法
	 */
	@Test
	public void testAddUser() {
		//判断添加数据是否可以成功
		assertTrue(userDao.addUser("saas", "sdsd", 2, '1', '1', 1));
	}

	/**
	 * 测试修改用户方法
	 */
	@Test
	public void testModifyUser() {
		//判断修改数据是否可以成功
		assertTrue(userDao.modifyUser("admin", "123", 1035, '1', '1', 1));
	}

	/**
	 * 测试修改用户角色方法
	 */
	@Test
	public void testModifyUserRole() {
		//测试修改用户角色是否成功
		assertTrue(userDao.modifyUserRole(1035, 2));
	}

	/**
	 * 测试根据用户ID删除用户方法
	 */
	@Test
	public void testDeleteUser() {
		assertTrue(userDao.deleteUser(1035));
	}

	/**
	 * 测试一次删除多个用户方法
	 */
	@Test
	public void testDeleteMoreUser() {
		int[] array = {1101, 1102, 1103};
		
		//测试删除多条记录是否成功
		assertTrue(userDao.deleteMoreUser(array));
	}

}
