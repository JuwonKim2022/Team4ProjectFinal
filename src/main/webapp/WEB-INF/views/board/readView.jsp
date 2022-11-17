<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.kh.vo.MemberVO"%>
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
	$(document)
			.ready(
					function() {
						var formObj = $("form[name='readForm']");

						// 수정 
						$(".update_btn").on("click", function() {
							formObj.attr("action", "/board/updateView");
							formObj.attr("method", "get");
							formObj.submit();
						})
						// 삭제
						$(".delete_btn").on("click", function() {

							var deleteYN = confirm("삭제하시겠습니가?");
							if (deleteYN == true) {

								formObj.attr("action", "/board/delete");
								formObj.attr("method", "post");
								formObj.submit();

							}
						})
						// 취소
						$(".list_btn").on("click", function() {

							location.href = "/board/list";
							
						})

						// 목록
						$(".list_btn")
								.on(
										"click",
										function() {

											location.href = "/board/list?page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}&keyword=${scri.keyword}";
										})

						//댓글작성
						$(".replyWriteBtn").on("click", function() {
							var formObj = $("form[name='replyForm']");
							formObj.attr("action", "/board/replyWrite");
							formObj.submit();
						});
						//댓글 수정 View
						$(".replyUpdateBtn")
								.on(
										"click",
										function() {
											location.href = "/board/replyUpdateView?bno=${read.bno}"
													+ "&page=${read.member_no}"
													+ "&page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}"
													+ "&keyword=${scri.keyword}"
													+ "&rno="
													+ $(this).attr("data-rno");
										});
						//댓글 삭제 View
						$(".replyDeleteBtn")
								.on(
										"click",
										function() {
											location.href = "/board/replyDeleteView?bno=${read.bno}"
													+ "&page=${scri.page}"
													+ "&perPageNum=${scri.perPageNum}"
													+ "&searchType=${scri.searchType}"
													+ "&keyword=${scri.keyword}"
													+ "&rno="
													+ $(this).attr("data-rno");
										});
					})

	//댓글 아무것도 입력 안하고 작성 시 알람
	$(document).ready(function() {
		var formObj = $("form[name='replyForm']");
		$(".replyWriteBtn").on("click", function() {
			var result = fn_valiChk();
			if (result) {
				history.go(0);
			} else {
				alert("댓글이 등록되었습니다.")
			}
		});
	})
	function fn_valiChk() {
		var regForm = $("form[name='replyForm'] .chk2").length;
		for (var i = 0; i < regForm; i++) {
			if ($(".chk2").eq(i).val() == "" || $(".chk2").eq(i).val() == null) {
				alert($(".chk2").eq(i).attr("title"));
				return true;
			}
		}
		return false;
	}
</script>

<body>
	<jsp:include page="../nav2.jsp" />

	<div class="container">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />

		<section id="container">
			<form name="readForm" role="form" method="post">
				<input type="hidden" name="member_no" value="${member.member_no}">
				<input type="hidden" id="bno" name="bno" value="${read.bno}" /> <input
					type="hidden" id="page" name="page" value="${scri.page}"> <input
					type="hidden" id="perPageNum" name="perPageNum"
					value="${scri.perPageNum}"> <input type="hidden"
					id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword"
					value="${scri.keyword}">
			</form>

			<div class="shadow-sm p-3 mb-5 bg-body rounded">
				<div class="form-group ">
					<label for="title" class="col-sm-2 control-label">제목</label> <input
						type="text" id="title" name="title" class="form-control"
						value="${read.title}" readonly="readonly" />
				</div>
				<br />
				<div class="form-group">
					<label for="content" class="col-sm-2 control-label">내용</label>
					<textarea id="content" name="content" class="fulltext form-control"
						onkeydown="resize(this)" onkeyup="resize(this)"
						readonly="readonly" style="height: 330px;"><c:out
							value="${read.content}" /></textarea>
				</div>
				<br />
				<div class="form-group">
					<div class="container text-center">
						<div class="row">
							<div class="col">
								<label for="writer" class="col-sm-2 control-label">작성자</label> <input
									type="text"
									style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;"
									id="writer" name="name" value="${read.name}"
									readonly="readonly" />
							</div>
							<div class="col">
								<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
								<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />
							</div>
						</div>
					</div>
				</div>

				<br />
				<div class="container text-left">
					<div class="row">
						<div class="col">
							<div class="d-grid gap-2 d-md-block">
								<button type="submit" class="list_btn btn btn-dark">목록</button>
							</div>
						</div>
						<c:if test="${member != null && member.name == read.name}">
							<div class="col">
								<div class="d-grid gap-2 d-md-flex justify-content-md-end">
									<button type="submit" class="update_btn btn btn-secondary">수정</button>
									<button type="submit" class="delete_btn btn btn-danger">삭제</button>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>

