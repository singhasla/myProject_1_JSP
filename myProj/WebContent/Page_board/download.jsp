<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.*"%>

<% 
	//content.jsp에서 요청받아옴
	String root = request.getSession().getServletContext().getRealPath("/");
    String filePath = root + "temp";  // 다운로드(업로드)절대경로.
	String filename = request.getParameter("fileName");
	String sFilePath = filePath +"\\"+ filename;
	
	System.out.println(sFilePath);
    
    File oFile = new File(sFilePath);
    byte[] b = new byte[10*1024*1024];
    
    FileInputStream in = new FileInputStream(oFile);

    String sMimeType = getServletContext().getMimeType(sFilePath);
    if(sMimeType == null){
    	sMimeType="application/octec-stream";
    }
    
  	//업로드 파일 제목 깨짐 방지
    String sEncoding = URLEncoder.encode(filename,"utf-8");
    
  	
    response.setContentType(sMimeType);
    response.setHeader("Content-Disposition", "attachment;filename="+sEncoding);
    
    //브라우저에 쓰기
    ServletOutputStream os = response.getOutputStream();
    
    int numRead = 0;
    
    while((numRead=in.read(b,0,b.length))!=-1){
    	os.write(b,0,numRead);
    }

    os.flush();
    if (os != null)	os.close();
    if (in != null) in.close();
%>


