<%@page import="web.ch15.board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 조회</title>
</head>
<body>
	<%
		// request 객체에서 getAttribute를 이용하여 board 데이터 참조
		 BoardBean board = (BoardBean) request.getAttribute("board"); // 모든 자식들의 부모는 Bean그래서 형변환함
	%>
	
	<p>번호 : <%=board.getNo() %></p>
	<p>제목 : <%=board.getTitle() %></p>
	<p>작성자 : <%=board.getWriter() %></p>
	<p>내용 : <%=board.getContent() %></p>
	<p>작성일 : <%=board.getRegDate() %></p>
	
	
</body>
</html>