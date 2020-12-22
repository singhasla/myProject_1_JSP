<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OpenOffice | Project</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");

	if(id==null){
		response.sendRedirect("../Page_login_join.jsp");
	}
	
	request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="bBean" class="board.BoardBean"/>
<jsp:setProperty property="*" name="bBean"/>
	
<%
	BoardDAO dao = new BoardDAO();
	int DBnum = dao.getBoardCount()+1;

    // 파일이 저장되는 경로
    String root = request.getSession().getServletContext().getRealPath("/");
    String savePath = root + "temp"; // 저장할 디렉토리 (절대경로)
	System.out.println(savePath);
    int size = 1024 * 1024 * 10; // 10MB 저장가능한 파일 크기
    String filename = ""; // 업로드 한 파일의 이름(이름이 변경될수 있다)
    String originalFile = ""; // 이름이 변경되기 전 실제 파일 이름

    // 실제로 파일 업로드하는 과정
    try{
        MultipartRequest multi = new MultipartRequest(request, savePath, size, "UTF-8", new DefaultFileRenamePolicy());

        Enumeration files = multi.getFileNames();
        String str = (String)files.nextElement(); // 파일 이름을 받아와 string으로 저장

        filename = multi.getFilesystemName(str); // 업로드 된 파일 이름 가져옴
        originalFile = multi.getOriginalFileName(str); // 원래의 파일이름 가져옴

        
        //DB
        bBean.setName(multi.getParameter("name"));
        bBean.setPasswd(multi.getParameter("passwd"));
        bBean.setSubject(multi.getParameter("subject"));
        bBean.setContent(multi.getParameter("content"));
        bBean.setDate(new Timestamp(System.currentTimeMillis()));
		bBean.setIp(request.getRemoteAddr());
		bBean.setFile(filename);
        
		BoardDAO bdao = new BoardDAO();
		bdao.insertBoard(bBean);
		
		response.sendRedirect("content.jsp?num="+DBnum+"&pageNum=1");
        
    } catch (Exception e) {
    	e.printStackTrace();
    }
%>

</body>
</html>