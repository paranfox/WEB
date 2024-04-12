<%@page import="edu.web.domain.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
BoardVO boardvo = (BoardVO) request.getAttribute("boardvo");
%>
<title>게시글 수정</title>
</head>
<body>
	<form action="update.do" method="post">
	<input type="hidden" name="boardId" value="<%=boardvo.getBoardId() %>">
	<input type="hidden" name="memberId" value="<%=boardvo.getMemberId() %>">
	<h2>게시글 수정 <button onclick="location.href='detail.do?boardId=<%=boardvo.getBoardId() %>'">뒤로가기</button></h2>
	<label for="boardtitle">게시글 제목:</label>
		<input type="text" id="boardtitle" name="boardtitle" placeholder="<%=boardvo.getBoardTitle() %>"
		 required> <br> 
		<label for="boardcontent">게시글 내용:</label><br>
		<textarea id="boardcontent" name="boardcontent" rows="4" cols="50" placeholder="<%=boardvo.getBoardContent() %>"></textarea>
		<br> 
		<input type="submit" value="게시글 수정">
		</form>
</body>
</html>