<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
	2. 로그인 인증 페이지(HW3_login_auth.jsp)
	-전송받은 id, pw를 확인하여 id는 "test", pw는 "1234"일 경우
	id 세션을 생성(만료 시간은 자유롭게 설정)
	- 세션을 생성한 이후에 HW3_login_result.jsp 페이지로 이동
	- 페이지 이동 코드
	 ㄴ out.print("<script>location.href='HW_login_result.jsp'</script>");
	 -전송받은 id, pw가 "test", "1234"가 아닌 경우, HW3.jsp 페이지로 이동
-->

<%
// id, pw 가져오기
String id = request.getParameter("id");
String pw = request.getParameter("pw");

if (id == null || pw == null) {
	// 세션을 생성한 이후에 HW3_login_result.jsp 페이지로 이동
	out.print("<script>alert('비정상적인 경로로 들어왔습니다.'); location.href='HW3.jsp'</script>");
} else {
	// 아이디와 비밀번호가 "test"와 "1234"인지 확인
	if (id.equals("test") && pw.equals("1234")) {
		session.setMaxInactiveInterval(10); // 세션 만료 시간

		// id 세션을 생성(만료 시간은 자유롭게 설정)
		session.setAttribute("id", id);

		// 세션을 생성한 이후에 HW3_login_result.jsp 페이지로 이동
		out.print("<script>location.href='HW3_login_result.jsp'</script>");
	} else {
		if(id.equals("")) {
			out.print("<script>alert('아이디가 없습니다.'); location.href='HW3.jsp';</script>");
		}
		// 전송받은 id, pw가 "test", "1234"가 아닌 경우, HW3.jsp 페이지로 이동
		out.print("<script>alert('아이디랑 비번이 다릅니다.'); location.href='HW3.jsp';</script>");
	}
}
%>