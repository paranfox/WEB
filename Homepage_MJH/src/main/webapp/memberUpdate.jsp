<%@page import="edu.web.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<style>
body {
	background-color: black; /* 배경색을 검은색으로 설정 */
	color: white; /* 글자색을 흰색으로 설정 */
	font-family: Arial, sans-serif; /* 폰트 설정 */
}

h1 {
	color: #007bff; /* 제목 색상을 파란색으로 설정 */
}

form {
	background-color: rgba(255, 255, 255, 0.2); /* 투명한 흰색 배경색 설정 */
	padding: 20px;
	border-radius: 10px; /* 모서리를 둥글게 설정 */
	width: 400px;
	margin: 0 auto; /* 가운데 정렬 */
}

label {
	display: block;
	margin-bottom: 10px;
}

input[type="text"], input[type="password"], input[type="email"], input[type="tel"],
	textarea {
	width: 90%;
	padding: 10px;
	margin-bottom: 15px;
	border: none;
	border-radius: 5px;
	background-color: rgba(255, 255, 255, 0.8); /* 투명한 흰색 배경색 설정 */
}

input[type="checkbox"] {
	margin-bottom: 15px;
}

input[type="button"], input[type="submit"] {
	width: 49%;
	padding: 10px;
	border: none;
	border-radius: 5px;
	background-color: #007bff; /* 파란색 배경색 설정 */
	color: white;
	cursor: pointer;
}

input[type="button"]:hover, input[type="submit"]:hover {
	background-color: #0056b3; /* 마우스를 올렸을 때 색상 변경 */
}
</style>
</head>
<body>
	<%
	// TODO : 로그인된 사용자 아이디를 저장
	// TODO : form action="update.do" method="post"생성
	// TODO : userid를 제외한 모든 정보 수정 가능하게 input 태그 작성
	//        userid는 읽기만 가능하도록 input 태그 생성
	String id = (String) session.getAttribute("userid");

	if (id == null) {
		response.sendRedirect("login.jsp");
	}
	String userid = request.getParameter("userid");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String emailAgree = request.getParameter("emailAgree");
	String[] interest = request.getParameterValues("interest");
	String phone = request.getParameter("phone");
	String introduce = request.getParameter("introduce");
	if (password == "") {
		out.print("<script>alert('페스워드를 입력해 주세요'); location.href='memberUpdate.jsp'</script>");
		return;

	}
	// 서버측 입력값 검증
	String checked = "checked";
	String develServer = null;
	String boomServer = null;
	for (String interests : interest) {
		if (interests.equals("서버 개발")) {
			develServer = "checked";
		} else if (interests.equals("서버 폭팔")) {
			boomServer = "checked";
		}
	}
	%>

	<h1>회원 정보 수정</h1>
	<form action="update.do" method="post">
		<label for="userid">사용자 아이디:</label> <input type="text" id="userid"
			name="userid" value="<%=userid%>" readonly> <br> <label
			for="password">비밀번호:</label> <input type="password" id="password"
			name="password" value="<%=password%>"> <br> <label
			for="email">이메일:</label> <input type="email" id="email" name="email"
			value="<%=email%>"> <br> <label for="emailAgree">이메일
			동의:</label>
		<%
		if (emailAgree.equals("agree")) {
		%>
		<input type="checkbox" id="emailAgree" name="emailAgree" value="agree"
			checked="checked"> <br>
		<%
		} else {
		%>
		<input type="checkbox" id="emailAgree" name="emailAgree" value="agree">
		<br>
		<%
		}
		%>

		<label for="interest">관심 분야:</label><br> 
		<label for="interest2">서버 개발 <input type="checkbox"
			id="interest2" name="interest" value="서버 개발" <%=develServer%>></label><br> 
		<label for="interest2">서버 폭팔 <input type="checkbox"
			id="interest2" name="interest" value="서버 폭팔" <%=boomServer%>></label><br>
			<label for="phone">전화번호:</label>
		<input type="text" id="phone" name="phone" value="<%=phone%>">
		<br> <label for="introduce">자기 소개:</label>
		<textarea id="introduce" name="introduce"><%=introduce%></textarea>
		<br> <input type="button" onclick="location.href='select.do'"
			value="뒤로가기"> <input type="submit" value="수정 확인">
	</form>
</body>
</html>
