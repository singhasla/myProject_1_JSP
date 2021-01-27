# 개인프로젝트1
## 소개 : OpenOffice 
   - OpenOffice(공유오피스)는 근무환경이 적합하지 않은 이용자들에게 원활한 업무를 제공할 수 있도록<br>
   입주신청을 할 수 있는 웹사이트입니다.
   Model1패턴 JSP로 웹사이트 제작
   
   - ### 개발환경
      + Eclipse-jee-mars
      + MySQL Workbench 8.0 CE
      + JDK8(ver_1.8.0)
      + Tomcat(ver_8.0)
<Br>
   
   - ### 구현
      + 메인페이지
      + 회원정보
         * 회원가입<Br>
            -메일인증 : 구글 JavaMail API<Br>
            -주소검색 : 다음 우편번호서비스 API<Br>
         * 회원정보수정
      + 갤러리 게시판
      + 예약 게시판
         * 게시판 CRUD
         * 페이징
         * 답글
      + 고객지원 게시판
         * 문의사항 : JavaMail API
