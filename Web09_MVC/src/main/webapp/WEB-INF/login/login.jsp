<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js">
</script>
<title>Insert title here</title>
</head>
<body>
	<form action="" method="post" id="loginboardForm">
		<input type="hidden" name="boardId" id="boardId" value="${boardId }"> 
		<input type="hidden" name="targetURL" id="targetURL" value="${targetURL }"> 
		id : <input type="text" name="memberId" required autofocus> 
		pw : <input type="text" name="password" required><br>
		<br> <input type="button" value="확인" id="check">
	</form>

	<script type="text/javascript">
		$(document).ready(function() {
			
			$('#check').click(function() {
				console.log(this);
				
				if("${boardId }" == "") {
					loginForm();
				} else {
					boardForm();
				}
				
			}); // end #replies.on()
		}); // end document 

		function loginForm() {
			let form = document.getElementById("loginboardForm");
			form.method = "POST";
			form.action = "login.go";
			form.submit();
		}
		
		function boardForm() {
			let form = document.getElementById("loginboardForm");
			form.method = "POST";
			form.action = "board.go";
			form.submit();
		}
	</script>
</body>
</html>