<!-- 댓글 시작 -->
			<form name="replyForm" method="post" class="form-horizontal shadow-sm p-3 mb-5 bg-body rounded">
				<input type="hidden" id="bno" name="bno" value="${read.bno}" /> <input
					type="hidden" id="page" name="page" value="${scri.page}"> <input
					type="hidden" id="perPageNum" name="perPageNum"
					value="${scri.perPageNum}"> <input type="hidden"
					id="searchType" name="searchType" value="${scri.searchType}">
				<input type="hidden" id="keyword" name="keyword"
					value="${scri.keyword}">

				<!-- 댓글작성  -->
				<c:if test="${member != null}">
					<div class="form-group">
						<label for="writer" class="col-sm-2 control-label">댓글 작성자</label>
						<div class="col-sm-10">
							<input type="text" id="writer" name="name" class="form-control"
								value="${member.name}"
								style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;"
								readonly="readonly" />
						</div>
					</div>
					<div class="form-group">
						<label for="content" class="col-sm-2 control-label">댓글 내용</label>
						<div>
							<input type="text" id="content" name="content"
								class="chk2 form-control" title="댓글 내용을 입력하세요." />
						</div>
					</div>
					<br />
					<div class="form-group">
						<input type="hidden" name="member_no" value="${member.member_no}">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="replyWriteBtn btn btn-success">작성</button>
						</div>
					</div>
				</c:if>
			</form>

			<!-- 댓글목록 -->
			<div id="reply">

				<ol class="replyList shadow-sm p-3 mb-5 bg-body rounded">
					<c:forEach items="${replyList}" var="replyList">
						<li>
							<p>
							<div class="container text-center">
								<div class="row">
									<div class="col">작성자 : ${replyList.name}</div>
									<div class="col"></div>
									<div class="col">
										작성 날짜 :
										<fmt:formatDate value="${replyList.regdate}"
											pattern="yyyy-MM-dd" />
									</div>
								</div>
							</div>
							</p>
							<div class="form-control">
								<p>${replyList.content}</p>
							</div> 
							<br/> 
							<c:if test="${member != null && member.name == replyList.name}">
								<div class="d-grid gap-2 d-md-flex justify-content-md-end">
									<button type="button" class="replyUpdateBtn btn btn-secondary"
										style="-bs-btn-padding-y: .25rem; - -bs-btn-padding-x: .5rem; - -bs-btn-font-size: .75rem;"
										data-rno="${replyList.rno}">수정</button>
									<button type="button" class="replyDeleteBtn btn btn-danger"
										style="-bs-btn-padding-y: .25rem; - -bs-btn-padding-x: .5rem; - -bs-btn-font-size: .75rem;"
										data-rno="${replyList.rno}">삭제</button>
								</div>
							</c:if>
						</li>
					</c:forEach>
				</ol>
			</div>

		</section>
		<hr/>
	</div>
	<div>
		<jsp:include page="../footer.jsp" />
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

</body>
</html>