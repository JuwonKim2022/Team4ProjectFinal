<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입 화면</title>

<!-- Bootstrap CSS -->
  <script src="https://kit.fontawesome.com/e4a42c4ca5.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- Jquery 사용문-->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- 다음 우편검색 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
body {
	height: 100vh;
    width: 100vw;
    background-image: url('/resources/img/signupbg.jpg');
    background-repeat : no-repeat;
    background-size : cover;
}

.input-form {
	display: grid;
	max-width: 680px;
	margin-top: 10%;
	padding: 32px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}

.id_input_re_1 {
	width: 100%;
	height: 100%;
	border: none;
	font-size: 15px;
	display: none;
	color: green;
}

.id_input_re_2 {
	width: 100%;
	height: 100%;
	border: none;
	font-size: 15px;
	display: none;
	color: red;
}

.pw_input_re_1 {
	width: 100%;
	height: 100%;
	border: none;
	font-size: 15px;
	display: none;
	color: red;
}

.pwck_input_re_1 {
	width: 100%;
	height: 100%;
	border: none;
	font-size: 15px;
	display: none;
	color: green;
}

.pwck_input_re_2 {
	width: 100%;
	height: 100%;
	border: none;
	font-size: 15px;
	display: none;
	color: red;
}
</style>
</head>

<body>

	<jsp:include page="../nav2.jsp"/>

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3 text-center">회원가입</h4>
				<form class="validation-form join_form" id="join_form" method="POST"
					novalidate>
					<div class="row">
						<div class="col-md-12 mb-3">
							<label for="id">아이디</label> <input type="text"
								class="id_input form-control" name="id" id="id" placeholder=""
								value="" required> <span class="id_input_re_1">사용
								가능한 아이디입니다.</span> <span class="id_input_re_2">아이디가 이미 존재합니다.</span>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>

					</div>
					<div class="mb-3">
						<label for="password">비밀번호</label> <input type="password"
							class="pw_input form-control" id="pw" name="pw"
							placeholder="비밀번호를 입력해주세요" required> <span
							class="pw_input_re_1">8글자 이상 + 문자와 숫자 조합</span>
						<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="password">비밀번호 확인</label> <input type="password"
							class="pwck_input form-control" id="pw2" id="pw2"
							placeholder="비밀번호를 다시 입력해주세요" required> <span
							class="pwck_input_re_1">비밀번호가 일치합니다.</span> <span
							class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
						<div class="invalid-feedback">비밀번호2를 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="name">이름</label> <input type="text"
							class="user_input form-control" id="name" name="name"
							placeholder="" value="" required>

						<div class="invalid-feedback">이름을 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="email">이메일</label> <input type="email" name="email"
							class="mail_input form-control" id="email"
							placeholder="you@example.com" required>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>
 					<div class="mb-1">
               			<label for="address2">우편번호 <input type="button"  class="btn-light btn-sm emaibutton btn btn-outline-dark" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br></label>
               			<input type="text" class="form-control" name="sample6_postcode" id="sample6_postcode" placeholder="우편번호">
             		</div>
             		<br>
             		<div class="mb-3">
               			<label for="pss">주소</label>
               			<input type="text" class="address_input_3 form-control " name="sample6_address" id="sample6_address" placeholder="서울특별시 강남구" >
               			<div class="invalid-feedback">
                 			주소를 입력해주세요.
               			</div>
             		</div>
             		<div class="mb-3">
               			<label for="address2">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label>
               			<input type="text" class="form-control" name="sample6_detailAddress" id="sample6_detailAddress" placeholder="상세주소를 입력해주세요.">
             		</div>

					<!-- div class="mb-3">
						<label for="pss">주소</label> <input type="text"
							class="address_input_3 form-control" id="address"
							placeholder="서울특별시 강남구">
						<div class="invalid-feedback">주소를 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="address2">상세주소<span class="text-muted">&nbsp;(필수
								아님)</span></label> <input type="text" class="form-control" id="address2"
							placeholder="상세주소를 입력해주세요.">
					</div-->


					<!-- <hr class="mb-4">
             <div class="custom-control custom-checkbox">
               <input type="checkbox" class="custom-control-input" id="aggrement" required>
               <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
             </div> -->
					<div class="mb-4"></div>
					<button class="d-grid gap-2 col-6 mx-auto btn btn-dark btn-lg btn-block join_button"
						type="submit">가입 완료</button>
				</form>
			</div>
		</div>
	</div>
	<!-- div style="margin-top: 4px;">
	
		<jsp:include page="../footer.jsp" />
	</div-->

	<script>
     var idCheck = false;         // 아이디
     var pwCheck = false;         // 비번
     var pwCheck2 = false;        // 비번
     var id = $('.id_input').val();             // id 입력란
     var pw = $('.pw_input').val();            // 비밀번호 입력란
     var pwck = $('.pwck_input').val();   
     var name = $('.user_input').val();         // 이름 입력란
     var mail = $('.mail_input').val();         // 이메일 입력란
     var addr = $('.address_input_3').val();   
     
 
  
   //--------------------------------------------------------------------------------------------
     
     function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                   
                    // 조합된 참고항목을 해당 필드에 넣는다.
                   
                
                } 

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                add=data.zonecode;
                document.getElementById("sample6_address").value = addr;
                b=value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
               
          
            }
            
        }).open();
    }
   //--------------------------------------------------------------------------------------------
     
     //아이디 중복검사
