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
		// TODO : 세션을 이용"userid님, 환영합니다.라고 화면에 출력"
		
		// TODO : 회원 정보 보기 버튼 생성
		// TODO : 로그아웃 버튼 생성
		String userid = (String) session.getAttribute("userid");
		if(userid == null){
			userid = request.getParameter("userid");
		if(userid != null) {
            out.println("<script>alert('" + userid + "님 환영합니다!!');</script>");
            
        } else {
            out.println("<script>alert('로그인 해주세요!!'); location.href='login.jsp';</script>");
        }
		
		}
		
	%>
	
	<!-- location.href로 이동하면 servlet에서 doGet()을 호출
	  		ㄴ GET방식으로 동작 
	 -->
	 
	 
	
	<button onclick="location.href='select.do'">회원정보</button>
	<button onclick="logoutForm()">로그아웃</button>
	
	<script>
	function logoutForm() {
		if(confirm('로그아웃 하시겠습니까?')) { 
			location.href="logout.do";
		} else {
			location.href="loginResult.jsp"; 
		}
      
    }
    
	</script>
</body>
</html>