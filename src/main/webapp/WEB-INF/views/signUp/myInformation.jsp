<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- 다음 우편검색 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
    *{  
    
     
    }
    .data{
      background-color: aquamarine;
     
    
    }
    .myinfo{   
       
   
      height: 700px;
      background-color: rgb(255, 255, 255);
    }
    .join_form{ 
   
      margin: 100px 8%;
      height: 100%;

    }
 
    .form-control{
      margin-top: 5px;
      background-color: rgb(239, 239, 239);
  
    }
    .btn{
      margin-top: 5px;
      background-color: rgba(186, 186, 186, 0.58);
    }

    .readdress{   
        display: none;
        background-color: rgba(185, 66, 240, 0.58);
    }
    .reemail{
      margin: 5px;
      background-color: rgb(42, 186, 218);
    }
    .reemail1{
      margin: 10px 10px;
      background-color: rgb(255, 8, 8);
    }

    .kim{
      background-color: rgb(246, 252, 189);
       display: none;
      height: 700px;
    }
    .song{
      background-color: rgb(56, 225, 255);
      display: none;
      height: 700px;
    }
    .tag{
      text-align: center;
   
    }
    .menu{
      background-color: rgb(126, 109, 109);
    }
    .butmenu{

      margin-top: 10px;
      padding: 10px;
    border:  1px solid black;
    border-radius: 10px;
    }
    .butmenu>.btn{ 
      width: 100%;
    }
  .e2 {
    display:  none;
  }
  .DB{
 padding: 10px;
    border:  1px solid black;
    border-radius: 10px;
  }
  .NDB{
    margin-top: 10px;

    display:  none;
 padding: 10px;
    border:  1px solid black;
    border-radius: 10px;
  }
</style>
</head>
<body>

  <div class="container-fluid">
    <div class="row">
     <div class="col-md-3 myinfo ">
             
        <form class="validation-form join_form " id="join_form" method="POST" novalidate >
          <div class="DB">
          <div class=" tag">내 정보</div>
       
          <div class=" form-control idid">${member.id}</div>
   
          <div class=" form-control">${member.name}</div>
      
          <div class=" form-control">${address[0]}</div>
          <div class=" form-control">${address[1]}</div>
          <div class=" form-control">${address[2]}</div>
          <div class="d form-control">${member.email}</div>
        </div>
        <div class="NDB">
          <div class=" tag ">새 주소      
            <input type="button"  class="  form-control   btn-outline-dark" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
          
          <input type="text"class="form-control" name="sample6_postcode" id="sample6_postcode" placeholder="우편번호">       
          <input type="text" class="address_input_3 form-control sample6_address " name="editAddress" id="editAddress" placeholder="서울특별시 강남구" >
          <input type="text" class="form-control reAddress_input" name="sample6_detailAddress" id="sample6_detailAddress" placeholder="상세주소를 입력해주세요.">
          </div> 
     
        
          <div class=" tag ">새 메일
          <input type="email" id="editEmail" name="editEmail" class="remail_input form-control " placeholder="이메일 입력" required>
        </div> 
        </div>
        
          <div class="butmenu"> 
            <button class="btn join_button e2 " type="button"  id="edit1" >변경 완료</button>
            <button class="btn  join_button e2" type="reset" id="edit2"  >취소</button>
        <button class="btn  join_button  "  id="edit" type="button">개인정보 수정</button>
         <button class="btn   join_button  " id="song" type="button">작성글 보기</button>
        <button class="btn  join_button "  id="kim" type="button">검색 기록보기</button>
        </div>





        </form>
     
     </div>
     <div class="col-md-9 data">데이터 부분
      
      <div class="song"> 

      </div>

      <div class="kim"> 

      </div>


     </div>
  
    </div>  
  </div>

  











  

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"  ></script>
   <script >
  var email=null;
  var address=null;
  var addr = ''; // 주소 변수
  
  var address1;
  var address2 ;
  var address3 ;
  var result = false;
  $("#edit").click(function(){
    $(".e2").css('display','block');
    $(".NDB").css('display','block');
  });
  $("#edit2").click(function(){
    $(".e2").css('display','none');
    $(".NDB").css('display','none');
  });
  $("#song").click(function(){
    $(".kim").css('display','none');
    $(".song").css('display','block');
  });
  $("#kim").click(function(){
    $(".song").css('display','none');
    $(".kim").css('display','block');
  });

  

              
  
  function sample6_execDaumPostcode() {
     new daum.Postcode({
         oncomplete: function(data) {
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
             address1= data.zonecode;
             document.getElementById("editAddress").value = addr;// 커서를 상세주소 필드로 이동한다.
             address2= addr;
             document.getElementById("sample6_detailAddress").focus();
            
       
         }
         
     }).open();
 }
  $("#edit1").click(function(){
        // 아이디,비번체크 후 데이터 전송여부 결정
            email=$('.remail_input').val()
           address=$('.sample6_address').val();
  
        
       //주소 메일 입력값 없을때
     if(email==""&&address==""||email==null&&address==null){
        alert('주소,메일 변경값없음');
      
        result = false;
     }else{
     //메일만 변경
        if(email!=""&&address==""){
           
           alert('메일만 입력');
           document.getElementById("editAddress").value = null;
           
           result = true;
        }  
        //주소만 변경
        if(address!=""&&email==""){   
           
          alert('주소만입력');
         addressJoin();
          document.getElementById("editEmail").value = null;
           result = true;
        }
        //주소,메일 모두 변경
      
        if(address!=""&&email!=""){
           alert('주소메일입력');
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
         address=address1+"/"+address2+"/"+address3;
         alert(address);
         document.getElementById("editAddress").value = address;
    }
 
  </script>
</body>
</html>