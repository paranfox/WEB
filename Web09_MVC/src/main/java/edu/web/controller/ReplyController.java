package edu.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import edu.web.domain.ReplyVO;
import edu.web.persistence.ReplyDAO;
import edu.web.persistence.ReplyDAOImple;

@WebServlet("/replies/*")
public class ReplyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReplyDAO dao;
	
	public ReplyController() {
		dao = ReplyDAOImple.getInstance();
    }

	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		String requsetURI = req.getRequestURI();
		System.out.println(requsetURI);
		
		if(requsetURI.contains("add")) {
			System.out.println("add 호출 확인");
			replyAdd(req, resp);
		}
		
	}

	// ajax 통신으로 댓글 JSON 데이터를 전송받아,
	// DB에 저장하고, 저장에 성공하면 success 메세지를 다시 돌려줌
	private void replyAdd(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String obj = req.getParameter("obj");
		System.out.println(obj);
		
		JSONParser parser = new JSONParser();
		
		try {
			JSONObject jsonObject = (JSONObject) parser.parse(obj);
			
			int boardId = Integer.parseInt((String) jsonObject.get("boardId"));
			String memberId = (String) jsonObject.get("memberId");
			String replyContent = (String) jsonObject.get("replyContent");
			
			ReplyVO vo = new ReplyVO(0, boardId, memberId, replyContent, null);
			System.out.println(vo);
			
			int result = dao.insert(vo);
			if(result == 1) {
				resp.getWriter().append("success");
			}
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
