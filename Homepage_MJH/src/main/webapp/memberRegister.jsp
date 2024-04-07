<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<style>
body {
	background-color: black; /* 배경색을 검은색으로 설정 */
	color: white; /* 글자색을 흰색으로 설정 */
	font-family: Arial, sans-serif; /* 폰트 설정 */
}

h2 {
	color: #007bff; /* 제목 색상을 파란색으로 설정 */
}

form {
	background-color: rgba(255, 255, 255, 0.2); /* 투명한 흰색 배경색 설정 */
	padding: 20px;
	border-radius: 10px; /* 모서리를 둥글게 설정 */
	width: 400px;
	margin: 0 auto; /* 가운데 정렬 */
}

label {
	display: block;
	margin-bottom: 10px;
}

input[type="text"], input[type="password"], input[type="email"], input[type="tel"],
	textarea {
	width: 90%;
	padding: 10px;
	margin-bottom: 15px;
	border: none;
	border-radius: 5px;
	background-color: rgba(255, 255, 255, 0.8); /* 투명한 흰색 배경색 설정 */
}

input[type="checkbox"] {
	margin-bottom: 15px;
}

input[type="submit"] {
	width: 90%;
	padding: 10px;
	border: none;
	border-radius: 5px;
	background-color: #007bff; /* 파란색 배경색 설정 */
	color: white;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #0056b3; /* 마우스를 올렸을 때 색상 변경 */
}
</style>
</head>
<body>
	<%
	//TODO : 회원 가입 form 생성. action="register.do" method="post"
	%>
	<h2>회원 가입하기</h2>
	<form action="register.do" method="post">
		<label for="userid">사용자 ID:</label> <input type="text" id="userid"
			name="userid" required><br> <label for="password">비밀번호:</label>
		<input type="password" id="password" name="password" required><br>

		<label for="email">이메일:</label> <input type="email" id="email"
			name="email" required><br> <label for="emailAgree">이메일
			수신 동의:</label> <input type="checkbox" id="emailAgree" name="emailAgree"
			value="agree"><br> <label for="interest">관심 분야:</label><br>
		
		<label for="interest1">서버 개발 <input type="checkbox" id="interest1" name="interest" value="서버 개발"></label><br>  <label
			for="interest2">서버 폭팔 <input type="checkbox"
			id="interest2" name="interest" value="서버 폭팔"></label><br> <label for="phone">전화번호:</label>
		<input type="tel" id="phone" name="phone"><br> <label
			for="introduce">자기 소개:</label><br>
		<textarea id="introduce" name="introduce" rows="4" cols="50"></textarea>
		<br> <input type="submit" value="제출">
	</form>
</body>
</html>
