package com.xh.blog.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xh.blog.dao.ArticleMapper;
import com.xh.blog.entity.Article;
import com.xh.blog.entity.Category;
import com.xh.blog.entity.User;
import com.xh.blog.service.ArticleService;
import com.xh.blog.utils.Page;

@Service
public class ArticleServiceImpl implements ArticleService {

	//注入dao
	@Autowired
	private ArticleMapper ateMapper; 
	
	public void saveArticle(Article ate) {
		//调用dao执行保存
		ateMapper.saveArticle(ate);
	}

	public List<Article> findNewArticles() {
		return ateMapper.findNewArticles();
	}

	public List<Article> findRecommendArticles() {
		return ateMapper.findRecommendArticles();
	}

	public Article findArticleById(String article_id) {
		//添加一次浏览记录
		ateMapper.plusArticleViewsById(article_id);
		return ateMapper.findArticleById(article_id);
	}

	public List<Article> findHotArticle() {
		return ateMapper.findHotArticle();
	}

	public Page<Article> findArticleList(Integer currentPage ,Integer pageSize,Integer[] state,Integer startIndex,Integer endIndex) {
		Page<Article> page = new Page<Article>();
		//1、调用ateMapper查询出总页数
		Integer countArticleNum = 0;
		for (Integer i : state) {
			countArticleNum += ateMapper.findArticleCountNum(i);
		}
		page.setCountNum(countArticleNum);
		//2、设置/当前页/每页显示多少条/总页数
		page.setCurrentPage(currentPage);
		page.setPageSize(pageSize);
		page.setCountPage(page.getCountNum()/page.getPageSize()+(page.getCountNum()%page.getPageSize()==0?0:1));
		//3、下一页/上一页/首页/尾页
		page.setNextPage(page.getCurrentPage() == page.getCountPage() ? page.getCurrentPage() : page.getCurrentPage()+1);
		page.setUpPage(page.getCurrentPage() - 1 == 0 ? 1 : page.getCurrentPage() - 1);
		page.setFirstPage(0);
		page.setLastPage(page.getCountPage());
		//查询分页数据
		page.setList(ateMapper.findArticleByPage((page.getCurrentPage() - 1 ) * page.getPageSize() ,page.getPageSize(),startIndex,endIndex));
		return page;
	}

	public void publishArticle(String article_id) {
		//调用ateMapper发布文章
		ateMapper.publishArticle(article_id);
	}

	public void lowerArticle(String article_id) {
		//调用ateMapper下架文章
		ateMapper.lowerArticle(article_id);
	}

	public void updateArticle(Article article) {
		//更新文章
		ateMapper.updateArticle(article);
	}

	public void deleteArticleById(String article_id) {
		//删除文章
		ateMapper.deleteArticleById(article_id);
	}

	public Integer findCountArticleByUserId(String user_id) {
		return ateMapper.findCountArticleByUserId(user_id);
	}

	public List<Article> findRecentlyArticleByUserId(String user_id) {
		return ateMapper.findRecentlyArticleByUserId(user_id);
	}

	public List<Article> findReadMostArticleByUserId(String user_id) {
		return ateMapper.findReadMostArticleByUserId(user_id);
	}

	public void setArticleHot(String article_id, Boolean hot) {
		if(hot) {
			//设置为推荐阅读
			ateMapper.setArticleHot(article_id);
		}else {
			//取消设置为推荐阅读
			ateMapper.setArticleReHot(article_id);
		}
	}

	public Integer findCountHotArticle() {
		return ateMapper.findCountHotArticle();
	}

	public Page<User> findUserList(Integer currentPage, Integer pageSize) {
		Page<User> page = new Page<User>();
		//1、调用ateMapper查询出总页数
		page.setCountNum(ateMapper.findUserCountNum());
		//2、设置/当前页/每页显示多少条/总页数
		page.setCurrentPage(currentPage);
		page.setPageSize(pageSize);
		page.setCountPage(page.getCountNum()/page.getPageSize()+(page.getCountNum()%page.getPageSize()==0?0:1));
		//3、下一页/上一页/首页/尾页
		page.setNextPage(page.getCurrentPage() == page.getCountPage() ? page.getCurrentPage() : page.getCurrentPage()+1);
		page.setUpPage(page.getCurrentPage()  == 0 ? 0 : page.getCurrentPage() - 1);
		page.setFirstPage(0);
		page.setLastPage(page.getCountPage());
		//查询分页数据
		page.setList(ateMapper.findUserByPage((page.getCurrentPage() - 1 ) * page.getPageSize() ,page.getPageSize()));
		return page;
	}

	public void batDeleteArticleById(String[] article_ids) {
		for(String article_id : article_ids) {
			ateMapper.batDeleteArticleById(article_id);
		}
	}

	public Page<Article> findArticle(Integer category_id,Integer currentPage, Integer pageSize) {
		Page<Article> page = new Page<Article>();
		//1查询出文章总页数
		Integer countNum = ateMapper.findCategoryArticleCountNum(category_id);
		page.setCountNum(countNum);
		//2设置当前页/每页显示多少条/总页数
		page.setCurrentPage(currentPage);
		page.setPageSize(pageSize);
		page.setCountPage(countNum / page.getPageSize() + (countNum % page.getPageSize() == 0 ? 0 : 1));
		//3上一页/上一页/首页/尾页
		page.setNextPage(page.getCurrentPage() == page.getCountPage() ? page.getCurrentPage() : page.getCurrentPage() +  1);
		page.setUpPage(page.getCurrentPage() -1 == 0 ? 0 : page.getCurrentPage() - 1 );
		page.setFirstPage(0);
		page.setLastPage(page.getCountPage());
		//查询分页数据
		page.setList(ateMapper.findArticleByPageAndCategory(category_id,(currentPage - 1) * pageSize, pageSize));
		return page;
	}

	public List<Category> findCategory() {
		return ateMapper.findCategory();
	}

	public void resetArticleById(String article_id) {
		ateMapper.resetArticleById(article_id);
	}

}
