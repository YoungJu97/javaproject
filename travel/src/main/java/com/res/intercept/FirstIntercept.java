package com.res.intercept;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class FirstIntercept extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			
		HttpSession session=request.getSession();
		Object userid=session.getAttribute("user_id");
		Cookie cookies[]=request.getCookies();
	
		for(Cookie cookie : cookies) {
			if(cookie.getName().equals(userid)) {
					
					response.sendRedirect(request.getContextPath()+"/");
					return false;
			}else if(userid==null||cookie.getName().length()==0){
				response.sendRedirect(request.getContextPath()+"/");
				return false;
			}
		}
		
		return super.preHandle(request, response, handler);
	}

}
