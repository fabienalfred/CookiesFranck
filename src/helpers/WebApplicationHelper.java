package helpers;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WebApplicationHelper {
	public static String getCookieValue(HttpServletRequest request, String key){
		Cookie[] cookies = request.getCookies();
		if(cookies==null)
			return null;
		for(Cookie cookie : cookies){
			if(cookie.getName().equals(key)){
				return cookie.getValue();
			}
		}
		return null;
	}
	
	public static void setCookie(HttpServletResponse response,String key, String value, int nbJours){
		Cookie cookie = new Cookie(key,value);
		if(nbJours>0)
			cookie.setMaxAge(3600*nbJours);
		response.addCookie(cookie);
	}
	
}
