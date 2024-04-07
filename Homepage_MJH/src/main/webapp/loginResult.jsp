<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 결과</title>
<style>
body {
	background-color: black; /* 배경색을 검은색으로 설정 */
	color: white; /* 글자색을 흰색으로 설정 */
}

button {
	padding: 10px 20px;
	margin: 10px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

button:hover {
	background-color: rgba(255, 255, 255, 0.1);
	/* 마우스를 올렸을 때 투명한 흰색 배경색 설정 */
}
</style>
</head>
<body>
	<%
	// TODO : 세션을 이용"userid님, 환영합니다.라고 화면에 출력"

	// TODO : 회원 정보 보기 버튼 생성
	// TODO : 로그아웃 버튼 생성
	String userid = (String) session.getAttribute("userid");
	if (userid == null) {
		userid = request.getParameter("userid");
		if (userid != null) {
			out.println("<script>alert('" + userid + "님 환영합니다!!');</script>");
		} else {
			out.println("<script>alert('로그인 해주세요!!'); location.href='login.jsp';</script>");
		}
	}
	%>

	
	
	<button onclick="location.href='select.do'">회원정보</button>
	<button onclick="logoutForm()">로그아웃</button>

	<script>
		function logoutForm() {
			if (confirm('로그아웃 하시겠습니까?')) {
				location.href = "logout.do";
			} else {
				location.href = "loginResult.jsp";
			}
		}
	</script>
</body>
</html>
