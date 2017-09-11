package com.xh.blog.service;

import java.util.List;

import com.xh.blog.entity.Article;
import com.xh.blog.entity.Category;
import com.xh.blog.entity.User;
import com.xh.blog.utils.Page;

public interface ArticleService {
	/**
	 * 保存文章
	 * @param ate
	 */
	void saveArticle(Article ate);
	/**
	 * 获取最新的文章
	 * @return
	 */
	List<Article> findNewArticles();
	/**
	 * 获取推荐文章
	 * @return
	 */
	List<Article> findRecommendArticles();
	/**
	 * 根据文章ID查询文章
	 * @param article_id 文章ID
	 * @return	返回ID对应的文章
	 */
	Article findArticleById(String article_id);
	/**
	 * 查询最新文章
	 * @return
	 */
	List<Article> findHotArticle();
	/**
	 * 查询所有文章分页列表
	 * @param currentPage 当前页
	 * @param pageSize 每页显示多少条
	 * @param state 文章状态
	 *        0 未发布
	 *        1 已发布
	 *        2 推荐
	 *        3 已删除
	 * @param startIndex  开始索引
	 * @param endIndex   结果索引
	 * @return 返回按照分页条件查询到的分页数据
	 */
	Page<Article> findArticleList(Integer currentPage ,Integer pageSize,Integer[] state, Integer startIndex, Integer endIndex);
	/**
	 * 发布文章
	 * @param article_id 文章ID
	 */
	void publishArticle(String article_id);
	/**
	 * 下架文章
	 * @param article_id 文章ID
	 */
	void lowerArticle(String article_id);
	/**
	 * 更新文章
	 * @param article 文章
	 */
	void updateArticle(Article article);
	/**
	 * 删除文章
	 * @param article_id 文章ID
	 */
	void deleteArticleById(String article_id);
	/**
	 * 查询用户总共写了多少博文
	 * @param user_id 用户ID
	 * @return 返回用户写的博文数量
	 */
	Integer findCountArticleByUserId(String user_id);
	/**
	 * 查询用户最近写的博客
	 * @param user_id 用户ID
	 * @return 返回用户最近写的博客
	 */
	List<Article> findRecentlyArticleByUserId(String user_id);
	/**
	 * 查询该用户下所有博客中  被阅读最多的博客
	 * @param user_id
	 * @return
	 */
	List<Article> findReadMostArticleByUserId(String user_id);
	/**
	 * 设置文章为推荐阅读
	 * @param article_id 文章ID
	 * @param hot 为true时设置为推荐阅读  false时取消推荐阅读
	 */
	void setArticleHot(String article_id, Boolean hot);
	/**
	 * 查询当前推荐文章的总数
	 * @return 返回推荐文章的文章数
	 */
	Integer findCountHotArticle();
	/**
	 * 根据分页信息查询用户
	 * @param currentPage 当前页
	 * @param pageSize 每页显示多少条数据
	 * @return 返回按分页条件查询到的用户列表
	 */
	Page<User> findUserList(Integer currentPage, Integer pageSize);
	/**
	 * 批量删除文章
	 * @param article_ids 文章ID
	 */
	void batDeleteArticleById(String[] article_ids);
	/**
	 * 根据分页条件查询所有文章
	 * @param currentPage 当前页
	 * @param pageSize 每页显示多少条数据
	 * @param category_id 文章分类ID 
	 * @return 返回根据分页条件查询到的数据
	 */
	Page<Article> findArticle(Integer category_id,Integer currentPage, Integer pageSize);
	/**
	 * 查询所有文章分类
	 * @return 返回文章分类
	 */
	List<Category> findCategory();
	/**
	 * 还原文章
	 * @param article_id 文章ID
	 */
	void resetArticleById(String article_id);
	
}
