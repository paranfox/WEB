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
%>
	<jsp:useBean id="member" class="edu.web.homework.MemberVO" />
	<jsp:setProperty property="*" name="member" />
	<!-- 출력여부 확인 -->
	아이디 : <%=member.getUserid() %><br>
	페스워드 : <%=member.getPassword() %><br>
	이메일 : <%=member.getEmail() %><br>
	이메일 수신여부 : <%=member.getEmailAgree() %><br>
	관심사항 : <%=member.getInterestJoin() %><br>
	핸드폰 : <%=member.getPhone() %><br>
	자기소개 : <%=member.getIntroduce() %><br>
	
	
	<%-- <%= member.getInterest() == null ? "관심없음" : "관심사항 : " + String.join("<br> 관심사항 : ", member.getInterest()) %><br> --%>
	
	<%-- <% String[] interests = member.getInterest();
			if(interests == null){	 %>
			<p>관심사항 :<%= " 관심없음 "  %></p>
		<%} else {
		for(String interest: interests){ %>
		<p>관심사항 : <%= interest %></p>
				<%}} %> --%>
				
	<%-- 관심사항 : <%
	for(String interest: member.getInterest()) {
		out.println("[" + interest + "] ");
	} %> <br> --%>
	
</body>
</html>