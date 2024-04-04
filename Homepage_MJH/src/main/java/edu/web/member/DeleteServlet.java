package edu.web.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// TODO : memberResult.jsp에서 이동
//        로그인된 사용자 아이디를 가져와서 DB에 회원 정보 삭제
//        삭제 성공 후에 login.jsp 페이지로 이동
@WebServlet("/delete.do")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static MemberDAO dao;
	
    public DeleteServlet() {
    	dao = MemberDAOImple.getInstance();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userid");
        PrintWriter out = response.getWriter();
        
        if(userId != null) {
        	// 이후에 MemberVO 객체를 이용하여 원하는 작업을 수행합니다.
            int result = dao.delete(userId);
            if(result == 1) {
            out.println("<script>alert('회원 탈퇴 성공'); location.href='/Homepage_MJH/login.jsp';</script>");
        	 System.out.println("회원 탈퇴 성공");
            } else {
            	out.println("<script>alert('회원 탈퇴 실패');  location.href='select.do';</script>");
				System.out.println("회원 탈퇴 실패");
			}
        	
            
        } else {
            // 사용자가 로그인하지 않은 상태일 때 수행할 작업
            response.sendRedirect("login.jsp");
        }
	}

}
