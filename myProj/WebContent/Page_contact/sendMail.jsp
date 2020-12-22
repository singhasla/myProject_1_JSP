<%@page import="java.util.Date"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="mail.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	// 입력값 받음
	String id = (String)session.getAttribute("id");
	String f = request.getParameter("from");
	String t = request.getParameter("to");
	String subject = request.getParameter("subject");
	String content = f +"<br>"+ request.getParameter("content");
	
	System.out.println("sendMail.jsp에서 보내는사람 = "+f);
	System.out.println("sendMail.jsp에서 받는사람 = "+t);
	
	try {
	
		MailSend mail = new MailSend(id, f, t, subject, content);
		
	} catch (Exception e) {
		e.printStackTrace();
		// 오류 발생시 뒤로 돌아가도록
		out.println("<script>alert('메일을 전송하는데 실패하였습니다.');history.back();</script>");
		return;
	}

	// 성공 시
	out.println("<script>alert('메일을 전송하였습니다.');location.href='../contact.jsp';</script>");
%>
