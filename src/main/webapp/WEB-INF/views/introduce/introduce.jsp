<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>Home</title>
<script src="https://kit.fontawesome.com/e4a42c4ca5.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/introduce.css">
</head>

<body>

	<jsp:include page="../nav2.jsp" />

	<!-- 본문 시작 -->
	<div class="container">
		<h1>서비스 소개</h1>
		<hr>
		<br>
		<br>
		<br>
		<div class="intro_box">
			<div class="introImage">
				<img src="/resources/img/introduce.jpg">
			</div>
			<br>
			<br>
			<div class="text_area">
				<h1 class="mainText">
					"우리 서비스는 다양한 <a class="strongText">상권분석</a>을 도와드립니다.
				</h1>
				<h4 class="mainText_Sub">본 웹 사이트는 학습 목적으로 '치킨' 업종 분석만 가능합니다.</h4>
				<br>
				<br>
				<div class="mainText_sub">
					<span> 서울시 공공데이터와 외부 데이터를 확보하여,</span><br> 
					<span>데이터를 토대로 자영업자가 가장 많이 관심 있을 정보를 선별합니다.</span><br> 
					<span> 선별된 데이터는 운영 중이거나 예비 자영업자에게 상권 단위로 다양한 정보를 제공하고 있습니다.</span>
					<br> 
					<br>
					<br>
				</div>
			</div>
		</div>
		<div class="copyright_guide">
			<h2 class="subText">책임의 한계와 법적 고지</h2>
			<br>
			<div class="subText_sub">
				<span>치킨업종 상권분석은 본 웹 사이트를 통해 배포, 전송되거나, 본 웹 사이트에 포함되어 있는
					서비스로부터 제공되는 상권정보는 참고 사항이며, 사실과 차이가 있을 수 있어 정확성이나 신뢰성에 대해 어떠한 보증도 하지
					않습니다.</span><br> <span></span>상권분석은 제공된 정보에 의한 투자결과에 대한 법적인 책임을 지지
				않습니다.</span><br> <span></span>또한, 서비스 및 정보와 관련하여 직접, 간접, 부수적, 파생적인 손해에
				대해서 책임을 지지 않습니다.</span><br> <span></span>치킨업종 상권분석은 필요한 경우 그 재량에 의해
				타인의 권리를 침해하거나 위반하는 사용자에 대하여 사전 통지 없이 서비스 이용 제한 조치를 취할 수 있습니다.</span><br>
			</div>
		</div>
	</div>
	<!-- 본문 종료 -->
	
	<div style="margin-top: 120px;">
		<jsp:include page="../footer.jsp" />
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
</body>
</html>