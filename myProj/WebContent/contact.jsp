<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
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
    
    <%
		String id = (String)session.getAttribute("id"); 
    
    	MemberDAO dao = new MemberDAO();
    	MemberDTO dto = dao.getMember(id);
    	String mem_email = dto.getEmail();
	%>
					
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
        <div id="mobile-menu-wrap"></div>
    </div>
    <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
    <jsp:include page="Page_top_bottom/top2.jsp" />
    <!-- Header Section End -->

    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-5">
                    <div class="contact__text">
                        <div class="section-title">
                            <span>Information</span>
                            <h2>Contact Details</h2>
                        </div>
                        <p>고객지원이 필요할 경우, 다음 연락망을 통해 연락바랍니다.</p>
                    </div>
                </div>
            </div>
                        
            <!-- 이메일 시작 -->
            <div class="row" style="margin-bottom: 40px;">
                <div class="col-lg-8">
                    <div class="contact__form">
                        <form action="Page_contact/sendMail.jsp" method="post">
                            <div class="row">
                                <div class="col-lg-3 col-md-6 col-sm-6">
                                    <input type="text" value="<%=id%>" readonly="readonly">
                                </div>
                                <div class="col-lg-9 col-md-6 col-sm-6">
                                    <input type="email" name="from" value="<%=mem_email%>" placeholder="Your Email" readonly="readonly">
                                    <input type="hidden" name="to" value="seungha0215@gmail.com">
                                </div>
                                <div class="col-lg-12">
	                                <input type="text" name="subject" placeholder="제목">
                                    <textarea name="content" placeholder="내용"></textarea>
                                    <button type="submit" class="site-btn">Send Email</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- 이메일 끝 -->
            
            <!-- 연락망 시작 -->
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="contact__widget__item">
                        <div class="contact__widget__item__icon">
                            <img src="img/contact/ci-1.png" alt="">
                        </div>
                        <div class="contact__widget__item__text">
                            <h5>Phone Number</h5>
                            <span>+10 1234 5678</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="contact__widget__item">
                        <div class="contact__widget__item__icon">
                            <img src="img/contact/ci-2.png" alt="">
                        </div>
                        <div class="contact__widget__item__text">
                            <h5>Email Address</h5>
                            <span>seungha0215@gmail.com</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="contact__widget__item last__item">
                        <div class="contact__widget__item__icon">
                            <img src="img/contact/ci-3.png" alt="">
                        </div>
                        <div class="contact__widget__item__text">
                            <h5>Office Location</h5>
                            <span>부산광역시 동래구</span>
                        </div>
                    </div>
                </div>
            </div>
          
            <div class="map">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d26080.524497921204!2d129.0617130678174!3d35.20483585591526!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3568937aed67d1ad%3A0x7b1784995b740249!2sDongnae-gu%2C%20Busan%2C%20South%20Korea!5e0!3m2!1sen!2sbd!4v1607099385759!5m2!1sen!2sbd" 
                	width="600" height="450" frameborder="0" style="border:0;" 
                	allowfullscreen="" aria-hidden="false" tabindex="0">
                </iframe>
            </div>
            <!-- 연락망 끝 -->
        </div>
    </section>
    <!-- Contact Section End -->

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