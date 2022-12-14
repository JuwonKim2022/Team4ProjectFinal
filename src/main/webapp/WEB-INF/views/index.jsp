<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>main</title>
<script src="https://kit.fontawesome.com/e4a42c4ca5.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
a {
	text-align: center;
}
</style>
</head>
<body>
	<jsp:include page="nav2.jsp" />
	<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="false">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="/resources/img/marketB1.jpeg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h3>
						<b>서울시 상권 정보</b>
					</h3>
					<p>서울시 전역의 상권 정보를 쉽고 빠르게 얻을 수 있습니다.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/resources/img/marketB2.jpeg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h3>
						<b>지도를 통한 빠른 접근성</b>
					</h3>
					<p>카카오 지도 API를 활용하여 클릭 한 번으로 원하는 지역의 상권 정보를 얻을 수 있습니다.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="/resources/img/marketB3.jpeg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h3>
						<b>그래프와 도표를 통한 분석</b>
					</h3>
					<p>R프로그램을 통해 분석한 자료를 그래프와 도표로 보여줍니다.</p>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
		</button>
	</div>

	<div class="row row-cols-1 m-3 row-cols-md-3 g-4 m-3">
		<div class="col">
			<div class="card h-100">
				<a href="<c:url value='/MarketMapPage'/>">
					<img src="/resources/img/map.jpg" class="card-img-top" alt="...">
				</a>
				<div class="card-body">
					<h5 class="card-title">지도로 보는 상권</h5>
					<p class="card-text">지도로 쉽고 빠르게 원하는 상권의 동향 파악!</p>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="card h-100">
				<a href="<c:url value='/board/list'/>">
					<img src="/resources/img/community.jpg" class="card-img-top" alt="...">
				</a>
				<div class="card-body">
					<h5 class="card-title">이야기 공간</h5>
					<p class="card-text">상권 및 창업과 관련된 자유로운 이야기 공간.</p>
				</div>
			</div>
		</div>
		<div class="col">
			<div class="card h-100">
				<a href="<c:url value='/introduce/introduce'/>">
					<img src="/resources/img/site.jpg" class="card-img-top" alt="...">
				</a>
				<div class="card-body">
					<h5 class="card-title">사이트 소개</h5>
					<p class="card-text">이 사이트에 대한 자세한 내용.</p>
				</div>
			</div>
		</div>
	</div>
	<div>
		<jsp:include page="footer.jsp" />
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>