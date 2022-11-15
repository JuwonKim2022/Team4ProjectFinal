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
 
        font-size: 13px;
    }
    .b{
    
      background-color: rgb(255, 209, 209);
        height: 800px
    }
    .c{   
          background-color: rgb(255, 255, 255);
        border-right: 1px solid black;
        height: 800px;
        margin: 100px,50px;
        padding: 40px 50px;
    
    }
    .d{ margin: 5px 0px;
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
    
        border: 1px solid black;
        width: 46%;    
    }
    .reemail{
      display: none;
    }
    .e3{
  
     
        background-color: rgb(249, 249, 249);
        margin-top: 20px;
        justify-content: center;

    }
    .as{
        background-color :rgb(255, 255, 255) ;
      display: inline-flex;
      width: 100%;
      justify-content: space-around;
  
       
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
</style>
</head>
<body>
  <div class="container-fluid">
    <div class="row">
    <div class="col-md-3 c ">
 
        <form class="validation-form join_form " id="join_form" method="POST" novalidate > 
       
        <h5>아이디 :</h5>
        <div class="d form-control idid">${id.id}</div>
           <h5>이름 :</h5>
        <div class="d form-control">${id.name}</div>
               <h5>주소 :</h5>
        <div class="d form-control">${id.address}</div>
        <div class="reemail">
          <label for="email"><h5>변경 주소 </h5></label>
          <input type="email" id="editEmail" name="editEmail" class="remail_input form-control " placeholder="you@example.com" required>
          </div>
           <h5>메일 :</h5>
        <div class="d form-control">${id.email}</div>
        <div class="reemail">
        <label for="email"><h5>변경할 메일 주소 </h5></label>
        <input type="email" id="editEmail" name="editEmail" class="remail_input form-control " placeholder="you@example.com" required>
        </div>
        <div class="e3">
          <div class="as"> <button class="btn btn-primary  join_button e2 " type="button"  id="edit1" >변경 완료</button>
            <button class="btn btn-primary  join_button e2" type="reset" id="edit2"  >취소</button></div>
        <button class="btn btn-primary join_button e "  id="edit" type="button">개인정보 수정</button><br>
         <button class="btn btn-primary  join_button e " id="song" type="button">작성글 보기</button><br>
        <button class="btn btn-primary  join_button e"  id="kim" type="button">검색 기록보기</button><br>
        </div>
        </form>
   
</div>
    <div class="col-md-9 b">데이터 부분
      
      <div class="song"> 

      </div>

      <div class="kim"> 

      </div>


    </div>
  
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
  $("#song").click(function(){
    $(".kim").css('display','none');
    $(".song").css('display','block');
  });
  $("#kim").click(function(){
    $(".song").css('display','none');
    $(".kim").css('display','block');
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