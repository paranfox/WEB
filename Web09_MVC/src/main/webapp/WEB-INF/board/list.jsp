<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="edu.web.domain.BoardVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<style type="text/css">
table, th, td {
   border-style : solid;
   border-width : 1px;
   text-align : center;
}

ul {
   list-style-type : none;
}

li {
   display : inline-block;
}
</style>
<head>
    <title>게시판 목록</title>
</head>
<body>
    <h1>게시판 목록 &nbsp; <button onclick="location.href='register.do'">글 작성하기</button></h1>
    <c:if test="${empty sessionScope.memberId }">
    	<a href="login.go"><input type="button" value="로그인"></a>
    </c:if>
    <c:if test="${not empty sessionScope.memberId }">
    	 <a href="logout.go"><input type="button" value="로그아웃"></a>
    </c:if>
    
    <a href="register.do"><input type="button" value="글 작성"></a>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="vo" items="${boardList }">
        	<tr>
        		<td>${vo.boardId }</td>
        		<td><a href="detail.do?boardId=${vo.boardId }">${vo.boardTitle }</a></td>
        		<td>${vo.memberId }</td>
        		<td>${vo.boardDateCreated }</td>
        	</tr>
        </c:forEach>
           <%--  <% 
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
            %> --%>
        </tbody>
    </table>
    
    <ul>
    <c:if test="${pageMaker.hasPrev }">
    	<li><a href="list.do?page=${pageMaker.startPageNo - 1 }">이전</a></li>
    </c:if>
    	<c:forEach begin="${pageMaker.startPageNo }" end="${pageMaker.endPageNo }"
    		var="num">
	    	<li><a href="list.do?page=${num }">${num }</a></li>
    	</c:forEach>
    <c:if test="${pageMaker.hasNext }">
    	<li><a href="list.do?page=${pageMaker.endPageNo + 1 }">다음</a></li>
    </c:if>
    </ul>
    
</body>
</html>
