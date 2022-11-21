<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>Find ID</title>
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
	margin-top: 20%;
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
				<h4 class="mb-3 text-center">아이디 찾기</h4>
				<br>
				<form method="post" class="form-signin" action="/member/findId" name="findform">
					<div class="form-label-group">
						<label for="name" style="margin-bottom: 3px">이름</label>
						<input type="text" style="margin-bottom: 18px" id="name" name="name" class="form-control" />
					</div>
					<div class="form-label-group">
						<label for="email" style="margin-bottom: 3px">이메일</label>
						<input type="email" id="email" name="email" class="form-control" />
					</div>
					<br>
					<div class="form-label-group mb-3 d-grid gap-2 d-md-bloc">
						<button class="btn btn-dark btn btn-primary" type="submit">체 크</button>
					</div>
					<br>
					<!-- 이름과 전화번호가 일치하지 않을 때 -->
					<c:if test="${check == 1}">
						<script>
							opener.document.findform.name.value = "";
							opener.document.findform.email.value = ""; 
						</script>
						<label style="color: red;">일치하는 정보가 존재하지 않습니다.</label>
					</c:if>
					<!-- 이름과 비밀번호가 일치하지 않을 때 -->
					<c:if test="${check == 0 }">
						<label style="color: green;">당신의 아이디는 '${id}' 입니다.</label>
					</c:if>
				</form>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>