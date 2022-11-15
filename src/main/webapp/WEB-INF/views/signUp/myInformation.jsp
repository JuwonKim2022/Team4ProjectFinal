<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    *{  
 
        font-size: 10px;
    }
    .b{
        border: 1px solid black;
        height: 800px
    }
    .c{ 
          background-color: rgb(204, 221, 255);
        border: 1px solid black;
        height: 800px;
        margin: 100px,50px;
        padding: 10px 50px;
    
    }
    .d{
        height: 50px;
        border: 1px solid black;
    }
    .re{
        display: none;
    }
    .form-control{
        background-color: rgb(229, 229, 229);
        border: 1px solid black;
        height: 30px;
    }
    .btn{
       margin-top: 3px;
    
    }
    .e{
     
        border: 1px solid black;
      width: 100%;
    }
    .e2{   
        display: none;
        background-color: rgb(232, 230, 81);
        border: 1px solid black;
        width: 46%;    
    }
    .reemail{
      display: none;
    }
    .e3{
  
     
        background-color: aquamarine;
        margin-top: 20px;
        justify-content: center;

    }
    .as{
        background-color :yellowgreen ;
      display: inline-flex;
      width: 100%;
      justify-content: space-around;
       
    }
</style>
</head>
<body>
  <div class="container-fluid">
    <div class="row">
    <div class="col-md-3 c ">hello
 
        <form class="validation-form join_form " id="join_form" method="POST" novalidate > 
       
        <h4>아이디 :</h4>
        <div class="d form-control idid">${id.id}</div>
           <h4>이름 :</h4>
        <div class="d form-control">${id.name}</div>
               <h4>주소 :</h4>
        <div class="d form-control">${id.address}</div>
           <h4>메일 :</h4>
        <div class="d form-control">${id.email}</div>
        <div class="reemail">
        <label for="email"><h4>변경할 메일 주소 </h4></label>
        <input type="email" id="editEmail" name="editEmail" class="remail_input form-control " placeholder="you@example.com" required>
        </div>
        <div class="e3">
        <button class="btn btn-primary join_button e "  id="edit" type="button">개인정보 수정</button><br>
       <div class="as"> <button class="btn btn-primary  join_button e2 " type="button"  id="edit1" >변경 완료</button>
      <button class="btn btn-primary  join_button e2" type="reset" id="edit2"  >취소</button></div>
        <button class="btn btn-primary  join_button e" type="button">작성글 보기</button><br>
        <button class="btn btn-primary  join_button e" type="button">검색 기록보기</button><br>
        </div>
        </form>
   
</div>
    <div class="col-md-9 b">hello  </div>
  
</div>  
</div>

  











  

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"  ></script>
  <script >
  $("#edit").click(function(){
    $(".e2").css('display','block');
    $(".reemail").css('display','block');
  });
  $("#edit2").click(function(){
    $(".e2").css('display','none');
    $(".reemail").css('display','none');
  });
  

  
  $("#edit1").click(function(){
  	// 아이디,비번체크 후 데이터 전송여부 결정
  	  var email=$('.remail_input').val();
 
  	
  	  alert('${id.id}');
	  alert('변경 완료버튼 누름');
	  alert(email);


         if(email==null||email==""){       
        	       	  return false;
        
         }else{
              //데이터 전송           
              $("#join_form").attr("action", "${pageContext.request.contextPath}/signUp/edit");
              $("#join_form").submit();         
              return true;

         }
      });
              
  
  </script>
</body>
</html>