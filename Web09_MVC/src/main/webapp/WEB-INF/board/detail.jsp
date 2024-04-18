<%@page import="edu.web.domain.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		<c:if test="${sessionScope.memberId == boardvo.memberId }">
		<button onclick="updateForm()">게시글 수정하기</button> 
		<button onclick="deleteForm()">게시글 삭제하기</button>
		</c:if>
		</form> <br>
		
		
		<c:if test="${empty sessionScope.memberId }">
			* 댓글은 로그인이 필요한 서비스입니다.
			<a href="login.go?boardId=${boardvo.boardId }">로그인하기</a>
		</c:if>
		
		<c:if test="${not empty sessionScope.memberId }">
		${sessionScope.memberId }님, 이제 댓글을 작성할 수 있어요!
		<div style="text-align: center;">
			<input type="text" id="memberId" value="${sessionScope.memberId }" readonly>
			<input type="text" id="replyContent">
			<button id="btnAdd">작성</button>
		</div>
		</c:if>
		
		<hr>
		<div style="text-align: center;">
			<div id="replies"></div>
		</div>
		
		<div>
			<br><br><br><br><br><br><br><br>
		</div>
		
		<script type="text/javascript">
			$(document).ready(function(){
				getAllReplies(); // 함수 호출 코드 추가
				
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
							getAllReplies(); // 함수 호출 코드 추가
						}
					});
				});
				
				
				// 게시판 댓글 전체 가져오기
				function getAllReplies() {
					// 댓글을 가져오기 위해 boardId 필요
					let boardId = $('#boardId').val();
					
					// url에 boardId 전송
					let url = 'replies/all?boardId=' + boardId;
					let memberId = "${sessionScope.memberId }";
					
					// 가져올 데이터가 JSON이므로
					// getJSON으로 파싱하는게 편리함
					$.getJSON(
						url, 
						function(data) {
							// data : 서버에서 전송받은 list 데이터가 저장되어 있음.
							// getJSON()에서 json 데이터는
							// javascript object로 자동 parsing됨
							console.log(data); // data의 타입은 object
						
							let list = ''; // 댓글 데이터를 HTML에 표현할 문자열 변수
							
							// $(컬렉션).each() : 컬렉션데이터를 반복문으로 꺼내는 함수
							$(data).each(function(){
								// this : 컬렉션의 각 인덱스 데이터를 의미
								console.log(this);
							
								// String을 date 타입으로 변경
								let replyDataCreated = new Date(this.replyDateCreated);
								
								let disabled = '';
								let readonly = '';
								
								if(memberId != this.memberId) {
									disabled = 'disabled';
									readonly = 'readonly';
								}
								
								list += '<div class="reply_item">'
								+ '<pre>'
								+ '<input type="hidden" id="replyId" value="' + this.replyId +'">'
								+ this.memberId
								+ '&nbsp;&nbsp;' // 공백
								+ '<input type="text" id="replyContent" '+ readonly +' value="' + this.replyContent + '">'
								+ '&nbsp;&nbsp;'
								+ replyDataCreated
							    + '<button class="btn_update" '+disabled+'>수정</button>'
							    + '<button class="btn_delete" '+disabled+'>삭제</button>'
							    + '</pre>'
							    + '</div>';
								
							}); // end each()
							
							$('#replies').html(list);
							
						}
					); // end getJSON
					
				} // end getAllReplies()
				
				// 수정 버튼을 클릭하면 선택된 댓글 수정
				// on메서드를 사용해서 class이름이 같아도 찾아감
				$('#replies').on('click', '.reply_item .btn_update', function(){
					console.log(this);
					// 선택된 댓글의 replyId, replyContent 값을 저장
					// prevAll() : 선택된 노드 이전에 있는 모든 형제 노드를 접근
					let replyId = $(this).prevAll('#replyId').val();
					let replyContent = $(this).prevAll('#replyContent').val();
					console.log("선택된 댓글 번호 : " + replyId + ",  댓글 내용 : " + replyContent);
					
					
					// ajax로 데이터 전송하여
					// 댓글 수정 기능 수행하고
					// 수행 결과를 리턴하는 코드
					// ajax 요청
					$.ajax({
						type : 'POST',
						url : 'replies/update',
						data : {
							'replyId' : replyId,
							'replyContent' : replyContent
						},
						success : function(result) {
							console.log(result);
							getAllReplies();
						}
						
					}); // end ajax()
					
				}); // end #replies.on()
				
				// 삭제 버튼을 클릭하면 선택된 댓글 삭제
				$('#replies').on('click', '.reply_item .btn_delete', function(){
					console.log(this);
					// 선택된 댓글의 replyId, replyContent 값을 저장
					// prevAll() : 선택된 노드 이전에 있는 모든 형제 노드를 접근
					let replyId = $(this).prevAll('#replyId').val();
					
					$.ajax({
						type : 'POST',
						url : 'replies/delete',
						data : {
							'replyId' : replyId,
						},
						success : function(result) {
							console.log(result);
							getAllReplies();
						}
						
					}); // end ajax()
					
				}); // end #replies.on()
				
				
			}); // end document 
		
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