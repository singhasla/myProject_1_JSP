<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
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
<title>Seungha | Update</title>

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
	String id = (String)session.getAttribute("id"); 
	
	//content.jsp에서 글수정 버튼 클릭했을때 요청한 값 전달 받기 
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

	BoardDAO dao =  new BoardDAO();
	
	BoardBean boardBean = dao.getBoard(num); 
	
	int DBnum = boardBean.getNum();//검색한 글번호 
	int DBReadcount = boardBean.getReadcount();//검색한 글의 조회수
	String DBName = boardBean.getName();//검색한 글작성자명
	Timestamp DBDate = boardBean.getDate();//검색한 글작성일
	String DBSubject = boardBean.getSubject();//검색한 글제목
	String DBContent = "";//검색한 글 내용
	
	//검색한 글내용이 존재한다면.. 엔터키를 사용해서 처리한 글내용을 받아온다
	if(boardBean.getContent() != null){
		DBContent = boardBean.getContent().replace("<br>", "\r\n");
	}
	
	//답변글 처리 관련 검색한 필드의 정보 얻기
	int DBRe_ref = boardBean.getRe_ref();//주글의 그룹번호
	int DBRe_lev = boardBean.getRe_lev();//주글의 들여쓰기정도값
	int DBRe_seq = boardBean.getRe_seq();//주글들 내의 순서값
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
						<h2>Reservation Board</h2>
						<div class="breadcrumb__links">
							<a href="../index.jsp">Home</a> <span>Reservation</span>
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
							<span>Reservation</span>
							<h2>오피스 입주 신청</h2>
						</div>
						<div class="about__para__text">
							<p>여러분의 업무 스타일에 최적화된 공유 오피스에서 지금 비즈니스를 성장시키세요</p>
						</div>
					</div>
				</div>

				<!-- 테이블 구간 -->
				<div class="col-lg-8 col-md-8">
					<div class="contact__form">
                        <form action="updatePro.jsp" method="post">
	                        <input type="hidden" name="num" value="<%=num%>" >
							<input type="hidden" name="pageNum" value="<%=pageNum%>">
			
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <input type="text" name="name" value="<%=DBName%>" class="input_black" placeholder="Name" readonly="readonly">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6">
                                    <input type="text" name="passwd" class="input_black" placeholder="Password">
                                </div>
                                <div class="col-lg-12 col-md-6 col-sm-6">
                                    <input type="text" name="subject" value="<%=DBSubject%>" class="input_black" placeholder="Title">
                                </div>
                                <div class="col-lg-12">
                                    <textarea name="content" placeholder="Content" class="input_black" ><%=DBContent%></textarea>
                                    <button type="submit" class="site-btn">글 수정</button>
                                    <button type="reset" class="site-btn">다시쓰기</button>
                                    <button type="button" class="site-btn" onclick="location.href='../board.jsp?pageNum=<%=pageNum%>'">글 목록</button>
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