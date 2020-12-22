e<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8" />
<title>OpenOffice | Logout</title>

    <meta http-equiv="X-UA-Compatible" content="sie-edge" />
    <link href="https://unpkg.com/ionicons@4.2.2/dist/css/ionicons.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../css/login.css" type="text/css">
    <title>Slider Form</title>
</head>

<body>
<%
		//세션영역에 접근해서  세션영역에 저장된 모든 값들 제거(단 세션메모리영역은 유지)
		session.invalidate();
		//세션영역에 저장된 값 모두 제거후~  index.jsp(메인페이지)를 재요청(포워딩)해 이동 !
		//response.sendRedirect("../index.jsp");
	%>
	
		<script type="text/javascript">
			location.href = "<%=request.getContextPath()%>"+"/index.jsp";
		</script>
</body>
</html>