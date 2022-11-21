<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<nav class="navbar navbar-expand-lg bg-light">
	<div class="container-fluid">
		<a class="navbar-brand" href="<c:url value='/'/>">
			<i class="fa-brands fa-freebsd"> market A</i>
		</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item1"><a class="nav-link active1" aria-current="page1" href="<c:url value='/MarketMapPage'/>">상권지도</a></li>
				<li class="nav-item2"><a class="nav-link active2" aria-current="page2" href="<c:url value='/board/list'/>">자유게시판</a></li>
				<li class="nav-item3"><a class="nav-link active3" aria-current="page3" href="<c:url value='/signUp/myInformation'/>">내 공간</a></li>
				<li class="nav-item3"><c:if test="${member != null}">
						<a class="nav-link active3" aria-current="page3" onclick="return confirm('정말 로그아웃 하시겠습니까?');" href="/member/logout">로그아웃</a>

					</c:if> <c:if test="${member == null}">
						<a class="nav-link active3" aria-current="page3" href="/member/login">로그인</a>
					</c:if></li>
				<li class="nav-item4"><c:if test="${member == null}">
						<a class="nav-link active4" aria-current="page4" href="/signUp/signUp/">회원가입</a>
					</c:if></li>
				<li class="nav-item5"><c:if test="${member != null}">
						<p style="margin: 0; paddinf: 0;" class="nav-link active5 text-end" aria-current="page5">&nbsp;&nbsp;(${member.name}님 안녕하세요.)</p>
					</c:if></li>
			</ul>
			<!-- 구글검색창 -->
			<form method=get action="http://www.google.com/search" targer="_blank" class="d-flex" role="search">
				<input type="text" name="q" value="" class="form-control me-2" placeholder="검색어 입력" aria-label="Search" style="margin: auto;">
				<button type="submit" name="btnG" class="btn btn-secondary" style="margin: auto;">Google</button>
			</form>
		</div>
	</div>
</nav>