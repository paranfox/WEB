<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session Test</title>
</head>
<body>
	<%
		String userId = (String) session.getAttribute("userId");
	
	%>
	
	<h2><%=userId %>님, 환영합니다.</h2>
	
	
	
	
</body>
</html>