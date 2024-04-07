package edu.web.member;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

// TODO : memberUpdate.jsp에서 전송된 데이터로 DB 회원 정보 수정
//        회원 정보 수정에 성공하면 memberResult.jsp에 MemberVO 데이터 전송하여 출력
@WebServlet("/update.do")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static MemberDAO dao;
	
    public UpdateServlet() {
    	dao = MemberDAOImple.getInstance();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("/Homepage_MJH/login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
        String userId = (String) session.getAttribute("userid");
        PrintWriter out = response.getWriter();
        
        if(userId != null) {
        	// request에서 파라미터 값을 읽어옵니다.
            String userid = request.getParameter("userid");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String emailAgree = request.getParameter("emailAgree");
            String[] interest = request.getParameterValues("interest");
            String phone = request.getParameter("phone");
            String introduce = request.getParameter("introduce");
        	
            // MemberVO 객체를 생성하고 파라미터 값을 설정합니다.
            MemberVO member = new MemberVO(userid, password, email, emailAgree, interest, phone, introduce);
            System.out.println(member);
            // 이후에 MemberVO 객체를 이용하여 원하는 작업을 수행합니다.
            int result = dao.update(userId, member);
            
            if(result == 1) {
            out.println("<script>alert('회원정보 수정 성공'); location.href='select.do';</script>");
        	 System.out.println("회원정보 수정 성공");
            } else {
            	out.println("<script>alert('회원정보 수정 실패');  location.href='select.do';</script>");
				System.out.println("회원정보 수정 실패");
			}
        	 
        } else {
            // 사용자가 로그인하지 않은 상태일 때 수행할 작업
            response.sendRedirect("login.jsp");
        }
		
    

	}
}
