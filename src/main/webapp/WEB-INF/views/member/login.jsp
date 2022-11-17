<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	background-repeat: no-repeat;
	background-size: cover;
}

.input-form {
 	display: grid;
  	place-items: center;
  	min-height: 60vh;
	max-width: 480px;
	margin-top: 17%;
	min-height: 60px;
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

	<jsp:include page="../nav2.jsp" />

	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
				<h4 class="mb-3 text-center">로그인</h4>
				<br>
				<form name='homeForm' method="post" action="/member/login">
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
							<div class="mb-3"></div>
							<div class="mb-3"></div>
							<div class="mb-3 d-grid gap-2 d-md-bloc">
								<button class="btn btn-dark btn btn-primary" type="submit">로그인</button>
								<button class="btn btn-secondary btn btn-primary" type="button">
									<a class="nav-link active" href="/signUp/signUp/">회원가입</a>
								</button>
								<button class="btn btn-secondary btn btn-primary" type="button">
									<a class="nav-link active" href="/member/findId/">아이디 찾기</a>
								</button>
							</div>
						</c:if>
						<c:if test="${member != null }">
							<div>
								<p>${member.name}님환영 합니다.</p>
								<button id="logoutBtn" type="button">로그아웃</button>
							</div>
						</c:if>
						<c:if test="${msg == false}">
							<p style="color: red; text-align: center;">
								로그인에 실패하였습니다.<br> 아이디와 비밀번호 확인해주세요.
							</p>
						</c:if>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!--div style="margin-top: 120px;">
		<jsp:include page="../footer.jsp" />
	</div-->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
</body>
</html>