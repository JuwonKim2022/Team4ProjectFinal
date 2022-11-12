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
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/board/readView?bno=${update.bno}"
				   + "&page=${scri.page}"
				   + "&perPageNum=${scri.perPageNum}"
				   + "&searchType=${scri.searchType}"
				   + "&keyword=${scri.keyword}";
			})
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/board/list";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
	</script>
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
              <li><hr class="dropdown-divider"></li>
              <li><a class="dropdown-item" href="#">내 기록</a></li>
              <li><a class="dropdown-item" href="#">북마크</a></li>
            </ul>
          </li>
          <!-- li class="nav-item3">
            <a class="nav-link active3" aria-current="page3" href="<c:url value='/member/login'/>">로그인</a>
          </li>
          <li class="nav-item4">
            <a class="nav-link active4" aria-current="page4" href="<c:url value='/signUp/signUp'/>">회원가입</a>
          </li-->
          <li class="nav-item3">
            <c:if test="${member != null}"><a class="nav-link active3" aria-current="page3" href="/member/logout">로그아웃</a></c:if>
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
        <form class="d-flex" role="search">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-secondary" type="submit">Search</button>
        </form>
      </div>
    </div>
  </nav>
	
		<div class="container">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<div class="container text-left">
  				<div class="row">
    				<div class="col">
      				<div class="d-grid gap-2 d-md-block">
								<button type="submit" class="list_btn btn btn-dark"><a style="list-style:none; text-decoration: none; color: white;" href="/board/list">목록</a></button>	
							</div>
    				</div>
    				<div class="col">
      				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
								<button type="submit" class="delete_btn btn btn-success"><a style="list-style:none; text-decoration: none; color: white;" href="/board/writeView">글 작성</a></button>
							</div>
    				</div>
  				</div>
			</div>
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/board/update">
					<input type="hidden" name="bno" value="${update.bno}" readonly="readonly"/>
					
					<div class="shadow-sm p-3 mb-5 bg-body rounded">
						<div class="form-group ">
							<label for="title"  class="col-sm-2 control-label">제목</label>
							<input type="text" id="title" name="title" value="${update.title}" class="chk form-control" title="제목을 입력하세요."/>
						</div>
						<br/>
						<div class="form-group ">
							<label for="content" class="col-sm-2 control-label">내용</label>
							<textarea id="content" name="content" class="chk fulltext form-control" title="내용을 입력하세요." style="height: 330px;"><c:out value="${update.content}" /></textarea>
						</div>
						<br/>
						<div class="form-group">
							<div class="container text-center">
  							<div class="row">
    							<div class="col">
    								<label for="writer" class="col-sm-2 control-label">작성자</label>
      							<input type="text" style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;" id="writer" name="writer" value="${update.writer}" readonly="readonly"/>
    							</div>
    							<div class="col">
    								<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
    								<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd"/>
    							</div>
  							</div>
							</div>
						</div>
					</div>	
					
					<div>
						<button type="submit" class="update_btn btn btn-success">저장</button>
						<button type="submit" class="cancel_btn btn btn-danger">취소</button>
					</div>
				</form>
			</section>
			<hr />
		</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	</body>
</html>