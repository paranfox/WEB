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
<title>게시글 상세조회</title>
</head>
<body>
<form id="updateForm" action="" method="post">
<input type="hidden" id="boardId" name="boardId" value="<%=boardvo.getBoardId() %>">
	<h2>게시글 상세조회 <button onclick="listForm()">뒤로가기</button></h2>
	<label for="memberId">게시글 작성자:</label>
		<input type="text" id="memberId" name="memberId" value="<%=boardvo.getMemberId() %>" required> <br> 
	<label for="boardtitle">게시글 제목:</label>
		<input type="text" id="boardtitle" name="boardtitle" value="<%=boardvo.getBoardTitle() %>" required> <br> 
		<label for="boardcontent">게시글 내용:</label><br>
		<textarea id="boardcontent" name="boardcontent" rows="4" cols="50"><%=boardvo.getBoardContent() %></textarea>
		<br> 
		<label for="boardDate">게시및수정 된 날짜:</label><br>
		<input type="text" id="boardDate" name="boardDate" value="<%=boardvo.getBoardDateCreated() %>" required> <br> 
		<br>
		<button onclick="updateForm()">게시글 수정하기</button> 
		<button onclick="deleteForm()">게시글 삭제하기</button>
		</form> <br>
		
		
		<script type="text/javascript">
		function listForm() {
			let form = document.getElementById("updateForm");
			form.method = "GET";
			form.action = "list.do";
			form.submit();
		}
		
		function updateForm() {
			let form = document.getElementById("updateForm");
			form.method = "GET";
			form.action = "update.do";
			form.submit();
		}

		function deleteForm() {
			if (confirm('정말로 삭제 하시겠습니까?')) {
				let form = document.getElementById("updateForm");
				form.method = "POST";
				form.action = "delete.do";
				form.submit();
			} else {
				form.method = "GET";
				location.href = "detail.do";
			}
		}
		</script>
</body>
</html>