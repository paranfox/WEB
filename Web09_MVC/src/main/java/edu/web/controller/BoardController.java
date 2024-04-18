package edu.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.web.domain.BoardVO;
import edu.web.persistence.BoardDAO;
import edu.web.persistence.BoardDAOImple;
import edu.web.util.PageCriteria;
import edu.web.util.PageMaker;

@WebServlet("*.do") // *.do : ~.do로 선언된 HTTP 호출에 대해 반응
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String BOARD_URL = "WEB-INF/board/";
	private static final String MAIN = "index";
	private static final String LIST = "list";
	private static final String REGISTER = "register";
	private static final String DETAIL = "detail";
	private static final String UPDATE = "update";
	private static final String DELETE = "delete";

	private static final String EXTENSION = ".jsp";
	private static final String SERVER_EXTENSION = ".do";

	private static BoardDAO dao;

	public BoardController() {
		dao = BoardDAOImple.getInstance();
	}

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		String requestMethod = request.getMethod();
		System.out.println("호출 경로 : " + requestURI);
		System.out.println("호출 방식 : " + requestMethod);

		if (requestURI.contains(LIST + SERVER_EXTENSION)) {
			System.out.println("list 호출 확인");
			list(request, response);
		} else if (requestURI.contains(REGISTER + SERVER_EXTENSION)) {
			System.out.println("register 호출 확인");
			if (requestMethod.equals("GET")) { // GET 방식(페이지 불러오기)
				registerGET(request, response);
			} else if (requestMethod.equals("POST")) { // POST 방식(DB에 저장)
				registerPOST(request, response);
			}
		} else if (requestURI.contains(DETAIL + SERVER_EXTENSION)) {
			System.out.println("detail 호출 확인");
			detail(request, response);
		} else if (requestURI.contains(UPDATE + SERVER_EXTENSION)) {
			System.out.println("update 호출 확인");
			if (requestMethod.equals("GET")) { // GET 방식(페이지 불러오기)
				updateGET(request, response);
			} else if (requestMethod.equals("POST")) { // POST 방식(DB에 저장)
				updatePOST(request, response);
			}
		} else if (requestURI.contains(DELETE + SERVER_EXTENSION)) {
			System.out.println("delete 호출 확인");
			if (requestMethod.equals("POST")) {
				deletePOST(request, response);
			}
		}

	} // end service()

	// TODO : 전체 게시판 내용(list)을 DB에서 가져오고, 그 데이터를 list.jsp 페이지에 전송
	private void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("list()");
		String path = BOARD_URL + LIST + EXTENSION;

