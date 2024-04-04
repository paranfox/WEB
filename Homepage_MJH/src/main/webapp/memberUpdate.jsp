<%@page import="edu.web.member.MemberVO"%>
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
	String  boomServer = null;
	for (String interests : interest) {
		if(interests.equals("서버 개발")) {
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
		<input type="checkbox" id="interest2" name="interest" value="서버 개발" <%=develServer %>>
    	<label for="interest2">서버 개발</label><br>
		<input type="checkbox" id="interest2" name="interest" value="서버 폭팔" <%=boomServer %>>
    	<label for="interest2">서버 폭팔</label><br>
    
    
		<label for="phone">전화번호:</label> <input type="text" id="phone"
			name="phone" value="<%=phone%>"> <br> <label
			for="introduce">자기 소개:</label>
		<textarea id="introduce" name="introduce"><%=introduce %></textarea> <br>
		<input type="button" onclick="location.href='select.do'" value="뒤로가기">
		<input type="submit" value="수정 확인">
	</form>



</body>
</html>