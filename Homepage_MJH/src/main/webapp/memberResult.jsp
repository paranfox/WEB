<%@page import="edu.web.member.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보</title>
</head>
<body>
	<%
		// TODO : 회원 정보 출력
		// TODO : 회원 수정 버튼 생성(경로 : memberUpdate.jsp)
		// TODO : 회원 탈퇴 버튼 생성(경로 : delete.do)
		String userid = (String) session.getAttribute("userid");
		if(userid == null){
			response.sendRedirect("login.jsp");
		} 
		MemberVO vo = (MemberVO) request.getAttribute("vo");
		
	%>
    <h1>회원 정보</h1>
    <form id="updateForm" action="" method="post">
        <label for="userid">사용자 아이디:</label>
        <input type="text" id="userid" name="userid" value="<%=vo.getUserid() %>" readonly> <br>

        <label for="password">비밀번호:</label>
        <input type="password" id="password" name="password" value="<%=vo.getPassword() %>" readonly> <br>

        <label for="email">이메일:</label>
        <input type="email" id="email" name="email" value="<%=vo.getEmail() %>" readonly> <br>

        <label for="emailAgree">이메일 동의:</label>
        <%if(vo.getEmailAgree().equals("agree")) { 	%>
        <input type="checkbox" id="emailAgree" name="emailAgree" value="<%=vo.getEmailAgree() %>"
        checked="checked" > <br>
       <% } else { %> 
       <input type="checkbox" id="emailAgree" name="emailAgree" value="<%=vo.getEmailAgree() %>"> <br>
        <% } %>
        <input type="hidden" name="emailAgree" value="<%= vo.getEmailAgree() %>">

        <label for="interest">관심 사항:</label>
        
        <% for(String interests : vo.getInterest()) { %>
        <input type="text" id="interest" name="interest" value="<%=interests %>" readonly> <br>
        	<% } %>

        <label for="phone">전화번호:</label>
        <input type="text" id="phone" name="phone" value="<%=vo.getPhone() %>" readonly> <br>

        <label for="introduce">자기 소개:</label>
        <textarea id="introduce" name="introduce" readonly><%=vo.getIntroduce() %></textarea><br>
        
        <input type="button" onclick="location.href='loginResult.jsp'" value="뒤로가기">
        <input type="button" onclick="updateForm()" value="회원정보수정">
		<input type="button" onclick="deleteForm()" value="회원 탈퇴">
    </form>
    
   <script>
	document.getElementById("emailAgree").disabled = true;
	
	function updateForm() {
		let form = document.getElementById("updateForm");
        form.action = "memberUpdate.jsp";
        form.submit();
    }
	function deleteForm() {
		if(confirm('정말로 탈퇴 하시겠습니까?')) { 
			let form = document.getElementById("updateForm");
	        form.action = "delete.do";
	        form.submit();
		} else { location.href='select.do'; };
      
    }
    
	</script>
	
</body>
</html>