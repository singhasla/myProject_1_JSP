<%@page import="board.BoardDAO"%>
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
		request.setCharacterEncoding("UTF-8");
	%>
		<jsp:useBean id="bBean" class="board.BoardBean"/>
		<jsp:setProperty property="*" name="bBean"/>
	<%
		
		BoardDAO bdao = new BoardDAO();
		int check = bdao.updateBoard(bBean);
		   
		String pageNum = request.getParameter("pageNum");
		
		//5. check == 1 UPDATE에 성공하면
		if(check == 1){
	%>		
			<script type="text/javascript">
				window.alert("게시글이 수정되었습니다.");
				location.href= "../board.jsp?pageNum=<%=pageNum%>";
			</script>
	<%		
		}else{//check == 0 비밀번호 잘못 입력해서 UPDATE에 실패 하면
	%>		
			<script type="text/javascript">
				window.alert("비밀번호가 틀렸습니다.");
				window.alert("게시글 수정을 실패하였습니다.");
				history.go(-1); //1단계 이전 update.jsp페이지로 가서 비밀번호 다시 입력 하기  
			</script>
	<%	
		}
	%>

</body>
</html>