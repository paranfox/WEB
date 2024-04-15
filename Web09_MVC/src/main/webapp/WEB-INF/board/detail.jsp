<%@page import="edu.web.domain.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js">
</script>
<%
BoardVO boardvo = (BoardVO) request.getAttribute("boardvo");
%>
<title>게시글 상세조회</title>
</head>
<body>
<form id="updateForm" action="" method="post">
<input type="hidden" id="boardId" name="boardId" value="${boardvo.boardId }">
	<h2>게시글 상세조회 <button onclick="listForm()">뒤로가기</button></h2>
	<label for="memberId">게시글 작성자:</label>
		<input type="text" name="memberId" value="${boardvo.memberId }" readonly required> <br> 
	<label for="boardtitle">게시글 제목:</label>
		<input type="text" id="boardtitle" name="boardtitle" value="${boardvo.boardTitle }" readonly required> <br> 
		<label for="boardcontent">게시글 내용:</label><br>
		<textarea id="boardcontent" name="boardcontent" rows="4" cols="50" readonly>${boardvo.boardContent }</textarea>
		<br> 
		<label for="boardDate">게시및수정 된 날짜:</label><br>
		<input type="text" id="boardDate" name="boardDate" value="${boardvo.boardDateCreated }" readonly="readonly" required> <br> 
		<br>
		<button onclick="updateForm()">게시글 수정하기</button> 
		<button onclick="deleteForm()">게시글 삭제하기</button>
		</form> <br>
		
		<div style="text-align: center;">
			<input type="text" id="memberId">
			<input type="text" id="replyContent">
			<button id="btnAdd">작성</button>
		</div>
		<hr>
		<div style="text-align: center;">
			<div id="replies"></div>
		</div>
		
		<div>
			<br><br><br><br><br><br><br><br>
		</div>
		
		<script type="text/javascript">
			$(document).ready(function(){
				$('#btnAdd').click(function(){
					let boardId = $('#boardId').val(); // 게시판 번호 데이터
					let memberId = $('#memberId').val(); // 작성자 데이터
					let replyContent = $('#replyContent').val(); // 댓글 내용
					let obj = {
							'boardId' : boardId,
							'memberId' : memberId,
							'replyContent' : replyContent
					};
					console.log(obj);
					
					// $.ajax로 송수신
					$.ajax({
						type : 'POST',
						url : 'replies/add',
						data : {'obj' : JSON.stringify(obj)}, // JSON으로 변환
						success : function(result) {
							console.log(result);
						}
					});
				});
				
				
				
				
				
				
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
			});
		
		
		
		</script>
</body>
</html>