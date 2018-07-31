package com.polyglot.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.polyglot.domain.AppUsers;
import com.polyglot.utils.PolyglotConstants;


@Component
public class PolyGlotAuthInterceptor extends HandlerInterceptorAdapter {
	
	private Logger logger = Logger.getLogger(PolyGlotAuthInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		//Do not add anything here.
		//Unless we want to do some clean up after logout
		//Or initialize some object before giving access to a url.
 
		/*logger.info("Interceptor: Pre-handle");
		HttpSession session = request.getSession(false);
		AppUsers loggedInUser = null;
		
		//Try to get the active user from session first.
		//If active user is not null then procede
		try {
			loggedInUser = (AppUsers) session.getAttribute(PolyglotConstants.APP_POLYGLOT_USER);
		} catch (Exception ex) {
			logger.error("Caught exception while getting user object");
			logger.error(ex);
		} 
		
		//This block of code handles the session management for the trainer module
		if (request.getRequestURI().contains("/trainer/**") || request.getRequestURI().contains("/student/**")) {
			logger.info("Requested URI : " + request.getRequestURI());
			if (loggedInUser == null) {
				response.sendRedirect("Login");
				return false;
			} else if (loggedInUser.getUserType().equalsIgnoreCase(PolyglotConstants.USER_TYPE_USER) && request.getRequestURI().contains("/trainer/**")) {
				response.sendRedirect("404");
				return false;
			} else if (loggedInUser.getUserType().equalsIgnoreCase(PolyglotConstants.USER_TYPE_PARTNER) && request.getRequestURI().contains("/student/**")) {
				response.sendRedirect("404");
				return false;
			}
		}*/
		
		return true;
	}

}
