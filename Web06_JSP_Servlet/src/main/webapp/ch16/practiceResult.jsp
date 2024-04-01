<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	// practiceLogin.jsp에서 saveAgreed가 체크가 되어 있으면
	// id, pw에 대한 쿠키를 생성한다.
	// 쿠키 만료 시간은 10분으로 설정
	String agreed = request.getParameter("saveAgreed");
	if (agreed != null) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		// 파라미터 값으로 쿠키 생성
		Cookie idCookie = new Cookie("id", id);
		Cookie pwCookie = new Cookie("pw", pw);

		// 만료 시간 설정(초단위) : 24시간
		idCookie.setMaxAge(60 * 10);
		pwCookie.setMaxAge(60 * 10);

		// response.header에 쿠키추가
		response.addCookie(idCookie);
		response.addCookie(pwCookie);
		// Context Root에서 생성된 쿠키는
		// 이프로젝트에서만 사용됨
	}
	%>

	<h2>로그인 결과 화면</h2>
	<p><%=request.getParameter("id")%>님, 환영합니다.
	</p>


</body>
</html>