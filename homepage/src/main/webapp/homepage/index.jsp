<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>기본 홈페이지</title>
    <!-- Bootstrap CSS -->
    <style type="text/css">
    body {
	color: white;
}
    </style>
</head>
<body class="bg-dark">
    <!-- Header -->
    <jsp:include page="header.jsp" />
    
    <!-- Main Content -->
    <div class="container center-content">
        <div class="row">
            <!-- 프로필 사진 -->
            <div class="col-2">
                <img src="profile_picture.jpg" alt="프로필 사진" class="profile-picture">
            </div>
            <!-- 로그인 버튼 -->
            <div class="col-10 text-right">
                <button type="button" class="btn btn-primary">로그인</button>
            </div>
        </div>
        
        <!-- 글쓰기 버튼 -->
        <div class="text-center mt-3">
            <button type="button" class="btn btn-success">글쓰기</button>
        </div>
        
        <!-- 게시판 -->
        <div class="row mt-3">
            <div class="col">
                <div class="card">
                    <div class="card-body">
                        게시판 내용을 여기에 표시합니다.
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Footer -->
    <jsp:include page="footer.jsp" />
    
</body>
</html>
