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
<c:if test='${msg=="id"}'>
	<script type="text/javascript">
		window.onload = function() {
			alert("존재하지 않는 ID입니다.");
		}
	</script>
</c:if>
</head>
<body>

<div class="super_container">

	<!-- Header -->
	<jsp:include page="../inc/header.jsp" />

	<!-- Menu -->
	<jsp:include page="../inc/menu.jsp" />
	
	<!-- Home -->	
	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="${contextPath}/images/categories.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_container">
						<div class="home_content">
							<div class="home_title">Login</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- user-->
	<section class="section-user">
		<div class="container body-container my-5 py-5">
			<form name="loginform" class="loginform text-center" action="${contextPath}/usr/loginAction.do" method="post">
				<div class="form-label-group">
					<input type="text" class="form-control" placeholder="아이디를 입력하세요." name="userId" id="userId" maxlength="20" required autofocus />
					<label for="userId">아이디</label>
				</div>
				<div class="form-label-group">
					<input type="password" class="form-control" placeholder="비밀번호를 입력하세요." name="userPw" id="userPw" maxlength="20" required />
					<label for="userPw">비밀번호</label>
				</div>
				<button type="submit" class="btn btn-xl btn-primary btn-block mb-5">로그인</button>
				<hr />
				<a class="btn btn-sm btn-secondary-link" href="javascript:alert('준비중입니다.')">아이디 찾기</a>
				<span class="text-muted">|</span>
				<a class="btn btn-sm btn-secondary-link" href="javascript:alert('준비중입니다.')">비밀번호 찾기</a>
				<span class="text-muted">|</span>
				<a class="btn btn-sm btn-secondary-link" href="${contextPath}/usr/userForm.do">회원가입</a>
			</form>
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
</body>
</html>