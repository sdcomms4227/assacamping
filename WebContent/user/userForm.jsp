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
							<div class="home_title">Join</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- user-->
	<section class="section-userForm container body-container py-5">
		<form action="${contextPath}/userCon/addUser.do" method="post">
			<div class="input-group mb-3">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="userId" class="input-group-text">아이디</label>
					</div>
					<input type="text" class="form-control" name="userId" id="userId" maxlength="20" required>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="userPw" class="input-group-text">비밀번호</label>
					</div>
					<input type="text" class="form-control" name="userPw" id="userPw" maxlength="20" required>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="userPw2" class="input-group-text">비밀번호 확인</label>
					</div>
					<input type="text" class="form-control" name="userPw2" id="userPw2" maxlength="20" required>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="userName" class="input-group-text">이름</label>
					</div>
					<input type="text" class="form-control" name="userName" id="userName" maxlength="20" required>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="userPhone" class="input-group-text">전화번호</label>
					</div>
					<input type="text" class="form-control" name="userPhone" id="userPhone" maxlength="20" required>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="userEmail" class="input-group-text">이메일</label>
					</div>
					<input type="text" class="form-control" name="userEmail" id="userEmail" maxlength="20" required>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="userZipcode" class="input-group-text">우편번호</label>
					</div>
					<input type="text" class="form-control" name="userZipcode" id="userZipcode" maxlength="20" required>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="userAddress1" class="input-group-text">주소</label>
					</div>
					<input type="text" class="form-control" name="userAddress1" id="userAddress1" maxlength="20" required>
				</div>
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<label for="userAddress2" class="input-group-text">상세주소</label>
					</div>
					<input type="text" class="form-control" name="userAddress2" id="userAddress2" maxlength="20" required>
				</div>
			</div>
			<div class="text-center my-5">
				<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
				<button type="submit" class="btn btn-primary">회원가입</button>
			</div>
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