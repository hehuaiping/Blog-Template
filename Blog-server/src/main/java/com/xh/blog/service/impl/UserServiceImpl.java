package com.xh.blog.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xh.blog.dao.UserMapper;
import com.xh.blog.entity.User;
import com.xh.blog.exception.MessageException;
import com.xh.blog.service.UserService;
import com.xh.blog.utils.Page;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	public void test(String id){}

	public void save(User user) {
		userMapper.save(user);
	}

	public boolean checkUserName(String user_name) {
		//如果存在
		if(null != userMapper.checkUserName(user_name)) {
			return true;
		}
		//如果不存在
		return false;
	}

	public User login(User user) throws Exception {
		//判断该用户名是否存在
		User u = userMapper.findUserByUserName(user.getUser_name());
		return u;
	}

	public void changeUserState(Integer user_id, Integer user_state) {
		userMapper.changeUserState(user_id,user_state);
	}

	public User findUserById(Integer user_id) {
		return userMapper.findUserByID(user_id);
	}

	public void updateUser(User user) {
		userMapper.updateUser(user);
	}

	public void deleteUserById(Integer user_id) {
		userMapper.deleteUserById(user_id);
	}

	public Page<User> findUserDel(Integer currentPage, Integer pageSize) {
		Page<User> page = new Page<User>();
		//调用userMapper查询出删除的用户总记录数
		int countNum = userMapper.findUserDelCountNum();
		page.setCountNum(countNum);
		//设置/当前页/每页显示多少条/总页数
		page.setCurrentPage(currentPage);
		page.setPageSize(pageSize);
		page.setCountPage(countNum/page.getPageSize()+(countNum%page.getPageSize() == 0 ? 0 : 1));
		//上一页/下一页/尾页
		page.setUpPage(currentPage == 0 ? 1 : currentPage - 1);
		page.setNextPage(currentPage == page.getCountPage() ? page.getCountPage() : page.getCountPage() + 1);
		page.setFirstPage(0);
		page.setLastPage(page.getCountPage());
		//查询分页数据
		page.setList(userMapper.findUserDelByPage((page.getCurrentPage() - 1 ) * page.getPageSize(),page.getPageSize()));
		//返回数据
		return page;
	}

	public void resetUserById(Integer user_id) {
		userMapper.resetUserById(user_id);
	}

	public void trueDeleteUserById(Integer user_id) {
		userMapper.trueDeleteUserById(user_id);
	};
}
