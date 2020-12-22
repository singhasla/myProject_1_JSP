<%@page import="java.text.SimpleDateFormat"%>
<%@page import="board.BoardBean"%>
<%@page import="java.util.List"%>
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
<title>OpenOffice | Project</title>

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
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<%
	String id = (String)session.getAttribute("id"); //반환받은 객체는 입력한 아이디를 문자열객체.
	BoardDAO boardDAO = new BoardDAO();
	
	int currentPage;
	
	//현재 선택한 페이지번호 가져오기
	String tempPage = request.getParameter("pageNum");
	
	
	//페이징처리에 필요한 변수들
		//현재 페이지 정하기
		//int currentPage 초기값 설정
		if(tempPage == null || tempPage.length()==0){
			currentPage = 1;
		}
		try {
			currentPage = Integer.parseInt(tempPage);
		} catch(NumberFormatException e) {
			currentPage = 1;
		}
	int pageLength = 5;
	int totalRows = boardDAO.getBoardCount();
	int totalPages = totalRows % pageLength == 0 ? totalRows / pageLength : (totalRows/pageLength) + 1 ;
		if(totalPages == 0){ totalPages = 1; }
		if(currentPage > totalPages){ currentPage = 1 ;}
	int currentBlock = currentPage % pageLength == 0 ? currentPage / pageLength : (currentPage / pageLength) + 1;
	int startPage = (currentBlock - 1) * pageLength + 1;
	int endPage = startPage + pageLength - 1;
		if(endPage > totalPages){ endPage = totalPages;	}


	//각 페이지 마다 첫번째로 보여질 시작 글번호 구하기
	int start = (currentPage - 1) * pageLength;
	
	//게시판 글객체 저장용도
	List<BoardBean> list = null;
	
	if(totalRows >0){
		//글목록 가져오기
		list = boardDAO.getBoardList(start, pageLength);
	}
	
	//날짜 포맷
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
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
			<a href="#"><img src="img/logo.png" alt=""></a>
		</div>
		<div id="mobile-menu-wrap"></div>
	</div>
	<!-- Offcanvas Menu End -->

	<!-- Header Section Begin -->
	<jsp:include page="Page_top_bottom/top.jsp" />
	<!-- Header Section End -->

	<!-- Breadcrumb Section Begin -->
	<div class="breadcrumb-option spad set-bg"
		data-setbg="img/breadcrumb-bg.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="breadcrumb__text">
						<h2>Reservation Board</h2>
						<div class="breadcrumb__links">
							<a href="./index.jsp">Home</a> <span>Reservation</span>
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
					<div class="nav justify-content-end">
					<%
				
						if (id != null) {
					%>
						<!-- <button type="button" class="btn btn-outline-primary">
							<a href="#">Search</a>
						</button> -->
						<button type="button" class="btn btn-outline-primary" 
								onclick="location.href='Page_board/write.jsp'">Write
						</button>
					<%
						}
					%>
					</div>
					<table class="table table-hover">
						<thead class="thead-dark">
							<tr>
								<th style="width: 10%">번호</th>
								<th style="width: 40%">제목</th>
								<th style="width: 20%">작성자</th>
								<th style="width: 20%">날짜</th>
								<th style="width: 10%">조회수</th>
							</tr>
						</thead>
						<tbody>
						
						<%
							if(totalRows > 0){
								for(int i=0;i<list.size();i++){
									BoardBean bean = list.get(i);
									%>
										<tr onclick="location.href='Page_board/content.jsp?num=<%=bean.getNum()%>&pageNum=<%=currentPage%>'">
											<td><%=bean.getNum() %></td>
											<!-- 답글 시작 -->
											<td>
												<%
												int wid = 0;//답변글에 대한 들여쓰기 정도값 저장
												
												if(bean.getRe_lev() > 0){//답변글이라면
													//들여쓰기 값 처리
													wid = bean.getRe_lev() * 20;
												%>
													<img src="img/board/level.gif" width=<%=wid%> height="15">
													<img src="img/board/re.gif">
												<%
												}
												%>
												<%=bean.getSubject()%>		
											</td>
											<!-- 답글 끝  -->
											<%-- <td><%=bean.getSubject() %></td> --%>
											<td><%=bean.getName() %></td>
											<td><%=sdf.format(bean.getDate()) %></td>
											<td align="center"><%=bean.getReadcount() %></td>
										</tr>
									<%
								}//for끝
							} else {
						%>
							<tr>
								<td colspan="5" align="center">게시판 글 없음</td>
							</tr>
						<%
							}
						%>
						</tbody>
					</table>

					<!-- 페이지번호 구간 -->
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
						<% if(currentPage == startPage){ %>
							<li class="page-item disabled"><a class="page-link" href="#"
								tabindex="-1" aria-disabled="true">Previous</a></li>
						<% } else { %>
							<li class="page-item"><a class="page-link" href="board.jsp?pageNum=<%=currentPage-1%>"
								tabindex="-1" aria-disabled="true">Previous</a></li>
						<% } %>
						<% for(int i=startPage; i<=endPage; i++){ %>
							<li class="page-item">
							<a class="page-link" href="board.jsp?pageNum=<%=i%>"><%=i%></a></li>
						<% } %>
						<%
							//마지막 페이지 숫자와 일치할때
							if(currentPage == totalPages) {
						%>
							<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
						<%
							} else {
						%>
							<li class="page-item">
							<a class="page-link" href="board.jsp?pageNum=<%=currentPage+1%>">Next</a>
							</li>
						<% } %>
						</ul>
					</nav><!-- 페이지번호 끝 -->
				</div>	<!-- 테이블구간 끝 -->
			</div>
		</div>
	</section>
	<!-- Board Page Section End -->

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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="js_add/bootstrap.js"></script>
</body>

</html>