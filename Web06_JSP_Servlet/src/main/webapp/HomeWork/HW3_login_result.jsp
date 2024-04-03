<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과 페이지</title>
</head>
<body>
	<!-- 
	3. 로그인 결과 페이지(HW3_login_result.jsp)
	 -세션에서 id 값을 꺼내서 HTML 태그에 출력
	 - 만약, 로그인을 하지 않고 url로 접속할 경우 '로그인 해주세요!!'라고 alert를 띄우고
	 HW3.jsp 페이지로 이동
	  ㄴ out.print("<script>alert('로그인 해주세요!!');</script>");
 -->
	<%
	// 세션에서 id 값을 꺼내서 HTML 태그에 출력
	String id = null;
	if (session != null) {
		id = (String) session.getAttribute("id");
	}

	if (id != null) {
	%>
	<h2><%=id%>님이 로그인 하셨습니다.
	</h2>
	<%
	} else {
	// 만약, 로그인을 하지 않고 url로 접속할 경우 '로그인 해주세요!!'라고 alert를 띄우고 HW3.jsp 페이지로 이동
	out.print("<script>alert('로그인 해주세요!!'); location.href='HW3.jsp';</script>");
	}
	%>
	<form action="HW3.jsp" method="post">
		<button type="submit">로그아웃</button>
	</form>
</body>
</html>