<%@page import="member.MemberDAO"%>
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
	
		String id = request.getParameter("loginid");
		String pw = request.getParameter("loginpw");
		
		System.out.println(id + "," + pw);
		
		MemberDAO dao = new MemberDAO();
		
		int check = dao.checkMember(id, pw);
		//check =  1 -> 아이디, 비밀번호 동일
		//check =  0 -> 아이디 동일 , 비밀번호 틀림
		//check =  -1 -> 아이디 틀림
		
		if(check == 1){
			
			//세션영역에  입력한 아이디를  세션값으로 저장
			session.setAttribute("id", id);
			//리다이렉트 방식으로 메인페이지 index.jsp 재요청(포워딩) 하여 이동
			response.sendRedirect(request.getContextPath() + "/index.jsp");
			
		}else if(check == 0){
	%>
			<script>
				alert("비밀번호가 틀렸습니다.");
				history.back();
			</script>
	<%		
		}else{
	%>
			<script>
				alert("아이디가 없습니다.");
				history.go(-1);
			</script>
	<%	
		}
	%>
</body>
</html>

