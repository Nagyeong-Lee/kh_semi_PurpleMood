<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 조회</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style>
@font-face {
	font-family: 'DungGeunMo';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/DungGeunMo.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.dongfont {
	font-family: 'DungGeunMo';
}

* {
	box-sizing: border-box;
	text-align: center;
}

.container {
	margin: auto;
	padding: 10px;
}

.header {
	height: 100px;
	line-height: 100px;
	font-size: x-large;
	color: white;
	background-color: #03001e;
	font-family: 'DungGeunMo';
}

.navi {
	background-color: #58257920;
}

.title, .meg {
	height: 40px;
	line-height: 40px;
}

.contentTitles {
	overflow: hidden;
	background-color: #431e5c60;
}

.contentTitle {
	float: left;
	border: 1px solid;
}

.contents {
	overflow: hidden;
}

.content {
	float: left;
	border: 1px solid;
	height: 50px;
	word-break: break-all
}

button {
	margin-top: 10px;
}
</style>

</head>
<body>
	<div class="container">
		<div class="header">
			<div>
				관리자 페이지 <a href="/main"><img src="img/title.png" style="width: 180px; height: 70px;"></a>
			</div>
		</div>
		<div class="navi">
			<ul class="nav nav-tabs">
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false" style="color: black;">회원관리</a>
					<ul class="dropdown-menu">
						<li id="memberAllOutputLi"><a class="dropdown-item" href="/memberOutput.manager"> <strong>전체조회</strong>
						</a></li>
					</ul></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false" style="color: black;">콘텐츠관리</a>
					<ul class="dropdown-menu">
						<li id="MovieOutputLi"><a class="dropdown-item" href="/movieOutput.manager"><strong>영화조회</strong></a></li>
						<li id="DramaOutputLi"><a class="dropdown-item" href="dramaOutput.manager"><strong>드라마조회</strong></a></li>
					</ul></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false" style="color: black;">게시판관리</a>
					<ul class="dropdown-menu">
						<li id="boardComplainOutputLi"><a class="dropdown-item" href="#"> <strong>신고게시글조회</strong>
						</a></li>
						<li id="commentComplainOutputLi"><a class="dropdown-item" href="#"> <strong>신고댓글조회</strong>
						</a></li>
					</ul></li>
			</ul>
		</div>
		<div class="main">
			<div class="memberAllOutput">
				<div class="title"><strong>콘텐츠관리 > 영화조회</strong></div>
				<div class="contentTitles">
					<div class="contentTitle" style="width: 10%;">아이디</div>
					<div class="contentTitle" style="width: 50%;">제목</div>
					<div class="contentTitle" style="width: 7%;">장르</div>
					<div class="contentTitle" style="width: 7%;">넷플릭스</div>
					<div class="contentTitle" style="width: 7%;">웨이브</div>
					<div class="contentTitle" style="width: 7%;">디즈니</div>
					<div class="contentTitle" style="width: 7%;">왓챠</div>
					<div class="contentTitle" style="width: 5%;">삭제</div>
				</div>

				<!-- 영화 조회 -->
				<c:forEach var="i" items="${list}">
					<div class="contents">
						<div class="content" style="width: 10%;">${i.mv_id}</div>
						<div class="content" style="width: 50%;">${i.mv_title}</div>
						<div class="content" style="width: 7%;">${i.mv_genre}</div>
						<div class="content" style="width: 7%;">${i.mv_ottNF}</div>
						<div class="content" style="width: 7%;">${i.mv_ottWV}</div>
						<div class="content" style="width: 7%;">${i.mv_ottDZ}</div>
						<div class="content" style="width: 7%;">${i.mv_ottWC}</div>
						<div class="content" style="width: 5%;">
							<button type="button" id="${i.mv_id}">삭제</button>
						</div>
					</div>
					<script>
					$(function() {
						$("#${i.mv_id}").on("click", function() {
							if (confirm(${i.mv_id}+"번의 콘텐츠를 삭제하시겠습니까?")) {
								 location.href="/movieDelete.manager?mv_id="+${i.mv_id}
								alert("삭제되었습니다.");
							} else {
								alert("취소되었습니다.");
							}
						});
					})
					
					
					</script>
				</c:forEach>
				<script>
					$(function() {
						$("#boardComplainOutputLi").on("click", function() {
								alert("준비 중입니다.");
						});
					})
					
					$(function() {
						$("#commentComplainOutputLi").on("click", function() {
								alert("준비 중입니다.");
						});
					})
					</script>
			</div>
		</div>
</body>
</html>