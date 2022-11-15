<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	 	<script src="https://kit.fontawesome.com/e4a42c4ca5.js" crossorigin="anonymous"></script>
  		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
	</head>

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
              					<li><a class="dropdown-item" href="#">내 기록</a></li>
            				</ul>
          				</li>
				        <!-- li class="nav-item3">
				            <a class="nav-link active3" aria-current="page3" href="<c:url value='/member/login'/>">로그인</a>
				        </li>
				        <li class="nav-item4">
				            <a class="nav-link active4" aria-current="page4" href="<c:url value='/signUp/signUp'/>">회원가입</a>
				        </li-->
				        <li class="nav-item3">
				        	<c:if test="${member != null}"><a class="nav-link active3" aria-current="page3" href="/member/logout" onclick="alert('로그아웃 되었습니다.');">로그아웃</a></c:if>
				            <c:if test="${member == null}"><a class="nav-link active3" aria-current="page3" href="/member/login">로그인</a></c:if>
				        </li>
				        <li class="nav-item4">
				            <c:if test="${member == null}"><a class="nav-link active4" aria-current="page4" href="/signUp/signUp/">회원가입</a></c:if>
				        </li>
				        <li class="nav-item5">
				         	<c:if test="${member != null}"><p style="margin:0; paddinf:0;" class="nav-link active5 text-end" aria-current="page5">&nbsp;&nbsp;(${member.name}님 안녕하세요.)</p>
				        </c:if>
				        </li>
				        </ul>
        			<form class="d-flex" role="search" action="http://www.google.com/search" method="GET">
          				<input class="form-control me-2" type="text" placeholder="Search" aria-label="Search">
          				<button class="btn btn-secondary" type="text">Search</button>
        			</form>
      			</div>
   			</div>
  		</nav>
	
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	</body>
</html>