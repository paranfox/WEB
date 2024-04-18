<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>게시글 작성하기</h2>
	<form action="register.do" method="post">
		<label for="memberid">작성자:</label>
		<input type="text" id="memberid" name="memberid" size=10 maxlength=4 value="${sessionScope.memberId }" readonly required > <br> 
		<label for="boardtitle">게시글 제목:</label>
		<input type="text" id="boardtitle" name="boardtitle" size=10 maxlength=8 required> <br> 
		<label for="boardcontent">게시글 내용:</label><br>
		<textarea id="boardcontent" name="boardcontent" rows="4" cols="50"></textarea>
		<br> 
		<input type="submit" value="제출">
	</form>

</body>
</html>