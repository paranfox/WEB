<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Hit count</title>
</head>
<body>
	<%
		Integer hitCount =  // 형 변환도 int는 안된다 Integer로 해주어야 한다.
			(Integer) application.getAttribute("hitCounter"); // 처음에는 null로 만들어진다 0이 아니다
	
		if(hitCount == null || hitCount == 0) {
			out.println("첫 방문을 환영합니다.");
			hitCount = 1;
		} else {
			out.println(" 재방문을 환영합니다.");
			hitCount += 1;
		}
		application.setAttribute("hitCounter",hitCount); // 여기에 저장이 
		// 시간이 남으면 만드는 게 좋다.
	%>
	
	<p>전체 방문 횟수 : <%=hitCount %></p>
	
</body>
</html>