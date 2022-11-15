<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
<script src="https://kit.fontawesome.com/e4a42c4ca5.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				location.href = "/board/readView?bno=${replyDelete.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
		})
		
	</script>
<body>
	<jsp:include page="../nav2.jsp" />

	<div class="container">
		<header>
			<h1>댓글 삭제</h1>
		</header>
		<hr />

		<!-- div>
				<!--%@include file="nav.jsp" %>
			</div-->
		<div class="container text-left">
			<div class="row">
				<div class="col">
					<div class="d-grid gap-2 d-md-block">
						<button type="submit" class="list_btn btn btn-dark">
							<a style="list-style: none; text-decoration: none; color: white;"
								href="/board/list">목록</a>
						</button>
					</div>
				</div>
				<div class="col">
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<button type="submit" class="delete_btn btn btn-success">
							<a style="list-style: none; text-decoration: none; color: white;"
								href="/board/writeView">글 작성</a>
						</button>
					</div>
				</div>
			</div>
		</div>

		<section id="container">
			<form name="updateForm" role="form" method="post"
				action="/board/replyDelete">
				<input type="hidden" name="bno" value="${replyDelete.bno}"
					readonly="readonly" /> <input type="hidden" id="rno" name="rno"
					value="${replyDelete.rno}" /> <input type="hidden" id="page"
					name="page" value="${scri.page}"> <input type="hidden"
					id="perPageNum" name="perPageNum" value="${scri.perPageNum}">
				<input type="hidden" id="searchType" name="searchType"
					value="${scri.searchType}"> <input type="hidden"
					id="keyword" name="keyword" value="${scri.keyword}"> <br>
				<p class="text-center fs-4">삭제 하시겠습니까?</p>
				<br>
				<div class="d-grid gap-2 col-6 mx-auto">
					<br>
					<button type="submit" class="delete_btn btn btn-danger">예
						삭제합니다.</button>
					<button type="button" class="cancel_btn btn btn-secondary">아니오.
						삭제하지 않습니다.</button>
				</div>
			</form>
		</section>
		<hr />
	</div>
	<div>
		<jsp:include page="../footer.jsp" />
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
</body>
</html>