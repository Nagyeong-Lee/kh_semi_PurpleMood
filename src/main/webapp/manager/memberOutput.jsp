<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 조회</title>
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
						<li id="DramaOutputLi"><a class="dropdown-item" href="/dramaOutput.manager"><strong>드라마조회</strong></a></li>
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
				<div class="title">
					<strong>회원관리 > 전체조회</strong>
				</div>
				<div class="contentTitles">
					<div class="contentTitle" style="width: 10%;">아이디</div>
					<div class="contentTitle" style="width: 9%;">닉네임</div>
					<div class="contentTitle" style="width: 7%;">이름</div>
					<div class="contentTitle" style="width: 9%;">전화번호</div>
					<div class="contentTitle" style="width: 15%;">이메일</div>
					<div class="contentTitle" style="width: 6%;">우편번호</div>
					<div class="contentTitle" style="width: 20%;">주소</div>
					<div class="contentTitle" style="width: 11%;">상세주소</div>
					<div class="contentTitle" style="width: 7%;">가입일</div>
					<div class="contentTitle" style="width: 6%;">회원탈퇴</div>
				</div>

				<!-- 회원 전체 조회 -->
				<c:forEach var="i" items="${list}">
					<div class="contents">
						<div class="content" style="width: 10%;">${i.id}</div>
						<div class="content" style="width: 9%;">${i.nickname}</div>
						<div class="content" style="width: 7%;">${i.name}</div>
						<div class="content" style="width: 9%;">${i.phone}</div>
						<div class="content" style="width: 15%;">${i.email}</div>
						<div class="content" style="width: 6%;">${i.postcode}</div>
						<div class="content" style="width: 20%;">${i.address1}</div>
						<div class="content" style="width: 11%;">${i.address2}</div>
						<div class="content" style="width: 7%;">${i.formedDate}</div>
						<div class="content" style="width: 6%;">
							<button type="button" id="${i.id}">탈퇴</button>
						</div>
					</div>
					<script>
						$(function() {
							$("#${i.id}")
									.on(
											"click",
											function() {
												if (confirm("해당 회원을 탈퇴시키겠습니까?")) {
													location.href = "/memberDelete.manager?id=${i.id}";
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