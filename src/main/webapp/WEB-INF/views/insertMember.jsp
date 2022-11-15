<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<h1> 회원가입 페이지 </h1>

<fieldset>
  <legend> 회원가입 </legend>
  <form action="/member/insert" method="post">
    ID : <input type="text" name="userid"> <br>
    PW : <input type="password" name="userpw"> <br>
    NAME : <input type="text" name="username"> <br>
    EMAIL : <input type="text" name="useremail"> <br>
    
    <input type="submit" value="회원가입">          
  </form>  
</fieldset>
</body>
</html>