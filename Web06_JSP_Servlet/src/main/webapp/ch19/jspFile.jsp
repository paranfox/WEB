<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8"); // 한글 인코딩
    String realPath = "";
    String savePath = "images";
    String type = "utf-8";
    int maxSize = 10 * 1024 * 1024; // 10MB

    // 현재 애플리케이션 정보 저장
    ServletContext context = request.getServletContext();

    realPath = context.getRealPath(savePath);

    out.println(realPath);
    out.println("<hr>");

    DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
    diskFileItemFactory.setRepository(new File(realPath)); // 저장하는 경로(저장소)
    diskFileItemFactory.setSizeThreshold(maxSize); // 넘어가면 안되는 용량(임계점)
    diskFileItemFactory.setDefaultCharset(type);

    // 업로드 핸들러
    ServletFileUpload fileupload
            = new ServletFileUpload(diskFileItemFactory);

    // request 정보를 가져와서 upload 형태에 맞게 파싱
    List<FileItem> items = fileupload.parseRequest(request);

    List<String> fileNames = new ArrayList<>(); // 여러 파일명을 저장할 리스트

    for(FileItem item : items) {
    	
        if(item.isFormField()) { // form 데이터인 경우
            out.print(item.getString() + "<br>");
        } else { // 파일인 경우
            out.print("파일명 : " + item.getName() + ", 파일크기 : " + item.getSize() + "<br>");
            String separator = File.separator;
            int index = item.getName().lastIndexOf(separator);
            String fileName = item.getName().substring(index + 1);
            File uploadFile = new File(realPath + separator + fileName);
            item.write(uploadFile); // 받은 파일을 서버에 업로드
            out.print(uploadFile + "<br>");
            fileNames.add(fileName); // 파일명을 리스트에 추가
        }
    }
 
    
    // 여러 파일을 업로드한 후에 한 번에 redirect하고 파일 정보를 세션에 저장
    session.setAttribute("fileNames", fileNames);
    response.sendRedirect("/Web06_JSP_Servlet/ch19/imageView.jsp");
%>
