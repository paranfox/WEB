<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="edu.web.domain.BoardVO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 목록</title>
</head>
<body>
    <h1>게시판 목록 &nbsp; <button onclick="location.href='register.do'">글 작성하기</button></h1>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <% 
            List<BoardVO> boardList = (List<BoardVO>) request.getAttribute("boardList");
            if (boardList != null) {
                for (BoardVO board : boardList) {
            %>
                <tr>
                    <td><%= board.getBoardId() %></td>
                    <td><a href="detail.do?boardId=<%=board.getBoardId() %>"> <%=board.getBoardTitle() %> </a></td>
                    <td><%= board.getMemberId() %></td>
                    <td><%= board.getBoardDateCreated() %></td>
                </tr>
            <% 
                }
            }
            %>
        </tbody>
    </table>
    
</body>
</html>
