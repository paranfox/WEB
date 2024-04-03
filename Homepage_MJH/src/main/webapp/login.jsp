<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%
		// TODO : <a> 태그를 이용하여 memberRegister.jsp 이동 링크 생성
		// TODO : 로그인 form 생성. sction="loginAuth.do" method="post"
	%>
	
	<h2>로그인하기</h2>
	<form action="loginAuth.do" method="post">
    <label for="userid">사용자 ID:</label>
    <input type="text" id="userid" name="userid" required><br><br>
    
    <label for="password">비밀번호:</label>
    <input type="password" id="password" name="password" required><br><br>
    
    <input type="submit" value="로그인">
    <a href="memberRegister.jsp">회원가입</a>
	</form>
</body>
</html>