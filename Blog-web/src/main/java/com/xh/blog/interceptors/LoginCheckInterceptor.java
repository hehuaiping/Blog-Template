package com.xh.blog.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 登录校验拦截器
 * @author Administrator
 *
 */
public class LoginCheckInterceptor implements HandlerInterceptor {

	//前处理
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//获取请求的uri
		String uri = request.getRequestURI();
		//判断是否是登录请求 
		if(!uri.contains("/login")) {
			//判断session是否有登录用户
			Object user = request.getSession().getAttribute("user");
			if(null == user) {
				//重定向到登录页面
				response.sendRedirect(request.getContextPath() + "/toLogin.controller");
				return false;
			}
		}
		return true;
	}
	//后处理
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		
	}
	//渲染处理
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
	}



}
