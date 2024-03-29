<%@page import="java.util.Date"%>
<%@page import="edu.web.homework.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
table {
	font-family: arial, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

td, th {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}
</style>
<title>HW1</title>
</head>
<body>
	<%
	ArrayList<BoardVO> list = new ArrayList<>();
	for (int i = 0; i < 5; i++) {
		BoardVO board = new BoardVO(i, "제목 ", "mok ", new Date());
		list.add(board);
	}

	// 게시글 데이터 5개를 list에 추가
	%>

	<!-- table을 생성하여 5개의 게시글을 출력 -->

	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (int i = 0; i < list.size(); i++) {
			%>
			<tr>
				<td><%=list.get(i).getBoardId()%></td>
				<td><%=list.get(i).getBoardTitle()%></td>
				<td><%=list.get(i).getUserid()%></td>
				<td><%=list.get(i).getBoardRegDate()%></td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>


</body>
</html>