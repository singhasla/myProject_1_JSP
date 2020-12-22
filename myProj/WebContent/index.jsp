<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%
		String id = (String)session.getAttribute("id"); //반환받은 객체는 입력한 아이디를 문자열객체.
	
		System.out.println(id);
		//session내장객체 메모리영역에 세션id값이 저장되어 있지 않으면?  -> 로그인이 되지않는 화면	
	%>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta name="description" content="Staging Template">
    <meta name="keywords" content="Staging, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>OpenOffice | Project</title>
    
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Aldrich&display=swap" rel="stylesheet">

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
<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__logo">
            <a href="#"><img src="img/logo.png" alt=""></a>
        </div>
        
        <div class="offcanvas__widget">
           	<span>
			<%if(id != null) {%>
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
        <div id="mobile-menu-wrap"></div>
    </div>
    <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
    <jsp:include page="Page_top_bottom/top.jsp" />
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="hero__slider owl-carousel">
            <div class="hero__items set-bg" data-setbg="img/hero/hero-1.jpg">
                <div class="hero__text">
                    <h2 id="typewriter">Seungha's Website.</h2>
                    <%
                    	if (id == null || id.equals("")) {
					%>
                    		<a href="Page_login_join/login.jsp" class="primary-btn">LOG IN</a>
                    <%  } else { 
                    %>
                   			<a href="Page_login_join/logout.jsp" class="primary-btn">LOG OUT</a>
                   			<br>
                   	<%  
                   		} 
                   	%>
                    <a href="#" class="more_btn">ITwill Seungha Project</a>
                    <!-- 
                    <div class="hero__social">
                        <a href="#"><i class="fa fa-facebook"></i></a>
                        <a href="#"><i class="fa fa-twitter"></i></a>
                        <a href="#"><i class="fa fa-instagram"></i></a>
                        <a href="#"><i class="fa fa-linkedin"></i></a>
                    </div>
                    -->
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
    
    <!-- Footer Section Begin -->
    <jsp:include page="Page_top_bottom/bottom.jsp" />
	<!-- Footer Section End -->

<!-- Js Plugins -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.slicknav.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/main.js"></script>
</body>

</html>