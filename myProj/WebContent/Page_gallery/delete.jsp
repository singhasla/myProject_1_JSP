<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Staging Template">
<meta name="keywords" content="Staging, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>OpenOffice | Delete</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Aldrich&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="../css/style.css" type="text/css">
<link rel="stylesheet" href="../css/t_inputBlack.css" type="text/css">
</head>
<%
	String id = (String)session.getAttribute("id"); //반환받은 객체는 입력한 아이디를 문자열객체.
	int num = Integer.parseInt(request.getParameter("num"));//삭제할 글번호
	String pageNum = request.getParameter("pageNum");//글이 속해 있는 페이지번호
%>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>

	<!-- Offcanvas Menu Begin -->
	<div class="offcanvas-menu-overlay"></div>
	<div class="offcanvas-menu-wrapper">
		<div class="offcanvas__logo">
			<a href="#"><img src="../img/logo.png" alt=""></a>
		</div>
		<div id="mobile-menu-wrap"></div>
	</div>
	<!-- Offcanvas Menu End -->

	<!-- Header Section Begin -->
	<%-- <jsp:include page="../Page_top_bottom/top.jsp" /> --%>
	<!-- Header Section End -->

	<!-- Breadcrumb Section Begin -->
	<div class="../breadcrumb-option spad set-bg"
		data-setbg="../img/breadcrumb-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>OFFICE GALLERY</h2>
						<div class="breadcrumb__links">
							<a href="../index.jsp">Home</a> <span>Gallery</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb Section End -->

	<!-- Board Page Section Begin -->
	<section class="about-page spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-4">
					<div class="about__text about__page__text">
						<div class="section-title">
							<span>Introduce</span>
							<h2>시설 사진 삭제</h2>
						</div>
						<div class="about__para__text">
							<p></p>
						</div>
					</div>
				</div>

				<!-- 테이블 구간 -->
				<div class="col-lg-8 col-md-8">
					<div class="contact__form">
                        <form action="deletePro.jsp?pageNum=<%=pageNum%>" method="post">
							<%--삭제할 글번호 전달 --%>
							<input type="hidden" name="num" value="<%=num%>"/>
							
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    	비밀번호
                                    	<input type="text" name="passwd" class="input_black" placeholder="Password">
                                </div>
                                <div class="col-lg-12">
 	                               <button type="submit" class="site-btn" >글 삭제</button>
                                   <button type="button" class="site-btn" onclick="location.href='../gallery.jsp?pageNum=<%=pageNum%>'">글 목록</button>
                                </div>
                            </div>
                        </form>
                    </div>
				</div>	<!-- 테이블구간 끝 -->
			</div>
		</div>
	</section>
	<!-- Board Page Section End -->

	<!-- Footer Section Begin -->
	<jsp:include page="../Page_top_bottom/bottom.jsp" />
	<!-- Footer Section End -->

	<!-- Js Plugins -->
	<script src="../js/jquery-3.3.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
	<script src="../js/jquery.slicknav.js"></script>
	<script src="../js/owl.carousel.min.js"></script>
	<script src="../js/slick.min.js"></script>
	<script src="../js/main.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="../js_add/bootstrap.js"></script>
</body>

</html>