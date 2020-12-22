<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
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
<title>Seungha | Content</title>

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
<%
	request.setCharacterEncoding("UTF-8");

	String filename = request.getParameter("filename");
	String originalFile = request.getParameter("originalFile");

	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	BoardDAO dao = new BoardDAO();
	
	//조회수 증가
	dao.updateReadCount(num);
	
	//글 번호 넘겨서 객체 가져오기
	BoardBean boardBean = dao.getBoard(num);
	
	int DBnum = boardBean.getNum();
	int DBReadcount = boardBean.getReadcount();
	String DBName = boardBean.getName();
	Timestamp DBDate = boardBean.getDate();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:MM");
	String DBSubject = boardBean.getSubject();
	String DBContent = "";
	String DBFile = boardBean.getFile();
	if(boardBean.getContent() != null){
		DBContent = boardBean.getContent().replace("<br>","\r\n");
	}
	
	int DBRe_ref = boardBean.getRe_ref();
	int DBRe_lev = boardBean.getRe_lev();
	int DBRe_seq = boardBean.getRe_seq();
	
    
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
                        <form action="writePro.jsp" method="post">
                        <table class="table table-bordered">
							<tr>
								<th class="myt_head">번호</th>
								<td><input type="text" name="num" value="<%=DBnum %>" class="myt_input1" placeholder="글번호" readonly="readonly"></td>
								<th class="myt_head">조회수</th>
								<td><input type="text" name="readcount" value="<%=DBReadcount %>" class="myt_input1" placeholder="조회수" readonly="readonly"></td>
							</tr>
							<tr>
								<th class="myt_head">작성자</th>
								<td><input type="text" name="name" value="<%=DBName%>" class="myt_input1" placeholder="작성자" readonly="readonly"></td>
								<th class="myt_head">작성일</th>
								<td> <input type="text" name="date" value="<%=sdf.format(DBDate) %>" class="myt_input1" placeholder="작성일" readonly="readonly"></td>
							</tr>
							<tr>
								<th class="myt_head">제목</th>
								<td colspan="3"><input type="text" name="subject" value="<%=DBSubject %>" class="myt_input1" placeholder="Title"></td>
							</tr>
						    <tr>
								<th class="myt_head">내용</th>
								<td colspan="3"><textarea name="content" placeholder="Content" class="myt_textarea" ><%=DBContent %></textarea></td>
							</tr>
						</table>
						
                            <div class="row">
                                <% 
                                    if(DBFile != null){
                                %>
                                <div class="col-lg-12 margin_btm">첨부파일 : 
                                	<a href="download.jsp?fileName=<%=DBFile%>"><%=DBFile%></a>
                                </div>
                                <%
                                 	}
                                %>
                               	<div class="col-lg-12">
                                    <% 
                                    if(id!=null){
                                    %>
                                    <button type="button" class="site-btn" onclick="location.href='update.jsp?pageNum=<%=pageNum%>&num=<%=DBnum%>'">글 수정</button>
                                    <button type="button" class="site-btn" onclick="location.href='delete.jsp?pageNum=<%=pageNum%>&num=<%=DBnum%>'">글 삭제</button>
                                    <button type="button" class="site-btn" 
                                    	onclick="location.href='reWrite.jsp?num=<%=DBnum%>&re_ref=<%=DBRe_ref %>&re_lev=<%=DBRe_lev %>&re_seq=<%=DBRe_seq%>'">답글 쓰기</button>
                                 	<%
                                 	}
                                 	%>
                                    <button type="button" class="site-btn" onclick="location.href='../board.jsp'">글 목록</button>
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