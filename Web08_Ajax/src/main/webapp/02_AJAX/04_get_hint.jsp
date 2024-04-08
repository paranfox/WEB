<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	전송된 데이터가
	만약 'a'로 시작하면 "apple"
		'b'로 시작하면 "banana"
		'c'로 시작하면 "coconut"
	그게 아니면 "not fruits"를 출력해라!
 -->
<%String str = request.getParameter("txt");
	String result;
if(str.charAt(0) == 'a') {
	result = "apple";
} else if(str.charAt(0) == 'b') {
	result = "banana";
} else if(str.charAt(0) == 'c') {
	result = "coconut";
} else {
	result = "not fruits";
}

%> 
<%=result %>
 	<%-- <c:choose>
	  	<c:when test="${param.txt == 'a' }">
	  		<p>apple</p>
	  	</c:when>
	  	<c:when test="${param.txt == 'b' }">
	  		<p>banana</p>
	  	</c:when>
	  	<c:when test="${param.txt == 'c' }">
	  		<p>coconut</p>
	  	</c:when>
	  	<c:otherwise>
	  		<p>not fruits</p>
	  	</c:otherwise>
	  </c:choose> --%>
 <%-- <%if(param.method == "a") { %>
<p>apple</p>
<%} else if(param.method == "b") { %>
<p>banana</p>
<%} else if(param.method == "c") { %>
<p>coconut</p>
<%} else {%>
<P>not fruits</P>
<% } %> --%>