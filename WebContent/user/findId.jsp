<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<title>ASSA Camping - 나혼자간다</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="ASSA Camping - 나혼자간다">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/css/bootstrap_custom.css">
<link rel="stylesheet" href="${contextPath}/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextPath}/css/common.css">
<link rel="stylesheet" href="${contextPath}/css/common_responsive.css">
<link rel="stylesheet" href="${contextPath}/css/user.css">
<link rel="stylesheet" href="${contextPath}/css/user_responsive.css">
</head>
<body>

<div class="super_container">

	<!-- Header -->
	<jsp:include page="../inc/header.jsp" />

	<!-- Menu -->
	<jsp:include page="../inc/menu.jsp" />
	
	<!-- Home -->	
	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="${contextPath}/images/user.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_container">
						<div class="home_content">
							<div class="home_title">아이디 찾기</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- user-->
	<section class="section-user">
		<div class="container body-container my-5 py-5">
			<c:choose>
				<c:when test="${userId == null }">
					<form name="f" class="findIdForm" action="${contextPath}/userServlet/findIdAction.do" method="post" onsubmit="return check();">
						<h4 class="form-text mb-4">이름과 이메일를 입력해 주세요.</h4>
						<div class="form-label-group">
							<input type="text" class="form-control" placeholder="이름" name="userName" id="userName" required autofocus />
							<label for="userName">이름</label>
						</div>
						<div class="form-label-group">
							<input type="email" class="form-control" placeholder="이메일" name="userEmail" id="userEmail" required />
							<label for="userName">이메일</label>
						</div>
						<button type="submit" class="btn btn-lg btn-primary btn-block my-5">아이디 찾기</button>
					</form>
				</c:when>
				<c:otherwise>
					<div class="userForm text-center">
						<div class="bg-light py-5">
							<h3>고객님의 아이디는</h3>
							<h2 class="p-3 text-danger">${userId}</h2>
							<h3>입니다.</h3>
						</div>
						<a class="btn btn-lg btn-secondary my-5" href="${contextPath}/userServlet/login.do">로그인 페이지로 이동하기</a>
					</div>
				</c:otherwise>  
			</c:choose>
		</div>
	</section>
	
	<!-- Footer -->
	<jsp:include page="../inc/footer.jsp" />
</div>

<script src="${contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${contextPath}/js/popper.js"></script>
<script src="${contextPath}/js/bootstrap.min.js"></script>
<script src="${contextPath}/plugins/easing/easing.js"></script>
<script src="${contextPath}/plugins/parallax-js-master/parallax.min.js"></script>
<script src="${contextPath}/js/custom.js"></script>
<script src="${contextPath}/js/user_custom.js"></script>
<c:choose>
	<c:when test='${msg=="userId"}'>
		<script>
			window.onload = function(){
				window.alert("회원정보가 존재하지 않습니다.");
			}
		</script>
	</c:when>
</c:choose>
</body>
</html>