<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%for(int i = 0; i < 600; i++) { %>
		<a href="test.html">이동을합니다.</a>
		<p>1</p><br>
		
	<% }%>
	
	
	<script type="text/javascript">
	var scrollPositions = {};

	// 페이지 로드될 때 스크롤 위치를 저장합니다.
	window.onload = function() {
	  var currentPage = window.location.href;
	  scrollPositions[currentPage] = window.scrollY;
	};

	// F5를 눌렀을 때 스크롤 위치를 저장합니다.
	document.addEventListener("keydown", function(event) {
	  if (event.keyCode === 116) { // F5 키의 keyCode는 116입니다.
	    var currentPage = window.location.href;
	    scrollPositions[currentPage] = window.scrollY;
	  }
	});

	// 페이지 새로 고침 후 저장된 스크롤 위치로 이동합니다.
	window.onbeforeunload = function() {
	  var currentPage = window.location.href;
	  scrollPositions[currentPage] = window.scrollY;
	};

	// 뒤로가기 이벤트를 감지하여 이전 페이지의 스크롤 위치로 이동합니다.
	window.addEventListener('popstate', function(event) {
	  var currentPage = window.location.href;
	  if (scrollPositions[currentPage] !== undefined) {
	    setTimeout(function() {
	      window.scrollTo(0, scrollPositions[currentPage]);
	    }, 0);
	  }
	});


	</script>
</body>
</html>