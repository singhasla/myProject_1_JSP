<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<head>
<meta charset="UTF-8">
<meta name="description" content="Staging Template">
<meta name="keywords" content="Staging, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>OpenOffice | Top</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Aldrich&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/slick.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/typing.css" type="text/css">
</head>
<%
		String id = (String)session.getAttribute("id"); //반환받은 객체는 입력한 아이디를 문자열객체.
%>

<!-- Header Section Begin -->
<header class="header">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-3">
				<div class="header__logo">
					<a href="#"><img src="img/logo.png" alt=""></a>
				</div>
			</div>
			<div class="col-lg-6">
				<nav class="header__menu mobile-menu">
					<ul>
						<li><a href="index.jsp">Home</a></li>
						<li><a href="services.jsp">Facility</a></li>
						<li><a href="gallery.jsp">Gallery</a></li>
						<li><a href="board.jsp">Reservation</a></li>
						<li><a href="contact.jsp">Contact</a></li>
					</ul>
				</nav>
			</div>
			<div class="col-lg-3">
				<div class="header__widget">
					<span>
					<%if (id != null) {%>
				 		<a href="<%=request.getContextPath()%>/Page_login_join/modify.jsp">[회원정보수정]</a>
						<a href="<%=request.getContextPath()%>/Page_login_join/logout.jsp">[로그아웃]</a>
						<h4>
							<div id="login">
				 				<%=id %>님<br> 접속중...
				 			</div>
						</h4>
					</span>
					<%} else {%>
					<span>
                   		<a href="<%=request.getContextPath()%>/Page_login_join/login.jsp"><h4>Login | Join</h4></a>
					</span>
					<%} %>
				</div>
			</div>
		</div>
		<div class="canvas__open">
			<i class="fa fa-bars"></i>
		</div>
	</div>
</header>
<!-- Header Section End -->