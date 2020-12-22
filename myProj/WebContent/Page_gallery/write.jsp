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
<title>OpenOffice | Write</title>

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
<link rel="stylesheet" href="../css/t_input.css" type="text/css">
</head>
	<%
		String id = (String)session.getAttribute("id"); //반환받은 객체는 입력한 아이디를 문자열객체.
	%>

	<%-- 게시판 유효성검사 --%>
	<script type="text/javascript">
	
		// 필수 입력정보인 게시판 비밀번호, 제목, 내용이 입력되었는지 확인하는 함수
		function checkValue()
		{
			if(!document.galleryInfo.passwd.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			if(!document.galleryInfo.subject.value){
				alert("제목을 입력하세요.");
				return false;
			}
			
			if(!document.galleryInfo.content.value){
				alert("내용을 입력하세요.");
				return false;
			}
			
			if(!document.galleryInfo.fileName.value){
				alert("사진을 첨부하세요.");
				return false;
			}
		}
	</script>
	<%-- 게시판 유효성검사 끝 --%>
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
							<h2>시설 사진 등록</h2>
						</div>
						<div class="about__para__text">
							<p></p>
						</div>
					</div>
				</div>

				<!-- 테이블 구간 -->
				<div class="col-lg-8 col-md-8">
					<div class="contact__form">
                        <form action="writePro.jsp" name="galleryInfo" enctype="multipart/form-data" method="post" onsubmit="return checkValue()">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <input type="text" name="name" value="<%=id%>" class="input_black" placeholder="Name" readonly="readonly">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <input type="text" name="passwd" class="input_black" placeholder="Password">
                                </div>
                                <div class="col-lg-12 col-md-6 col-sm-6">
                                    <input type="text" name="subject" class="input_black" placeholder="Title">
                                </div>
                                <div class="col-lg-12">
                                    <textarea name="content" placeholder="Content" class="input_black" ></textarea>
                                    	첨부파일 : <input type="file" name="fileName" class="up_down">
                                    <button type="submit" class="site-btn" onsubmit="return checkValue()">글 등록</button>
                                    <button type="reset" class="site-btn">다시쓰기</button>
                                    <button type="button" class="site-btn" onclick="location.href='../gallery.jsp'">글 목록</button>
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