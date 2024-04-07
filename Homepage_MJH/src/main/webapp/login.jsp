<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
body {
	background-color: black; /* 배경색을 검은색으로 설정 */
	color: white; /* 글자색을 흰색으로 설정 */
}

form {
	background-color: rgba(255, 255, 255, 0.2); /* 투명한 흰색 배경색 설정 */
	padding: 20px;
	border-radius: 10px; /* 모서리를 둥글게 설정 */
	width: 300px;
	margin: 0 auto; /* 가운데 정렬 */
}

label {
	display: block;
	margin-bottom: 10px;
}

input[type="text"], input[type="password"], input[type="submit"] {
	width: 90%;
	padding: 10px;
	margin-bottom: 15px;
	border: none;
	border-radius: 5px;
	background-color: rgba(255, 255, 255, 0.8); /* 투명한 흰색 배경색 설정 */
}

input[type="submit"] {
	background-color: #007bff; /* 파란색 배경색 설정 */
	color: white;
	cursor: pointer;
}

a {
	color: #007bff; /* 파란색 링크색 설정 */
	text-decoration: none;
}
</style>
</head>
<body>
	<%
	//TODO : <a> 태그를 이용하여 memberRegister.jsp 이동 링크 생성
	// TODO : 로그인 form 생성. sction="loginAuth.do" method="post"
	%>
	<h2>로그인하기</h2>
	<form action="loginAuth.do" method="post">
		<label for="userid">사용자 ID:</label> <input type="text" id="userid"
			name="userid" required><br> <br> <label
			for="password">비밀번호:</label> <input type="password" id="password"
			name="password" required><br> <br> <input
			type="submit" value="로그인"><br> <a href="memberRegister.jsp">회원가입</a>
	</form>
</body>
</html>
