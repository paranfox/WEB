package edu.web.dbcp.connmgr;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;

@WebFilter("/Charfilter")
public class Charfilter extends HttpFilter implements Filter {
       
    public Charfilter() {
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("test/html; chaeset=UTF-8");
		
		// chain.doFilter(request, response);
		
		super.doFilter(request, response, chain);  // 이게 제일 중요함
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
