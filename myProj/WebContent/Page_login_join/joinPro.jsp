<%@ page import="dbcp.DBConnectionMgr" %>
<%@ page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OpenOffice | Project</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<jsp:useBean id="dao" class="member.MemberDAO" />
	<jsp:useBean id="dto" class="member.MemberDTO" />
	<jsp:setProperty property="*" name="dto" />

	<%
		dao.insertMember(dto);
	
		response.sendRedirect("login.jsp");
	%>
</body>
</html>

