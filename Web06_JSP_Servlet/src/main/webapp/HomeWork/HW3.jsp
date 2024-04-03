<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 정보 전송 페이지</title>
</head>
<body>
	<%--
	1. 로그인 정보 전송 페이지(HW3.jsp)
	- <form action="HW3_login_auth.jsp" method="post">
	- id, pw input 태그 생성
	
	2. 로그인 인증 페이지(HW3_login_auth.jsp)
	-전송받은 id, pw를 확인하여 id는 "test", pw는 "1234"일 경우
	id 세션을 생성(만료 시간은 자유롭게 설정)
	- 세션을 생성한 이후에 HW3_login_result.jsp 페이지로 이동
	- 페이지 이동 코드
	 ㄴ out.print("<script>location.href='HW_login_result.jsp'</script>");
	 -전송받은 id, pw가 "test", "1234"가 아닌 경우, HW3.jsp 페이지로 이동
	 
	 3. 로그인 결과 페이지(HW3_login_result.jsp)
	 -세션에서 id 값을 꺼내서 HTML 태그에 출력
	 - 만약, 로그인을 하지 않고 url로 접속할 경우 '로그인 해주세요!!'라고 alert를 띄우고
	 HW3.jsp 페이지로 이동
	  ㄴ out.print("<script>alert('로그인 해주세요!!')'</script>");
	 --%>
	 <%
	  session.invalidate(); // 세션 무효화 : 모든 세션 속성을 제거
	 %>
	<form action="HW3_login_auth.jsp" method="post">
    	id : <input type="text" name="id"><br>
    	pw : <input type="password" name="pw"><br><br>
    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button type="submit">로그인</button>
	</form>
	
</body>
</html>