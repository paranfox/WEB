package web.ch14.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


// 문자열로 url 정보 입력
@WebServlet("/main") // annotation 방식
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      private static final String CLASSNAME
      	= MainServlet.class.getName(); // 클래스 위치와 이름 참조
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainServlet() {
    	System.out.println(CLASSNAME + " MainSerclet()");
    }

	// init() : 해당 Servlet이 실행될 때 한번만 호출.
    @Override
    public void init() throws SecurityException {
    	System.out.println(CLASSNAME + " init()");
    }
    
    // service() : HTTP 요청이 발생될 때마다 호출.
    // doGet()과 doPost()로 대체 가능
	/*
	 * @Override protected void service(HttpServletRequest req, HttpServletResponse
	 * res) { System.out.println(CLASSNAME + " service()"); }
	 */
    
    // doGet() : HTTP GET 요청이 발생될 때마다 호출
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(CLASSNAME + " doGet()");
		
	}

	// doPost() : HTTP POST 요청이 발생될 때마다 호출
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println(CLASSNAME + " doPost()");
	}
	
	// destroy() : 서버가 종료될 때 호출.
	@Override
	public void destroy() {
		System.out.println(CLASSNAME + " destroy()");
	}

}
