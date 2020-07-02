<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="kr">
<head>
	<title>ASSA Camping - 나혼자간다</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="ASSA Camping - 나혼자간다">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="${contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/css/user.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/css/user_responsive.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/css/member.css" />
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
	<section class="section-user container body-container py-5">
		<form name="loginform" class="loginform text-center" action="${contextPath}/userCon/loginAction.do" method="post">
			<div class="form-label-group">
				<input type="text" class="form-control" placeholder="아이디를 입력하세요." name="userId" id="userId" maxlength="20" required autofocus />
				<label for="userId">아이디</label>
			</div>
			<div class="form-label-group">
				<input type="password" class="form-control mb-3" placeholder="비밀번호를 입력하세요." name="userPw" id="userPw" maxlength="20" required />
				<label for="userPw">비밀번호</label>
			</div>
			<button type="submit" class="btn btn-lg btn-primary btn-block mb-5">로그인</button>
			<button type="button" class="btn btn-link" onclick="location.href='${contextPath}/userCon/userForm.do'">회원가입</button>
		</form>
	</section>
	
	<!-- Footer -->
	<jsp:include page="../inc/footer.jsp" />
</div>

<script src="${contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${contextPath}/js/popper.js"></script>
<script src="${contextPath}/js/bootstrap.min.js"></script>
<script src="${contextPath}/plugins/easing/easing.js"></script>
<script src="${contextPath}/plugins/parallax-js-master/parallax.min.js"></script>
<script src="${contextPath}/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="${contextPath}/plugins/malihu-custom-scrollbar/jquery.mCustomScrollbar.js"></script>
<script src="${contextPath}/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="${contextPath}/js/user_custom.js"></script>
</body>
</html>