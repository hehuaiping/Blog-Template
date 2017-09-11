package com.xh.blog.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.TreeMap;
import java.util.UUID;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import com.xh.blog.entity.Article;
import com.xh.blog.entity.Category;
import com.xh.blog.entity.User;
import com.xh.blog.service.ArticleService;
import com.xh.blog.utils.Page;
import com.xh.blog.utils.UploadData;
import com.xh.blog.utils.UserArticleInfo;

//博客模块
@Controller
public class ArticleController {

	private static final String FILE_ROOT = "/WEB-INF/upload";

	@Autowired
	private ArticleService ateService;

	// 保存文章
	@RequestMapping(value = "/saveArticle.controller", method = RequestMethod.POST)
	public String saveArticle(Article ate,Integer category_id, HttpSession session, HttpServletResponse response) throws Exception {
		// 非空验证
		if(null == ate.getContext()) {
			return "index";
		}
		if(null == category_id ) {
			return "index";
		}
		Category category = new Category();
		category.setCategory_id(category_id);
		ate.setCategory(category);
		// 生产UUID
		ate.setArticle_id(UUID.randomUUID().toString());
		// 文章状态默认0
		ate.setState(0);
		// 文章浏览次数0
		ate.setViews(0);
		// 创建时间
		ate.setCreate_time(new Date());
		// 调用service执行保存
		ate.setAuth(((User) session.getAttribute("user")));
		ateService.saveArticle(ate);
		response.getWriter().write("1"); // 返回成功码
		return "index";
	}

	// 文件上传
	@RequestMapping("/uplodaImg.controller")
	public void uploadImg(MultipartFile upfile, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		if (null != upfile) {
			String path = request.getSession().getServletContext().getRealPath("/upload");

			// 生产UUID
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			// 上传文件后缀
			String endName = upfile.getOriginalFilename().substring(upfile.getOriginalFilename().indexOf("."));
			// 保存路径
			upfile.transferTo(new File(path + "/" + uuid + endName));
			// 返回json
			JSONObject json = new JSONObject();
			json.put("errno", 0); // 成功状态
			String[] src = { "upload/" + uuid + endName };
			json.put("data", src);
			String str = json.toJSONString(); // 转成json数据格式返回
			response.setContentType("application/json;charset=utf-8"); // 设置响应数据类型为json
			response.getWriter().write(str); // 响应给客户端
		}
	}

	// 阅读文章
	@RequestMapping("/readArticle.controller")
	// readArticle.controller?article_id=${newA.article_id}
	public String readArticle(String article_id, Model model) {
		if (null != article_id) {
			// 调用ateService查询该文章
			Article article = ateService.findArticleById(article_id);
			model.addAttribute("article", article);
			return "readArticle";

		}
		return "index";
	}

	// 根据用户查询该用户的博客
	@RequestMapping("/findArticleByUser")
	public void findArticleByUser(String user_id, HttpServletResponse response) throws IOException {
		JSONObject json = new JSONObject();
		// 查询用户总共有多少博文
		json.put("countAte", ateService.findCountArticleByUserId(user_id));
		// 查询该用户最近写的博文
		json.put("recentlyAte", ateService.findRecentlyArticleByUserId(user_id));
		// 被阅读最多的博文
		json.put("readMostAte", ateService.findReadMostArticleByUserId(user_id));
		// 返回
		response.setContentType("application/json;charset=utf-8");
		response.getWriter().write(json.toJSONString());
	}

	// 所有文章
	@RequestMapping("/allArticle.controller")
	public String allArticle(Integer category_id,Integer currentPage, Integer pageSize, Model model) {
		if(null == category_id ) {
			return null;
		}
		// 初始化查询条件
		if (null == currentPage || currentPage <= 0) {
			currentPage = 1;
		}
		if (null == pageSize || pageSize <= 0) {
			pageSize = 10;
		}
		// 调用service查询所有文章
		Page<Article> page = ateService.findArticle(category_id,currentPage, pageSize);
		// 调用service查询文章分类
		List<Category> category = ateService.findCategory();

		// 存入model
		model.addAttribute("page", page);
		model.addAttribute("category", category);
		if(null != category_id) {
			model.addAttribute("category_id", category_id);
		}

		return "/all-article";
	}

}
