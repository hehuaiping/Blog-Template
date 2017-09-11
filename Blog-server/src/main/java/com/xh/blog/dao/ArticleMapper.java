package com.xh.blog.dao;

import java.util.List;

import com.xh.blog.entity.Article;
import com.xh.blog.entity.Category;
import com.xh.blog.entity.User;

public interface ArticleMapper {
	/**
	 * 保存文章
	 * @param ate 文章
	 */
	void saveArticle(Article ate);
	/**
	 * 查询最新的文章
	 * @return 返回最新的文章集合
	 */
	List<Article> findNewArticles();
	/**
	 * 查询推荐文章
	 * @return 返回推荐文章集合
	 */
	List<Article> findRecommendArticles();
	/**
	 * 根据文章ID查询文章
	 * @param article_id 文章ID
	 * @return	返回ID对应的文章
	 */
	Article findArticleById(String article_id);
	/**
	 * 根据文章ID添加文章浏览记录
	 * @param article_id 文章ID
	 */
	void plusArticleViewsById(String article_id);
	/**
	 * 查询最热文章
	 * @return 返回最热文章集合
	 */
	List<Article> findHotArticle();
	/**
	 * 查询文章总记录数
	 * @param state 文章状态
	 * 		  state = ? 0未发布 1已发布 2推荐 3已删除
	 * @return 返回文章总记录数  如果没有返回null
	 */
	Integer findArticleCountNum(Integer state);
	/**
	 * 根据分页条件查询文章列表
	 * @param currentPage 起始页
	 * @param pageSize 每页显示多少条数据
	 * @param startIndex 开始索引
	 * @param endIndex 结束索引
	 * @return 返回查询到的文章集合
	 */
	List<Article> findArticleByPage(Integer currentPage, Integer pageSize,Integer startIndex,Integer endIndex);
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
	 * @param article_id 文章Id
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
	 * 将文章设置为推荐阅读
	 * @param article_id 文章ID
	 */
	void setArticleHot(String article_id);
	/**
	 * 将文章设置取消推荐阅读
	 * @param article_id 文章ID
	 */
	void setArticleReHot(String article_id);
	/**
	 * 查询推荐文章的文章数
	 * @return 返回推荐文章的文章数
	 */
	Integer findCountHotArticle();
	/**
	 * 查询用户总记录数
	 * @return 返回用户总记录数
	 */
	Integer findUserCountNum();
	/**
	 * 按分页条件查询用户列表
	 * @param currentPage 当前页 
	 * @param pageSize 每页显示大小
	 * @return 返回按分页条件查询到的用户列表
	 */
	List<User> findUserByPage(Integer currentPage, Integer pageSize);
	/**
	 * 批量删除文章
	 * @param article_id 文章ID
 	 */
	void batDeleteArticleById(String article_id);
	/**
	 * 查询文章分类
	 * @return 返回文章分类
	 */
	List<Category> findCategory();
	/**
	 * 根据文章分类ID查询文章分页数据
	 * @param category_id 文章分类ID
	 * @param currentPage 当前页
	 * @param pageSize 每页显示大小
	 * @return 返回按条件查询到的数据
	 */
	List<Article> findArticleByPageAndCategory(Integer category_id, Integer currentPage, Integer pageSize);
	/**
	 * 查询符合条件的数据总记录
	 * @param category_id 分类ID
	 * @return 返回数据总记录数
	 */
	Integer findCategoryArticleCountNum(Integer category_id);
	/**
	 * 还原文章
	 * @param article_id 文章ID
	 */
	void resetArticleById(String article_id);
	
}
