<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.vo.MemberVO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- %
	MemberVO memberVO = (MemberVO)session.getAttribute("member"); 
out.print(memberVO);
%-->
<html>
<head>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>게시판</title>
<script src="https://kit.fontawesome.com/e4a42c4ca5.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
	</script>
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
				<div class="col">
					<div class="d-grid gap-2 d-md-flex justify-content-md-end"></div>
				</div>
			</div>
		</div>

		<section id="container">
			<form name="writeForm" method="post" action="/board/write">

				<input type="hidden" name="member_no" value="${member.member_no}">

				<div class="shadow-sm p-3 mb-5 bg-body rounded">
					<div class="form-group ">
						<label for="title" class="col-sm-2 control-label">제목</label>
						<input type="text" id="title" name="title" class="chk form-control" title="제목을 입력하세요." />
					</div>
					<br />
					<div class="form-group">
						<label for="content" class="col-sm-2 control-label">내용</label>
						<textarea id="content" name="content" class="chk form-control" title="내용을 입력하세요." style="height: 330px;"></textarea>
					</div>
					<br />
					<div class="form-group">
						<div class="container text-center">
							<div class="row">
								<!-- 게시판 글 작성자 id 표기 및 수정 불가 표시 sh 추가 수정 start-->
								<div class="col">
									<label for="writer" class="col-sm-2 control-label">작성자</label>
									<input type="text" style="border: none; border-right: 0px; border-top: 0px; boder-left: 0px; boder-bottom: 0px;" id="writer" name="name" value="${member.name}" readonly="readonly" />
								</div>
								<!-- sh 추가 수정 end-->
								<div class="col">
									<button class="write_btn btn btn-success" type="submit">작성</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
		</section>
		<hr />
	</div>
	<div>
		<jsp:include page="../footer.jsp" />
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>