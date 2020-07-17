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
							<div class="home_title">로그인</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- user-->
	<section class="section-user">
		<div class="container body-container my-5 py-5">
			<form name="loginform" class="loginForm text-center" action="${contextPath}/userServlet/loginAction.do" method="post">
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
				<a class="btn btn-sm btn-secondary-link" href="${contextPath}/userServlet/findId.do">아이디 찾기</a>
				<span class="text-muted">|</span>
				<a class="btn btn-sm btn-secondary-link" href="${contextPath}/user/findPw.jsp">비밀번호 찾기</a>
				<span class="text-muted">|</span>
				<a class="btn btn-sm btn-secondary-link" href="${contextPath}/userServlet/agreeForm.do">회원가입</a>
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
<c:choose>
	<c:when test='${msg=="id"}'>
		<script>
			window.onload = function(){
				window.alert("존재하지 않는 아이디 입니다.");
			}
		</script>
	</c:when>
	<c:when test='${msg=="pw"}'>
		<script>
			window.onload = function(){
				window.alert("비밀번호가 일치하지 않습니다.");
			}
		</script>
	</c:when>
	<c:when test='${msg == "addUser"}'>
		<script>
			window.onload = function(){
				window.alert("회원가입이 완료되었습니다.");
			}		
		</script>
	</c:when>	
</c:choose>
</body>
</html>