<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useBean</title>
</head>
<body>
	<%-- new 인스턴스 생성 --%>
	<jsp:useBean id="member" class="web.ch10.bean.MemberBean"></jsp:useBean>
	
	<%-- useBean 사용 방법1 --%>
	<jsp:setProperty property="userId" name="member" value="guest"/>
	
	<p>id 출력 : <jsp:getProperty property="userId" name="member"/></p>
	
	<%-- useBean 사용 방법2 : getter/setter --%>
	<% member.setEmail("test@test.com"); %>
	
	<p>email 출력 : <%= member.getEmail() %></p>
	
</body>
</html>