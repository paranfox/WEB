<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 화면</title>
</head>
<body>

	<% 
	// 한글인코딩
	request.setCharacterEncoding("UTF-8");
	// String getParameterEncoding(String name) :
		// request는 form에서 전송된 데이터를 불러오는 parameter를 제공
		// request 객체에 Form Data가 저장되고, getParameter()로 데이터 참조
		
		// http://localhost:8080/
		// Web06_JSP_Servlet/
		// ch12/result.jsp
		// ?name=%EB%AA%A9%EC%A7%84%ED%98%81&age=20
		
		// * parameter와 attribute의 차이점
		// - parameter와 attribute는 비슷한 기능을 수행
		// - parameter는 html form 태그를 통해 전송을 수행
		// - attribute는 setAttribute를 통해 전송을 수행
		// - parameter는 String 타입만 전송 가능
		// - attribute는 Object 타입의 데이터로 전송 가능
		// - parameter는 requst 객체에만 존재하고,
		//    client에서 server로 데이터를 전송할 때 사용
		// - attribute는 주로 server 데이터를 client로 전송할 때 사용
	%>
	<!-- request 내장 객체를 이용한 데이터 출력 -->
	이름 : <%=request.getParameter("name") %><br>
	나이 : <%=request.getParameter("age") %><br>
	
	
</body>
</html>