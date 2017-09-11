package com.xh.blog.service;

import com.xh.blog.entity.User;
import com.xh.blog.utils.Page;

public interface UserService {
	/**
	 * 保存用户
	 * @param user
	 */
	void save(User user);
	/**
	 * 检查用户名是否存在
	 * @param user_name 用户名
	 * @return 如果存在返回true,否则返回falses
	 */
	boolean checkUserName(String user_name);
	/**
	 * 登录
	 * @param user 用户
	 * @return	如果用户用户密码正确返回该user  否则返回null
	 */
	User login(User user) throws Exception;
	/**
	 * 改变用户状态
	 * @param user_id 用户ID
	 * @param user_state 用户状态
	 * 1
	 */
	void changeUserState(Integer user_id,Integer user_state);
	/**
	 * 根据用户ID查询用户
	 * @param user_id 用户ID
	 * @return 返回查询到的用户，否则返回null
	 */
	User findUserById(Integer user_id);
	/**
	 * 修改用户
	 * @param user 用户
	 */
	void updateUser(User user);
	/**
	 * 根据用户ID删除用户
	 * @param user_id 用户ID
	 */
	void deleteUserById(Integer user_id);
	/**
	 * 根据分页条件查询删除的会员
	 * @param currentPage 当前页
	 * @param pageSize 每页显示多少条数据
	 * @return 返回根据分页数据查询到的page
	 */
	Page<User> findUserDel(Integer currentPage, Integer pageSize);
	/**
	 * 还原用户
	 * @param user_id 用户ID
	 */
	void resetUserById(Integer user_id);
	/**
	 * 删除用户
	 * @param user_id 用户ID
	 */
	void trueDeleteUserById(Integer user_id);
	
}
