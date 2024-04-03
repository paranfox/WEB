<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Multiple Images Display</title>
</head>
<body>
    <%
        List<String> fileNames = (List<String>) session.getAttribute("fileNames");
    %>
    
    <% if(fileNames != null && !fileNames.isEmpty()) { 
         for(String fileName : fileNames) { 
        	 String fileExtension = fileName.substring(fileName.lastIndexOf(".") + 1);
             if (fileExtension.equalsIgnoreCase("mp4")) { %>
         <video width="320" height="240" controls loop autoplay>
                    <source src="../images/<%=fileName %>" type="video/mp4">
                </video>
                <a href="../images/<%=fileName %>">링크</a>
                <br>
        <% } else { %>
                
            <img alt="이미지" src="../images/<%=fileName %>" width="200" height="200">
            <a href="../images/<%=fileName %>">링크</a>
            <br>
    <% }
     }
    }else {
        out.print("<p>No images uploaded.</p>");
     } %>
</body>
</html>
