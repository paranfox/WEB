package edu.web.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


// TODO : loginResult.jsp에서 이동
// 로그인된 사용자의 정보를 DB에서 select
// select된 MemberVO 데이터를 memberResult.jsp로 전송
@WebServlet("/select.do")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static MemberDAO dao;
	
    public SelectServlet() {
    	dao = MemberDAOImple.getInstance();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
        String userid = (String) session.getAttribute("userid");

        if(userid != null) {
        	 MemberVO vo = dao.select(userid);
        	 System.out.println("회원정보 조회 성공");
        	 request.setAttribute("vo", vo);
        	 RequestDispatcher dis = request.getRequestDispatcher("/memberResult.jsp");
 			 dis.forward(request, response);
 			
        } else {
            // 사용자가 로그인하지 않은 상태일 때 수행할 작업
            response.sendRedirect("login.jsp");
        }
	    
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
