package edu.web.member;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginFilter implements Filter {
	private FilterConfig filterConfig;
	
	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        HttpSession session = httpRequest.getSession(false); // 세션이 없으면 null 반환

        if (session != null && session.getAttribute("userid") != null) {
            // 세션에 userid가 존재하면 이를 사용할 수 있습니다.
            String userId = (String) session.getAttribute("userid");
            // 이후 작업 수행
            
        } else {
            // 세션에 userid가 없거나 세션이 없는 경우에 대한 처리
            // 예를 들어, 로그인 페이지로 리다이렉트할 수 있습니다.
            httpResponse.sendRedirect("login.jsp");
            return; // 필터 체인 중지
        }

        // 다음 필터로 요청 전달
        chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
	}

}