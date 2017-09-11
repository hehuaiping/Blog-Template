package com.xh.blog.dao;

import java.util.List;

import com.xh.blog.entity.User;

public interface UserMapper {
	/**
	 * 保存用户
	 * @param user
	 */
	void save(User user);
	/**
	 * 检查用户名是否存在
	 * @param user_name 用户名
	 * @return 如果存在返回用户名,否则返回null
	 */
	String checkUserName(String user_name);
	/**
	 * 根据用户名查找用户
	 * @param user_name 用户名
	 * @return 如果用户名存在则返回该user  否则返回null
	 */
	User findUserByUserName(String user_name);
	/**
	 * 更改用户状态 
	 * @param user_id 用户ID
	 * @param user_state 用户状态
	 * 
	 */
	void changeUserState(Integer user_id, Integer user_state);
	/**
	 * 根据用户ID查询用户数据
	 * @param user_id 用户ID
	 * @return 返回查询到的用户，否则返回null
	 */
	User findUserByID(Integer user_id);
	/**
	 * 更新用户
	 * @param user  用户
	 */
	void updateUser(User user);
	/**
	 * 根据用户ID删除 用户
	 * @param user_id 用户ID
	 */
	void deleteUserById(Integer user_id);
	/**
	 * 查询删除的所有会员记录
	 * @return
	 */
	Integer findUserDelCountNum();
	/**
	 * 根据分页数据查询删除的会员
	 * @param currentPage 当前页
	 * @param pageSize 每页显示多少条记录
	 * @return 返回根据分页条件查询到的记录
	 */
	List<User> findUserDelByPage(Integer currentPage, Integer pageSize);
	/**
	 * 还原用户
	 * @param user_id 用户Id
	 */
	void resetUserById(Integer user_id);
	/**
	 * 删除用户
	 * @param user_id 用户Id
	 */
	void trueDeleteUserById(Integer user_id);
	
}
