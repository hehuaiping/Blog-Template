package com.xh.blog.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.xh.blog.entity.Article;
import com.xh.blog.entity.User;
import com.xh.blog.service.ArticleService;
import com.xh.blog.service.UserService;
import com.xh.blog.utils.MD5Utils;
import com.xh.blog.utils.Page;

@SuppressWarnings("all")
@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired(required=true)
	private ArticleService ateService;

	@Autowired
	private UserService userService;

	// 后台管理主页
	@RequestMapping("/index.html")
	public String adminIndex() {
		// 后台管理主页
		return "/admin/index";
	}

	// 文章管理页面
	@RequestMapping("/article-list.html")
	public String articleList(Model model, Integer currentPage, Integer pageSize) {
		// 初始化查询条件
		if (null == currentPage || currentPage <= 0) {
			currentPage = 1;
		}
		if (null == pageSize || pageSize <= 0) {
			pageSize = 10;
		}
		// 查询所有文章分页列表
		Page<Article> page = ateService.findArticleList(currentPage, pageSize,new Integer[]{0,1,2},0,3);
		if (null != page) {
			// 将数据存入model中
			model.addAttribute("page", page);
		}
		// 文章管理页面
		return "/admin/article-list";
	}

	// 发布文章
	@RequestMapping("/publish.controller")
	public void publishArticle(String article_id, HttpServletResponse response) throws Exception {
		if (null != article_id) {
			// 调用ateSerrvice发布文章
			ateService.publishArticle(article_id);
		}
		// 返回成功状态码
		response.getWriter().write("ok");
	}

	// 文章下架
	@RequestMapping("/lowerArticle.controller")
	public void lowerArticle(String article_id, HttpServletResponse response) throws Exception {
		if (null != article_id) {
			// 调用ateService下架文章
			ateService.lowerArticle(article_id);
		}
		// 返回成功状态吗
		response.getWriter().write("ok");
	}

	// 编辑文章
	@RequestMapping("/editArticle.html")
	public String editArticleById(String article_id, Model model) {
		// 调用ateService查询文章
		model.addAttribute("article", ateService.findArticleById(article_id));
		return "/admin/editBlog";
	}

	// 更新编辑后的文章
	@RequestMapping("/updateArticle.controller")
	public void updateArticle(Article article, HttpServletResponse response) throws Exception {
		// 调用ateService保存文章
		ateService.updateArticle(article);
		response.getWriter().write("ok");
	}

	// 删除文章
	@RequestMapping("/deleteArticle.controller")
	public void deleteArticleById(String article_id, HttpServletResponse response) throws Exception {
		if (null != article_id) {
			// 调用ateService删除文章
			ateService.deleteArticleById(article_id);
		}
		response.getWriter().write("success");
	}

	// 取消或者设置文章为推荐阅读
	@RequestMapping("/setArticleHot.controller")
	public void setArticleHot(String article_id, Boolean hot, HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=utf-8");
		if (hot) {
			// 推荐文章只能有三篇
			if (null != ateService.findCountHotArticle() && ateService.findCountHotArticle() >= 3) {
				// 设置失败
				response.getWriter().write("对不起,系统只能设置三篇文章为推荐阅读！");
				return;
			}
			// 设置为推荐阅读
			ateService.setArticleHot(article_id, hot);
			JSONObject json = new JSONObject();
			response.getWriter().write(json.toJSONString());
		} else {
			// 取消设置为推荐阅读
			ateService.setArticleHot(article_id, hot);
			response.getWriter().write("ok");
		}
	}

	// 图片管理
	@RequestMapping("/picture-list.html")
	public String pictureList() {
		return "/admin/picture-list";
	}

	// 查询所有图片
	@RequestMapping("/allImg.controller")
	public void allImg(Integer currentPage, Integer pageSize) {
		// 初始化查询条件
		if (null == currentPage || currentPage <= 0) {
			currentPage = 1;
		}
		if (null == pageSize || pageSize <= 0) {
			pageSize = 10;
		}
		// 查询图片分页列表
		// Page<> ateService.findImageList(currentPage,pageSize);
	}

	// 会员列表
	@RequestMapping("/member-list.html")
	public String member() {
		return "/admin/member-list";
	}

	// 查询会员分页列表
	@RequestMapping("/findUserList.controller")
	public void findMemberList(Integer currentPage, Integer pageSize, HttpServletResponse response) throws IOException {
		response.setContentType("application/json;charset=utf-8");
		// 初始化查询条件
		if (null == currentPage || currentPage <= 0) {
			currentPage = 1;
		}
		if (null == pageSize || pageSize <= 0) {
			pageSize = 10;
		}
		// 查询分页数据
		Page<User> page = ateService.findUserList(currentPage, pageSize);
		if (null == page) {
			// 没有数据
			response.getWriter().write("没有找到数据");
			return;
		}
		// 将数据转换成json格式数据返回
		JSONObject json = new JSONObject();
		response.getWriter().write(json.toJSONString(page));
	}

	// 停用用户/启用用户
	@RequestMapping("/changeUserState.controller")
	public void stopUser(Integer user_id, Integer user_state, HttpServletResponse response) throws IOException {
		if (null == user_id) {
			return;
		}
		if (user_state != null && (user_state == 0 || user_state == 1 || user_state == 2 || user_state == 3)) {
			// 调用service修改用户状态
			userService.changeUserState(user_id, user_state);
			JSONObject json = new JSONObject();
			json.put("success", "success");
			response.setContentType("application/json;charset=utf-8");
			response.getWriter().write(json.toJSONString());
		} else {
			return;
		}
	}

	// 根据用户ID查询用户数据
	@RequestMapping("/findUserById.controller")
	public @ResponseBody User findUserById(Integer user_id) {
		// 校验数据
		if (null == user_id) {
			return null;
		}
		// 调用service获取数据
		return userService.findUserById(user_id);
	}

	// 更新或添加用户
	@RequestMapping("/updateOrAddUser.controller")
	public void updateOrAddUser(User user) {
		if (null == user) {
			return;
		}
		// 判断是添加用户还是更新用户
		if (null == user.getUser_id()) {
			// 添加用户
			this.addUser(user);
		} else {
			// 更新用户
			this.updateUser(user);
		}
	}

	// 添加用户
	public void addUser(User user) {
		// 调用service添加用户
		// MD5加密
		user.setUser_password(MD5Utils.md5(user.getUser_password()));
		userService.save(user);
	}

	// 修改用户
	public void updateUser(User user) {
		// 调用service修改用户
		if (user.getUser_password().length() != 32) {
			user.setUser_password(MD5Utils.md5(user.getUser_password()));
		}
		userService.updateUser(user);
	}

	// 删除用户(假删除)
	@RequestMapping("/deleteUserById.controller")
	public void deleteUserById(Integer user_id, HttpServletResponse response) throws IOException {
		if (null == user_id) {
			return;
		}
		// 删除用户
		userService.deleteUserById(user_id);
		JSONObject json = new JSONObject();
		response.getWriter().write(json.toJSONString());

	}

	// 批量删除用户(假删除)
	@RequestMapping("/batDeleteUserById.controller")
	public void batDeleteUserById(Integer[] user_ids, HttpServletResponse response) throws IOException {
		if (null == user_ids || user_ids.length == 0) {
			return;
		}

		for (Integer user_id : user_ids) {
			// 删除用户
			userService.deleteUserById(user_id);
		}

		JSONObject json = new JSONObject();
		response.getWriter().write(json.toJSONString());
	}

	// 删除的会员页面
	@RequestMapping("/member-del.html")
	public String memeberDel(Integer currentPage, Integer pageSize, Model model) {
		// 初始化查询条件
		if (null == currentPage || currentPage <= 0) {
			currentPage = 1;
		}
		if (null == pageSize || pageSize <= 0) {
			pageSize = 10;
		}
		// 查询删除的会员
		Page<User> page = userService.findUserDel(currentPage, pageSize);
		model.addAttribute("page", page);
		return "/admin/member-del";
	}

	// 还原用户
	@RequestMapping("/resetUserById.controller")
	public void resetUserById(Integer user_id, HttpServletResponse response) throws IOException {
		if (null == user_id) {
			return;
		}
		// 调用userService还原用户
		userService.resetUserById(user_id);

		JSONObject json = new JSONObject();
		response.getWriter().write(json.toJSONString());
	}

	// 删除用户
	@RequestMapping("/tureUserDelById.controller")
	public void trueUserDelById(Integer user_id, HttpServletResponse response) throws IOException {
		if (null == user_id) {
			return;
		}

		// 调用userService删除用户
		userService.trueDeleteUserById(user_id);

		JSONObject json = new JSONObject();
		response.getWriter().write(json.toJSONString());
	}

	// 批量删除用户
	@RequestMapping("/batUserDelByIds.controller")
	public void batUserDelByIds(Integer[] user_ids, HttpServletResponse response) throws IOException {
		if (null == user_ids) {
			return;
		}
		for (Integer user_id : user_ids) {
			userService.trueDeleteUserById(user_id);
		}

		JSONObject json = new JSONObject();
		response.getWriter().write(json.toJSONString());
	}

	// 批量删除文章(假删除)
	@RequestMapping("/batDeleteArticleById.controller")
	public void batDeleteArticleById(String[] article_ids, HttpServletResponse response) throws IOException {
		if (null == article_ids || article_ids.length == 0) {
			return;
		}

		// 删除文章
		ateService.batDeleteArticleById(article_ids);

		JSONObject json = new JSONObject();
		response.getWriter().write(json.toJSONString());
	}

	// 回收站
	@RequestMapping("/article-del.html")
	public String articleDel(Model model, Integer currentPage, Integer pageSize) {
		// 初始化查询条件
		if (null == currentPage || currentPage <= 0) {
			currentPage = 1;
		}
		if (null == pageSize || pageSize <= 0) {
			pageSize = 10;
		}
		// 查询所有文章分页列表
		Page<Article> page = ateService.findArticleList(currentPage, pageSize,new Integer[]{3},3,4);
		if (null != page) {
			// 将数据存入model中
			model.addAttribute("page", page);
		}
		//返回视图
		return "/admin/article-del";
	}
	
	//文章还原
	@RequestMapping("/resetArticleById")
	public void resetArticleById(String article_id, HttpServletResponse response) throws IOException {
		if(null ==  article_id) {
			return;
		}
		
		//调用ateService还原
		ateService.resetArticleById(article_id);
		
		//响应
		JSONObject json = new JSONObject();
		response.getWriter().write(json.toJSONString());
	}
}
