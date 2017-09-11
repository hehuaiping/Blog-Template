package com.xh.blog.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.xh.blog.entity.User;

public class AdminLoginInterceptor implements HandlerInterceptor {

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		//获取uri
		String uri = request.getRequestURI();
		//判断是否是包含管理员访问路径
		if(uri.contains(uri)) {
			//获取当前用户 判断当前用户是否有是管理员
			User user = (User)request.getSession().getAttribute("user");
			//如果用户没有登录  跳去管理员登录界面
			if(null == user) {
				response.sendRedirect(request.getContextPath()+"/admin/adminLogin.html");
				return false;
			}
			
		}
		return false;
	}	
	
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {

	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {

	}

}
