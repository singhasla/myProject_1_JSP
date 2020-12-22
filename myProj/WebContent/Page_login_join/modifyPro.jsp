<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8" />
<title>OpenOffice | Project</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
	%>
	<jsp:useBean id="dao" class="member.MemberDAO"/>	
	<jsp:useBean id="dto" class="member.MemberDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	
	<%
		dao.modifyMember(dto);
	%>
			<script type="text/javascript">
				alert("회원정보가 수정되었습니다.");
				location.href="<%=request.getContextPath()%>/index.jsp";
			</script>
	
</body>
</html>