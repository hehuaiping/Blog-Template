package com.xh.blog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xh.blog.entity.Article;
import com.xh.blog.entity.Category;
import com.xh.blog.entity.User;
import com.xh.blog.service.ArticleService;
import com.xh.blog.service.UserService;
import com.xh.blog.utils.CreateImageCode;
import com.xh.blog.utils.MD5Utils;

//用户模块
@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	@Autowired
	private ArticleService ateService;
	
	@RequestMapping("/index.controller")
	public String index(Model model) {
		//查询最新的3篇文章
		List<Article> newList = ateService.findNewArticles();
		//查询推荐文章
		List<Article> rmdList = ateService.findRecommendArticles();
		//查询最多阅读文章
		List<Article> hotList = ateService.findHotArticle();
		model.addAttribute("newList", newList);
		model.addAttribute("rmdList", rmdList);
		model.addAttribute("hotList", hotList);
		//请求图片
		return "index";
	}
	
	//登录
	@RequestMapping("/login.controller")
	public String login(User user,String validate_code,HttpServletRequest request) throws Exception {
		//非空校验
		if(null != user && null != user.getUser_name() && null != user.getUser_password() && null != validate_code ) {
			//判断验证码是否正确
			String code = (String) request.getSession().getAttribute("validata_code");
			if(!validate_code.equalsIgnoreCase(code)) {
				//提示验证码错误
				request.setAttribute("msg", "您输入的验证码不正确！");
				return "forward:/toLogin.controller";
			}
			//调用service处理
			user.setUser_password(MD5Utils.md5(user.getUser_password()));
			User u = userService.login(user);
			if(u == null ) {
				request.setAttribute("msg", "您输入的用户名或密码不正确！");
				return "forward:/toLogin.controller";
			}
			//将user存入session域中代表登录
			request.getSession().setAttribute("user", u);
			//登录成功
			return "redirect:/index.controller";
		}
		request.setAttribute("msg", "输入有误！");
		return "forward:/toLogin.controller";
	}
	
	//注销用户
	@RequestMapping("loginOut.controller")
	public String loginOut(String user_id ,HttpSession session) {
		//将代表当前user对象移出session
		//销毁session
		session.invalidate();
		return "redirect:/index.controller";
	}
	
	//获取验证码
	@RequestMapping("/getImg.controller")
	public void getImg(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//设置响应的类型格式为图片格式
		response.setContentType("image/jpeg");
		// 禁止图像缓存。
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Cache-Control", "no-cache");
		response.setDateHeader("Expires", 0);

		CreateImageCode vCode = new CreateImageCode(100, 30, 5, 10);
		//将验证码放入session域中
		request.getSession().setAttribute("validata_code", vCode.getCode());
		vCode.write(response.getOutputStream());
	}
	
	//注册用户
	@RequestMapping("/regist.controller")
	public String regist(User user) {
		if ( null !=  user.getUser_name() || null != user.getUser_password()) {
			//注册用户
			user.setUser_password(MD5Utils.md5(user.getUser_password()));
			userService.save(user);
		}
		//回主页
		return "redirect:/index.controller";
	}
	
	//检查用户名
	@RequestMapping("checkUserName.controller")
	public void checkUserName(String user_name,HttpServletResponse response) throws Exception {
		//非空校验
		if(null != user_name) {
			//调用service验证
			if(!userService.checkUserName(user_name)) {
				response.getWriter().write("success");
			}
		}
	}
	
	//展示用户
	@RequestMapping("/user.html") 
	public String toUser(){
		return "user";
	}
	
	//去注册页面
	@RequestMapping("/toRegist.controller")
	public String toRegist(){
		return "regist";
	}
	
	//去登录页面
	@RequestMapping("/toLogin.controller")
	public String toLogin() {
		return "login";
	}
	
	//去写博客
	@RequestMapping("/toWriteBolg.controller")
	public String toWriteBolg(Model model){
		//查询文章分类数据
		List<Category> listCategory = ateService.findCategory();
		model.addAttribute("listCategory", listCategory);
		return "writeBolg";
	}
	
	//去写博客
	@RequestMapping("/toue.controller")
	public String toue(){
		return "ue";
	}
}
