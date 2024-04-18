package edu.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.go")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String LOGIN_URL = "WEB-INF/login/";
	private static final String LOGIN = "login";
	private static final String LOGOUT = "logout";
	private static final String BOARD = "board";

	private static final String EXTENSION = ".jsp";
	private static final String SERVER_EXTENSION = ".go";

	public LoginController() {

	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String requestMethod = request.getMethod();
		System.out.println("호출 경로 : " + requestURI);
		System.out.println("호출 방식 : " + requestMethod);

		if (requestURI.contains(LOGIN)) {
			System.out.println("login 호출 확인");
			if (requestMethod.equals("GET")) { // GET 방식(페이지 불러오기)
				loginGET(request, response);
			} else if (requestMethod.equals("POST")) { // POST 방식(DB에 저장)
				loginPOST(request, response);
			}
		} else if (requestURI.contains(LOGOUT)) {
				System.out.println("logout 호출 확인");
					logout(request, response);
		} else if (requestURI.contains(BOARD)) {
			System.out.println("board 호출 확인");
			if (requestMethod.equals("POST")) { // GET 방식(페이지 불러오기)
				boardPOST(request, response);
			}
}

	} // end service()

	private void boardPOST(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println("loginboardPOST()");
		HttpSession session = request.getSession();

		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		String boardId = request.getParameter("boardId");
		

		System.out.println("memberId : " + memberId);
		System.out.println("password : " + password);
		
		// * loginPOST를 수행하는 상황
		// - index.jsp에서 login 버튼 클릭 - 로그인 페이지 - 로그인 성공 - index.jsp 이동
		// - 글 작성 버튼(register.do) 클릭 - 로그인 페이지 - 로그인 성공 - register.do 이동
		if (memberId.contains("test") && password.equals("1234")) { // 포함 되면 => contains
			session.setAttribute("memberId", memberId);
			session.setMaxInactiveInterval(60); // 60초
		request.setAttribute("boardId", boardId);
		String path = "detail.do";
		request.getRequestDispatcher(path).forward(request, response);
		}
		
	}

	private void logout(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println("loginPOST()");
		HttpSession session = request.getSession();
		if(session.getAttribute("memberId") != null) {
			session.removeAttribute("memberId");
			response.sendRedirect("index.jsp");
		}
	}

	private void loginGET(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("loginGET() 호출");
		String boardId = request.getParameter("boardId");
		String targetURL = request.getParameter("targetURL");
		request.setAttribute("targetURL", targetURL);
		request.setAttribute("boardId", boardId);
		String path = LOGIN_URL + LOGIN + EXTENSION;

		request.getRequestDispatcher(path).forward(request, response);

	} // end loginGET()

	private void loginPOST(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("loginPOST()");
		HttpSession session = request.getSession();

		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		String targetURL = request.getParameter("targetURL");
		

		System.out.println("memberId : " + memberId);
		System.out.println("password : " + password);
		
		// * loginPOST를 수행하는 상황
		// - index.jsp에서 login 버튼 클릭 - 로그인 페이지 - 로그인 성공 - index.jsp 이동
		// - 글 작성 버튼(register.do) 클릭 - 로그인 페이지 - 로그인 성공 - register.do 이동
		if (memberId.contains("test") && password.equals("1234")) { // 포함 되면 => contains
			session.setAttribute("memberId", memberId);
			session.setMaxInactiveInterval(60); // 60초
			
//			Cookie[] cookies = request.getCookies();
//			
//			// targetURL 존재 유무에 따른 경로 설정
//			if(cookies != null) {
//				targetURL = "index.jsp";
//				for(Cookie cookie : cookies) {
//					if(cookie.getName().equals("targetURL")) {
//						// targetURL 정보를 가져와서
//						// index.jsp => targetURL(register.do)로 변경
//						// targetURL 정보는 삭제
//						targetURL = cookie.getValue();
//						cookie.setMaxAge(0);
//						response.addCookie(cookie);
//					}
//				}
//			}
			
			if(!targetURL.equals("") && targetURL != null) {
				response.sendRedirect(targetURL);				
			} else {
				response.sendRedirect("index.jsp");	
			}
			
		} else  {
			System.out.println("아이디나 비번이 틀렸습니다.");
			response.sendRedirect("login.go");

		}

	}

}