$('.id_input').on("propertychange change keyup paste input", function(){
  
   /* console.log("keyup 테스트"); */
   
   // .id_input에 입력되는 값
   var memberId = $('.id_input').val();
  
    /*   alert(memberId); */
   
   // '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
   var data = {memberId : memberId}            
   $.ajax({
      type : "get",
      url : "${pageContext.request.contextPath}/signUp/UserIdChk",
      data : data,
      success : function(result){
      /* 사용가능한 아이디 */
         if(result == '1' || memberId.length<4){  
            /* 사용 불~~~~~ 가능한 아이디 */
            /*     alert(memberId);  */
            $('.id_input_re_2').css("display","inline-block");
            $('.id_input_re_1').css("display", "none");
            idCheck = false;
         
         } else {              
            //가능
            $('.id_input_re_1').css("display","inline-block");
            //불가능
            $('.id_input_re_2').css("display", "none");   
            idCheck = true;
         }   
      }// success 종료
   }); // ajax 종료   
});// function 종료
//--------------------------------------------------------------------------------------------
/* 비밀번호 정규식- 문자,숫자 혼합 8자이상 */
$('.pw_input').on("propertychange change keyup paste input", function(){
  var pw = $('.pw_input').val();
  var regpw = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;    
  if(regpw.test(pw) != true ){
  $('.pw_input_re_1').css('display','block');
  pwCheck=false;
}else{
    $('.pw_input_re_1').css('display','none');
    pwCheck=true;
}
  });
//--------------------------------------------------------------------------------------------
       /* 비밀번호 확인 일치 유효성 검사 */
   
     $('.pwck_input').on("propertychange change keyup paste input", function(){
        
        var pw = $('.pw_input').val();
        var pwck = $('.pwck_input').val();
        $('.final_pwck_ck').css('display', 'none');
        
        if(pw == pwck){
           $('.pwck_input_re_1').css('display','block');
           $('.pwck_input_re_2').css('display','none');
           pwCheck2 = true;
        }else{
           $('.pwck_input_re_1').css('display','none');
           $('.pwck_input_re_2').css('display','block');
           pwCheck2 = false;
        }
        
        
     });
   //--------------------------------------------------------------------------------------------
    //가입완료 버튼 클릭
     $(".join_button").click(function(){
    	// 아이디,비번체크 후 데이터 전송여부 결정
    	 $("#join_form").addClass('was-validated');       
         if(!(idCheck&&pwCheck&&pwCheck2)){       
        	       	  return false;
        
         }else{
              //데이터 전송           
              $("#join_form").attr("action", "${pageContext.request.contextPath}/signUp/join");
              $("#join_form").submit();         
              return true;
         }
        });
                
         //-------------------------------------------------
 
     </script>
     
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>