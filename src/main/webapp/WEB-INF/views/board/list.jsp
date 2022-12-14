<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>게시판</title>
<script src="https://kit.fontawesome.com/e4a42c4ca5.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.11.3.js"></script>
<style type="text/css">
a {
	list-style: none;
	text-decoration: none;
	color: black;
	font-weight: bolder;
}
</style>
</head>
<body>
	<jsp:include page="../nav2.jsp" />

	<div class="container">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />

		<div class="container text-left">
			<div class="row">
				<div class="col">
					<div class="d-grid gap-2 d-md-block">
						<button type="submit" class="list_btn btn btn-dark">
							<a style="list-style: none; text-decoration: none; color: white;" href="/board/list">목록</a>
						</button>
					</div>
				</div>
				<!-- 로그인 상태에 게시판 글 작성 가능 sh 추가 수정 start-->
				<c:if test="${member != null}">
					<div class="col">
						<div class="d-grid gap-2 d-md-flex justify-content-md-end">
							<button type="submit" class="delete_btn btn btn-success">
								<a style="list-style: none; text-decoration: none; color: white;" href="/board/writeView">글 작성</a>
							</button>
						</div>
					</div>
				</c:if>
				<!-- sh 추가 수정 end-->
			</div>
		</div>

		<section class="shadow-sm p-3 mb-5 bg-body rounded" id="container">
			<form role="form" method="get">
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">작성자</th>
							<th scope="col">등록일</th>
						</tr>
					</thead>

					<tbody class="table-group-divider">
						<c:forEach items="${list}" var="list">
							<tr>
								<td>
									<c:out value="${list.bno}" />
								</td>
								<td>
									<a href="/board/readView?bno=${list.bno}&
															page=${scri.page}&
															perPageNum=${scri.perPageNum}&
															searchType=${scri.searchType}&
															keyword=${scri.keyword}">
										<c:out value="${list.title}" />
									</a>
								</td>
								<td>
									<c:out value="${list.name}" />
								</td>
								<td>
									<fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd" />
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="search row">
					<div class="col-xs-2 col-sm-2">
						<select name="searchType" class="form-select" aria-label="Default select example">
							<option value="n" <c:out value="${scri.searchType == null ? 'selected' : ''}"/>>검색 범위</option>
							<option value="t" <c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
							<option value="c" <c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
							<option value="w" <c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
							<option value="tc" <c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
						</select>
					</div>

					<div class="col-xs-10 col-sm-10">
						<div class="input-group">
							<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control" />
							<span class="input-group-btn"> &nbsp;&nbsp;&nbsp;
								<button id="searchBtn" type="button" class="btn btn-dark">검색</button>
							</span>
						</div>
					</div>
					<script>
    				$(function(){
    			        $('#searchBtn').click(function() {
    			          self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
    			        });
    			      });  
    				</script>
				</div>

				<br>
				<div>
					<ul class="pagination pagination-sm justify-content-center">
						<c:if test="${pageMaker.prev}">
							<li class="page-item"><a class="page-link text-dark" href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							<li class="page-item" <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}"/>>
							<li class="page-item"><a class="page-link text-dark" href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li class="page-item"><a class="page-link text-dark" href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</div>
			</form>
		</section>
		<hr />
	</div>
	<div>
		<jsp:include page="../footer.jsp" />
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>