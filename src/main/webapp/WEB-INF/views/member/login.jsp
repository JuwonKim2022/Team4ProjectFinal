<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>Home</title> 
	<script src="https://kit.fontawesome.com/e4a42c4ca5.js"></script>
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
body {
	height: 100vh;
    width: 100vw;
    background-image: url('/resources/img/loginbg.jpg');
    background-repeat : no-repeat;
    background-size : cover;
}
.input-form {
	max-width: 480px;
	margin-top: 300px;
	padding: 60px;
	background: #fff;
	-webkit-border-radius: 10px;
	-moz-border-radius: 10px;
	border-radius: 10px;
	-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>
<body>
  <nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
      <a class="navbar-brand" href="<c:url value='/'/>">
        <i class="fa-brands fa-freebsd"> market A</i>
      </a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0" >
          <li class="nav-item1">
            <a class="nav-link active1" aria-current="page1" href="<c:url value='/MarketMapPage'/>">상권지도</a>
          </li>
          <li class="nav-item2">
            <a class="nav-link active2" aria-current="page2" href="<c:url value='/board/list'/>">자유게시판</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">내 공간</a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="#">내 정보</a></li>
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="#">내 기록</a></li>
              <li><a class="dropdown-item" href="#">북마크</a></li>
            </ul>
          </li>
          <!-- li class="nav-item3">
            <a class="nav-link active3" aria-current="page3" href="<c:url value='/member/login'/>">로그인</a>
          </li>
          <li class="nav-item4">
            <a class="nav-link active4" aria-current="page4" href="<c:url value='/signUp/signUp'/>">회원가입</a>
          </li-->
          <li class="nav-item3">
            <c:if test="${member != null}"><a class="nav-link active3" aria-current="page3" href="/member/logout">로그아웃</a></c:if>
            <c:if test="${member == null}"><a class="nav-link active3" aria-current="page3" href="/member/login">로그인</a></c:if>
         </li>
          <li class="nav-item4">
            <c:if test="${member == null}"><a class="nav-link active4" aria-current="page4" href="/signUp/signUp/">회원가입</a></c:if>
         </li>
        </ul>
        <form class="d-flex" role="search">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-secondary" type="submit">Search</button>
        </form>
      </div>
    </div>
  </nav>
  
  
  
  
  <div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3 text-center">로그인</h4>
				<br>
				<form name='homeForm' method="post" action="<%=request.getContextPath()%>/member/login">
					<div class="row">
					<c:if test="${member == null}">
						<div class="col-md-12 mb-3">
							<label class="form-label" for="id">아이디</label>
							<input class="form-control" type="text" id="id" name="id">
						</div>
						<div class="mb-3">
							<label class="form-label" for="pw">비밀번호</label>
							<input class="form-control" type="password" id="pw" name="pw">
						</div>
						<div class="mb-3">
						</div>
						<div class="mb-3">
						</div>
						<div class="mb-3 d-grid gap-2 d-md-bloc">
							<button class="btn btn-dark btn btn-primary" type="submit">로그인</button>
							<button class="btn btn-secondary btn btn-primary" type="button">회원가입</button>
						</div>
					</c:if>	
					<c:if test="${member != null }">
						<div>
							<p>${member.id}님 환영 합니다.</p>
							<button id="logoutBtn" type="button">로그아웃</button>
						</div>
					</c:if>
					<c:if test="${msg == false}">
						<p style="color: red;">로그인 실하였습니다.<br> 아이디와 비밀번호 확인해주세요.</p>
					</c:if>	
					</div>
				</form>
			</div>
		</div>
	</div>		
						
						
					
					
					
						
	
	
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>