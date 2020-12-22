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
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String passwd = request.getParameter("passwd");//글을 삭제하기위해 입력한 비밀번호
	
	request.setCharacterEncoding("UTF-8");
%>

	<%
		BoardDAO bdao = new BoardDAO();
		//check == 1  삭제성공  -> notice.jsp이동
		//check == 0  글에 대한 비밀번호 틀림  -> delete.jsp로 이동 
		int check = bdao.deleteBoard(num,passwd);
		 
		if(check == 1){
	%>
		<script>
			alert("게시글이 삭제되었습니다.");
			location.href="../board.jsp?pageNum=<%=pageNum%>";
		</script>	
	<%		
		}else{
	%>
		<script>
			alert("게시글의 비밀번호가 틀렸습니다.");
			history.back();
		</script>
	<%		
		}
	%>

</body>
</html>