<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8" />
<title>OpenOffice | Sign In</title>

    <meta http-equiv="X-UA-Compatible" content="sie-edge" />
    <link href="https://unpkg.com/ionicons@4.2.2/dist/css/ionicons.min.css" rel="stylesheet">
	<link rel="stylesheet" href="../css/login.css" type="text/css">
	
	<!-- 아이디 중복체크 -->
	<!-- JQuery Setup -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
	<%-- 아이디 중복체크 시작--%>
		//아래 버튼 클릭했을 때 호출되는 메소드로
		//Ajax기술을 이용하여 서블릿(서버페이지)으로 요청후 응답을 받아 처리함.
		//사용자가 입력한 ID와 DB에 저장된 ID가 중복되었는지 판단하는 요청
		function fn_dupl() {
			
			//사용자가 입력한 ID를 얻어 변수에 저장
			var _id = $("#t_id").val();	//서블릿(서버페이지)으로 요청하는 파라미터
			
			if(_id == '') {
				alert("아이디를 입력하세요");
				return;	//function()를 빠져나감
			}

			//아이디를 입력했다면 AJAX기술을 이용하여 서버페이지로 아이디 중복확인을 요청함
			$.ajax({
				type : "post",
				async : true,
				url : "<%=request.getContextPath()%>/mem",	/* mem : 서블릿 매칭주소  */
				dataType : "text",
				data : { id: _id },	//입력한 ID를 서블릿으로 요청시 요청할 데이터로 전송!
				success : function(m, textStatus){
							//서블릿(서버가 실행하는 페이지에서 전송되어 오는 응답메세지를
							//m 매개변수로 전달받아.. 아래의 div태그영역에 표시
							if(m == "useable"){
								//text로 메세지 정보를 출력
								$("#message").text("사용 가능한 ID입니다.");
								
								//사용할 수 있는 ID이므로 ID중복체크버튼을 비활성화 시킴
								$("#btn_dupl").prop("disable", true);
								
							} else {
								$("#message").text("사용할 수 없는 ID입니다.");
							}
				},
				error : function(m, textStatus){ 
							alert(m); //에러메세지 얻어서 출력
							alert("에러가 발생했습니다."); 
				}
			});
			
		}
	</script>
	<%-- 아이디 중복체크 끝--%>

	<%-- 다음 우편번호 API--%>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("sample4_roadAddress").value = roadAddr;
	
	            }
	        }).open();
	    }
	</script>
	<%-- 다음 우편번호 API 끝--%>
	
	<%-- 이메일 인증 --%>
	<script type="text/javascript">
		function fn_emailchk() {
			
			if(!document.userInfo.email.value){
				alert("이메일을 입력하세요.");
				return false;
			}
			
			var width = 500;
			var height = 200;
			var winL = (screen.width - width) / 2;
			var winT = (screen.height - height) / 2;
			var property = "width=" + width + "," + "height=" + height + "," 
							+ "left=" + winL + "," + "top=" + winT + " menubar=no";
			
			email_Check = false;
			window.open("authMail.jsp?to=" + email.value, "인증 페이지", property);
		}
	</script>
	<%-- 이메일 인증 끝 --%>
	
	<%-- 회원가입폼 유효성검사 --%>
	<script type="text/javascript">
	
		// 필수 입력정보인 아이디, 비밀번호, 이름이 입력되었는지 확인하는 함수
		function checkValue()
		{
			if(!document.userInfo.id.value){
				alert("아이디를 입력하세요.");
				return false;
			}
			
			if(!document.userInfo.passwd.value){
				alert("비밀번호를 입력하세요.");
				return false;
			}
			
			if(!document.userInfo.name.value){
				alert("이름을 입력하세요.");
				return false;
			}
			
			if(!document.userInfo.email.value){
				alert("이메일을 입력하세요.");
				return false;
			}
			
			//나머지는 NULL 가능
		}
	</script>
	<%-- 회원가입폼 유효성검사 끝 --%>
</head>

<body>

    <div class="container" id="container">
        <div class="form-container sign-up-container">
            <form action="joinPro.jsp" method="post" name="userInfo" onsubmit="return checkValue()">
                <h1>Create Account</h1>
          	<div>
                <input type="text" placeholder="ID" id="t_id" class="widthcut" name="id">
                <button type="button" class="check" id="btn_dupl" onclick="fn_dupl();">중복<br>체크</button>
                <div id="message"></div>
           </div>
                <input type="password" placeholder="Password" name="passwd">
                <input type="text" placeholder="Name" name="name">
                <input type="text" placeholder="Tel" name="tel">
            <div>
                <input type="email" placeholder="Email" class="widthcut" name="email" id="email">
                <button type="button" class="check" onclick="fn_emailchk();">메일<br>인증</button>
            </div>
           	<div>
                <input type="text" placeholder="Address" name="address1" id="sample4_roadAddress" class="widthcut" readonly="readonly">
                <button type="button" class="check" onclick="execDaumPostcode();">주소<br>검색</button>
           </div>
                <input type="text" placeholder="Detail Address" name="address2">
              	<br><br>
                <button onclick="fn_checked();">Sign Up</button>
            </form>
        </div>
        <div class="form-container sign-in-container">
            <form action="loginPro.jsp" method="post" name="fr">
                <h1>Sign In</h1>
                <span>or use your account</span>
                <input type="text" placeholder="ID" name="loginid" autofocus>
                <input type="password" placeholder="Password" name="loginpw">
                <br><br>
                <button>Sign In</button>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>Welcome Back</h1>
                    <p>To keep connected with us <br> please login with your personal info</p>
                    <button class="ghost" id="signIn">Sign In</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Hello, Friend</h1>
                    <p>Enter your personal details and <br> start journey with us</p>
                    <button class="ghost" id="signUp">Sign Up</button>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://unpkg.com/ionicons@4.2.2/dist/ionicons.js"></script>

<script src="../js/login.js"></script>
</body>
</html>