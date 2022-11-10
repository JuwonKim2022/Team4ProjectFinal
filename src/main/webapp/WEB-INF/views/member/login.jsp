<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
	<title>Home</title> 
</head>

</script>
<body>
	<form name='homeForm' method="post" action="<%=request.getContextPath()%>/member/login">
		<c:if test="${member == null}">
			<div>
				<label for="id"></label>
				<input type="text" id="id" name="id">
			</div>
			<div>
				<label for="pw"></label>
				<input type="password" id="pw" name="pw">
			</div>
			<div>
				<button type="submit">로그인</button>
				<button type="button">회원가입</button>
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
	</form>
</body>
</html>