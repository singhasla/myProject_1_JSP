<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page import="image.ImageDTO"%>
<%@page import="image.ImageDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Staging Template">
    <meta name="keywords" content="Staging, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>OpenOffice | Gallery</title>

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
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id"); //반환받은 객체는 입력한 아이디를 문자열객체.
	String filePath = request.getContextPath()+"/temp"; // 다운로드(업로드)경로.
	ImageDAO imageDAO = new ImageDAO();
	
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
	int pageLength = 4;
	int totalRows = imageDAO.getImageCount();
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
	List<ImageDTO> lists = null;
	
	if(totalRows >0){
		//글목록 가져오기
		lists = imageDAO.getImageList(start, pageLength);
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
    <div class="breadcrumb-option spad set-bg" data-setbg="img/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>Office Gallery</h2>
                        <div class="breadcrumb__links">
                            <a href="./index.jsp">Home</a>
                            <span>Gallery</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Section End -->

    <!-- Project Page Section Begin -->
    <section class="project-page spad">
    	<div class="container">
	   		<div class="row">
			    <div class="col-lg-11"></div>
			    <div class="col-lg-1 col-md-6 col-sm-6">
		            <div class="nav">
						<%
						if (id != null && id.equals("admin")) {
						%>
							<!-- <button type="button" class="btn btn-outline-primary">
								<a href="#">Search</a>
							</button> -->
							<button type="button" class="btn btn-outline-primary"
									onclick="location.href='Page_gallery/write.jsp'">Write
							</button>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
        <div class="container">
			<div class="row">
				<div class="col-lg-12">
				    <div class="section-title">
				        <span>Introduce</span>
				        <h2>시설 내부 전경</h2>
				    </div>
				</div>
			</div>
            <div class="row">
        		<%
					if(totalRows > 0){
						for(int i=0;i<lists.size();i++){
							ImageDTO dto = lists.get(i);
							%>
							<div class="col-lg-6 col-md-6 col-sm-6">
			                    <div class="project__item">
			                        <img src="<%=filePath%>/<%=dto.getImagefile() %>" style="width: 555px; height: 415px"
				                        onclick="location.href='Page_gallery/content.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>'"/>
			                        <h4><a href="#"><%=dto.getSubject() %></a></h4>
			                    </div>
			                </div>
							<%
						}//for끝
					} else {
				%>
						<div class="col-lg-12 col-md-6 col-sm-6">
		                    <div class="project__item">
		                        <h4><a href="#">등록된 파일이 없습니다.</a></h4>
		                    </div>
		                </div>
				<%
					}
				%>
				               
                <!-- 페이지번호 구간 -->
				<div class="col-lg-12 text-center">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
						<% if(currentPage == startPage){ %>
							<li class="page-item disabled"><a class="page-link" href="#"
								tabindex="-1" aria-disabled="true">Previous</a></li>
						<% } else { %>
							<li class="page-item"><a class="page-link" href="gallery.jsp?pageNum=<%=currentPage-1%>"
								tabindex="-1" aria-disabled="true">Previous</a></li>
						<% } %>
						<% for(int i=startPage; i<=endPage; i++){ %>
							<li class="page-item">
							<a class="page-link" href="gallery.jsp?pageNum=<%=i%>"><%=i%></a></li>
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
							<a class="page-link" href="gallery.jsp?pageNum=<%=currentPage+1%>">Next</a>
							</li>
						<% } %>
						</ul>
					</nav><!-- 페이지번호 끝 -->
                </div>
                
                
					
            </div>
        </div>
    </section>
    <!-- Project Page Section End -->

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