//		List<BoardVO> boardList = dao.select();
//		List<BoardVO> boardList = dao.select(1, 3);
//		int page = Integer.parseInt(request.getParameter("page"));
		// null이여도 상관이 없게 된다.
		String page = request.getParameter("page");

		PageCriteria criteria = new PageCriteria();
		if (page != null) {
			criteria.setPage(Integer.parseInt(page));
		}

		List<BoardVO> boardList = dao.select(criteria);

		request.setAttribute("boardList", boardList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		int totalCount = dao.getTotalCount();
		pageMaker.setTotalCount(totalCount);
		pageMaker.setPageData();
		System.out.println("전체 게시글 수 : " + pageMaker.getTotalCount());
		System.out.println("현제 선택된 페이지 : " + criteria.getPage());
		System.out.println("한 페이지당 게시글 수 : " + criteria.getNumsPerPage());
		System.out.println("페이지 링크 번호 개수 : " + pageMaker.getNumsOfPageLinks());
		System.out.println("시작 페이지 링크 번호 : " + pageMaker.getStartPageNo());
		System.out.println("끝 페이지 링크 번호 : " + pageMaker.getEndPageNo());

		request.setAttribute("pageMaker", pageMaker);
		RequestDispatcher dis = request.getRequestDispatcher(path);
		dis.forward(request, response);

	} // end list()

	// TODO : register.jsp 페이지 호출
	private void registerGET(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		// 로그인 세션 체크
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		
		if(memberId != null) { // 로그인 상태
			System.out.println("registerGET()");
			String path = BOARD_URL + REGISTER + EXTENSION;
			RequestDispatcher dis = request.getRequestDispatcher(path);
			dis.forward(request, response);
		} else { // 로그아웃 상태
			// 쿠키에 targetURL 정보를 저장
			// targetURL = register.do
			// Cookie urlCookie = new Cookie("targetURL", REGISTER + SERVER_EXTENSION);
			// response.addCookie(urlCookie);
			// 로그인 페이지로 이동
			 response.sendRedirect("login.go?targetURL="+ REGISTER + SERVER_EXTENSION);
		}
		
		
	} // end registerGET()

	// TODO : register.jsp form으로 전송된 데이터를 DB 테이블에 등록
	// TODO : index.jsp로 이동
	private void registerPOST(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("registerPOST()");
		String memberid = request.getParameter("memberid");
		String boardtitle = request.getParameter("boardtitle");
		String boardcontent = request.getParameter("boardcontent");

		BoardVO board = new BoardVO(0, boardtitle, boardcontent, memberid, null);

		int result = dao.insert(board);
		System.out.println(result);
		response.sendRedirect("index.jsp");

	} // end registerPOST()

	// TODO : DB 테이블에서 상세 조회 데이터를 가져와서, detail.jsp로 전송 및 페이지 출력
	private void detail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("detail()");
		String path = BOARD_URL + DETAIL + EXTENSION;

		int boardId = Integer.parseInt(request.getParameter("boardId"));

		System.out.println(boardId);
		BoardVO boardvo = dao.select(boardId);

		request.setAttribute("boardvo", boardvo);
		RequestDispatcher dis = request.getRequestDispatcher(path);
		dis.forward(request, response);
	} // end detail()

	// TODO : DB 테이블에서 상세 조회한 게시글 데이터를 전송하고, update.jsp 페이지로 호출
	private void updateGET(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("updateGET()");
		String path = BOARD_URL + UPDATE + EXTENSION;

		int boardId = Integer.parseInt(request.getParameter("boardId"));

		System.out.println(boardId);
		BoardVO boardvo = dao.select(boardId);

		request.setAttribute("boardvo", boardvo);
		RequestDispatcher dis = request.getRequestDispatcher(path);
		dis.forward(request, response);
	} // end updateGET()

	// TODO : update.jsp에서 전송된 수정할 데이터를 DB로 전송하여 테이블 수정 수행
	// TODO : 수정이 완료되면, detail.jsp로 이동(이동할 때 어떤 값을 전송해야 할걸?ㅎ)
	private void updatePOST(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("updatePOST()");

		String path = DETAIL + SERVER_EXTENSION;

		int boardId = Integer.parseInt(request.getParameter("boardId"));

		String boardtitle = request.getParameter("boardtitle");
		String boardcontent = request.getParameter("boardcontent");
		String memberId = request.getParameter("memberId");

		BoardVO board = new BoardVO(boardId, boardtitle, boardcontent, memberId, null);

		System.out.println(boardId);
		int result = dao.update(board);

		if (result == 1) {
			System.out.println(result);
			request.setAttribute("boardId", boardId);
			RequestDispatcher dis = request.getRequestDispatcher(path);
			dis.forward(request, response);
		}

	} // end updatePOST()

	// TODO : 게시글 번호를 전송받아서, DB 테이블에서 데이터 삭제
	// TODO : 삭제가 완료되면, index.jap로 이동
	private void deletePOST(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		System.out.println("deletePOST()");
		String path = MAIN + EXTENSION;

		int boardId = Integer.parseInt(request.getParameter("boardId"));

		int result = dao.delete(boardId);
		if (result == 1) {
			RequestDispatcher dis = request.getRequestDispatcher(path);
			dis.forward(request, response);
		}
	} // end deletePOST()

}
