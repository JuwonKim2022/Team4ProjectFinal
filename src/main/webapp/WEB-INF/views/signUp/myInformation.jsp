<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://kit.fontawesome.com/e4a42c4ca5.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- 다음 우편검색 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>

.d {
   margin: 10px 0px;
   height: 100px;
}

.re {
   display: none;
}

/*개인정보 내용 칸 스타일*/
.form-control {
   background-color: #F2F2F2;
   height: 30px;
}

/*버튼 사이 간격*/
.btn {
   margin-top: 6px;
}

/*큰 버튼*/
.e {
   width: 100%;
}

/*작은 버튼*/
.e2 {
   display: none;
   width: 50%;
}

.reemail {
   display: none;
}

.as {
   background-color: rgb(255, 255, 255);
   display: inline-flex;
   width: 100%;
   justify-content: space-around;
}

.kim {
   background-color: rgb(246, 252, 189);
   display: none;
}

.song {
   background-color: rgb(56, 225, 255);
   display: none;
}
.reAddress_inputSP{
   display: none;
    color: red;
 
 

}
 .editEmailSP{ 
    color: red;
    display: none;
  }
</style>
</head>

<body>
   <c:if test="${member == null}">
         <script type="text/javascript">
            alert("로그인이 필요합니다.");
            location.href="/member/login"
         </script>
      </c:if>
   <!-- 네비게이션 -->
   <jsp:include page="../nav2.jsp" />

   <div class="container-fluid" style="align: center; padding-top: 40px;">
   <br>
   <br>
   
      <div class="row" style="margin-left: 1px">
         <div class="col-md-5 c">
            <form class="validation-form join_form" id="join_form" method="POST" novalidate style="max-width:500px;">
               <label for="id">아이디</label>
               <div class="d form-label form-control idid" style="margin-top: 0;">${member.id}</div>
               
            
               
               <label for="name">이름</label>
               <div class="d form-control" style="margin-top: 0;">${member.name}</div>
               
               <label for="pss" style="margin-top:4px;">주소</label>
               <div class="d form-control" style="margin-top: 0;">${address[0]}</div>
               <div class="d form-control">${address[1]}</div>
               <div class="d form-control">${address[2]}</div>
               <div class="reemail">
         <label for="pss" style="margin-top:3px;">주소</label>
                  <input type="text" class="form-control" style="background-color: white;" name="sample6_postcode" id="sample6_postcode" onclick="sample6_execDaumPostcode()"  placeholder="우편번호">
                  
                  <input type="text" class="address_input_3 form-control sample6_address btn-sm" style="background-color: white;" name="editAddress" id="editAddress"onclick="sample6_execDaumPostcode()"   placeholder="서울특별시 강남구">
                  <div class="invalid-feedback">주소를 입력해주세요.</div>
                  
                  <input type="text" class="form-control reAddress_input" style="background-color: white;" name="sample6_detailAddress" id="sample6_detailAddress" placeholder="상세주소를 입력해주세요.">
                  <br>
                  <span class="reAddress_inputSP">주소를 모두 입력해주세요</span>
               </div>
               <label for="email" style="margin-top:6px;">이메일</label>
               <div class="d form-control" style="margin-top: 0;">${member.email}</div>
               <div class="reemail">
                  <label for="email">변경할 메일 주소</label>
                  <input style="margin-top: 0; background-color: white;" type="email" id="editEmail" name="editEmail" class="remail_input form-control" placeholder="이메일 입력" required>
                      <span class="editEmailSP">이메일 형식이 아닙니다.</span>
               </div>
               <div class="e3">
                  <div class="as">
                     <button class="btn btn-secondary join_button e2 " type="button" id="edit1" style="margin-right:5px">변경 완료</button>
                     <button class="btn btn-danger  join_button e2" type="reset" id="edit2" style="margin-left:5px">취소</button>
                  </div>
                  <button class="btn btn-dark join_button e " id="edit" type="button">개인정보 수정</button>
                  <br>
                  <button class="btn btn-outline-dark  join_button e " id="kim" type="button">작성글 보기</button>
                  <br>
               </div>
            </form>
            <button class="btn btn-outline-dark  join_button e" id="myInfoHistory" type="submit" style="max-width:500px;">검색 기록보기</button>
            <br>
         </div>
         
         
         <div class="col-md-7 b">
            <div class="history" id="historyList"></div>
            <div class="kim"></div>
         </div>
      </div>
   </div>
   <!-- 푸터-->
   
   <div style="margin-top: 120px;">
      <jsp:include page="../footer.jsp" />
   </div>

   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
   <script>
      var email = "";
      
      var addr = ''; // 다음 주소 정보 이용
      var address = null; //모든 주소
      var address1; //우편
      var address2; // 주소
      var address3;//상세주소
      var result = false; //데이터 전송 확인
      // 정보 변경 클릭시 입력창 보여주고  닫기
      $("#edit").click(function() {
         $(".e2").css('display', 'block');
         $(".reemail").css('display', 'block');
      });
      $("#edit2").click(function() {
         $(".e2").css('display', 'none');
         $(".reemail").css('display', 'none');
      });
      //검색 기록 보기 버튼
      $("#song").click(function() {
         $(".kim").css('display', 'none');
         $(".song").css('display', 'block');
      });
      //작성글 보기 버튼
      $("#kim").click(function() {
         $(".song").css('display', 'none');
         $(".kim").css('display', 'block');
      });

      //메일 정규식
       $('.remail_input').on("propertychange change keyup paste input", function(){
            email = $('.remail_input').val();
           var regmail = /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/;    
           if(regmail.test(email) != true ){
           $('.editEmailSP').css('display','block'); //정규식 툴람 경고
           //정규식 틀리면 email "" 로 초기화 
          email="";
         }else{        
             $('.editEmailSP').css('display','none'); //경고 메세지 삭제
             }
       });
       
      
   
      function sample6_execDaumPostcode() {
         new daum.Postcode(
               {
                  oncomplete : function(data) {
                     // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                     // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                     // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.

                     var extraAddr = ''; // 참고항목 변수

                     //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                     if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                     } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                     }

                     // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                     if (data.userSelectedType === 'R') {
                        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                        if (data.bname !== ''
                              && /[동|로|가]$/g.test(data.bname)) {
                           extraAddr += data.bname;
                        }
                        // 건물명이 있고, 공동주택일 경우 추가한다.
                        if (data.buildingName !== ''
                              && data.apartment === 'Y') {
                           extraAddr += (extraAddr !== '' ? ', '
                                 + data.buildingName
                                 : data.buildingName);
                        }
                        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.

                        // 조합된 참고항목을 해당 필드에 넣는다.

                     }

                     // 우편번호와 주소 정보를 해당 필드에 넣는다.
                     document.getElementById('sample6_postcode').value = data.zonecode;
                     address1 = data.zonecode;
                     document.getElementById("editAddress").value = addr;// 커서를 상세주소 필드로 이동한다.
                     address2 = addr;
                     document.getElementById("sample6_detailAddress")
                           .focus();

                  }

               }).open();
      }
   
        $("#edit1").click(function(){
              // 아이디,비번체크 후 데이터 전송여부 결정
                  
          
                 address3=$('.reAddress_input').val();
                 //상세주소만 입력한 경우 경고 메세지 출력
        if(address3==""&&address1!=null&&address2!=null){
         $('.reAddress_inputSP').css('display','block');
         
         return false;
        }  //상세주소 뺴먹은 경우 경고 메세지 출력
        if(address3!=""&&address1==null&&address2==null){
         $('.reAddress_inputSP').css('display','block');
         
         return false;
        } 
             //주소 메일 입력값 없을때
           if(email==""&&address3==""||email==null&&address3==null){

            
              return  false;
           }else{
           //메일만 변경
              if(email!=""&&address3==""){
                 
                 alert('메일만 입력');
                 //메일만 변경할 경우 주소는 null값으로 데이터 전송
                 document.getElementById("editAddress").value = null;
                 
                 result = true;
              }  
              //주소만 변경
              if(address3!=""&&email==""){   
             
                alert('주소만입력');
                //우편번호,주소,세부주소 변수를 합침
               addressJoin();
               //주소만 변경할 경우 메일은 null값으로 데이터 전송
                document.getElementById("editEmail").value = null;
                 result = true;
              }
              //주소,메일 모두 변경
            
              if(address3!=""&&email!=""){
                 alert('주소메일입력');
                 //우편번호,주소,세부주소 변수를 합침
                 addressJoin();
                 result = true;
              } 
            
         
            
           }
           
           if(result ==true){
               $("#join_form").attr("action", "${pageContext.request.contextPath}/signUp/edit");
                 $("#join_form").submit();    
          return false
           }

         
         
               
               });
        function addressJoin(){
               address3=$('#sample6_detailAddress').val();
               //우편번호,주소,세부주소를 합침
               address=address1+"/"+address2+"/"+address3;
               alert(address);
               document.getElementById("editAddress").value = address;
          }
       
      let toHtmlHi = function(historyLists) {
         let tmp = "<table style=\"width:450px; margin:auto;\" class=\"table table-striped shadow p-3 mb-5 bg-body rounded\" ><thead><tr><th scope=\"col\" valign=\"middle\">연도</th><th scope=\"col\" valign=\"middle\">분기</th><th width=\"35%\" valign=\"middle\">주소</th><th scope=\"col\" valign=\"middle\">검색 일자</th></tr></thead><tbody class=\"table-group-divider\">";

         historyLists
               .forEach(function(historyList) {
                  tmp += '<tr><td valign=\"middle\">'
                        + historyList.marketyear + '</td>'
                  tmp += '<td valign=\"middle\">'
                        + historyList.marketquarter + '</td>'
                  if (historyList.bd_codename == null) {
                     tmp += '<td valign=\"middle\">'
                           + historyList.district + '</td>'
                  } else {
                     tmp += '<td valign=\"middle\">'
                           + historyList.district + " "
                           + historyList.bd_codename + '</td>'
                  }
                  function formatDate(date) {
                     var d = new Date(date), month = ''
                           + (d.getMonth() + 1), day = ''
                           + d.getDate(), year = d.getFullYear();

                     if (month.length < 2)
                        month = '0' + month;
                     if (day.length < 2)
                        day = '0' + day;
                     return [ year, month, day ].join('-');
                  }
                  tmp += '<td valign=\"middle\">'
                        + formatDate(historyList.search_date) + '</td>'
                  tmp += '</tr>'
               })
         return tmp + "</table>";
      }

      $('#myInfoHistory').click(function() {
         $.ajax({
            type : 'GET',
            url : '/myInfo/getHistory',
            dataType : 'json',
            success : function(data) {
               var dataList = $(data).get();
               $('#historyList').html(toHtmlHi(dataList));
               console.log("검색 기록 불러오기 성공");
            },
            error : function(error) {
               console.log("검색 기록 불러오기 실패");
            }
         });
      });
   </script>
</body>
</html>