<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8" />
<title>회원정보수정</title>

    <meta http-equiv="X-UA-Compatible" content="sie-edge" />
    <link href="https://unpkg.com/ionicons@4.2.2/dist/css/ionicons.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../css/login.css" type="text/css">
</head>

<body>

	<%
		MemberDAO dao = new MemberDAO();
		//수정할 직원 아이디 받아오기
		String s_id = (String)session.getAttribute("id");
		
		MemberDTO dto = dao.getMember(s_id);
	%>
	
    <div class="container" id="container">
        <div class="form-container sign-in-container">
            <form action="modifyPro.jsp">
                <h1>My Account</h1>
          	<div>
                <input type="text" placeholder="ID" id="t_id" name="id" value="<%=s_id%>" readonly="readonly">
           </div>
                <input type="password" placeholder="Password" name="passwd" value="<%=dto.getPasswd()%>">
                <input type="text" placeholder="Name" name="name" value="<%=dto.getName()%>">
                <input type="text" placeholder="Tel" name="tel" value="<%=dto.getTel()%>">
                <input type="email" placeholder="Email" name="email" value="<%=dto.getEmail()%>">
           	<div>
                <input type="text" placeholder="Address1" name="address1" value="<%=dto.getAddress1()%>">
           </div>
                <input type="text" placeholder="Address2" name="address2" value="<%=dto.getAddress2()%>">
              	<br><br>
                <button class="ghost">회원정보수정</button>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-right">
                    <h1>Hey, Friend</h1>
                    <p>Update your personal information <br> to the latest</p>
                </div>
                
            </div>
        </div>
    </div>
    
    <script src="https://unpkg.com/ionicons@4.2.2/dist/ionicons.js"></script>

<script src="../js/login.js"></script>
</body>
</html>