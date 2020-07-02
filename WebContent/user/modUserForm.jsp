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
<link rel="stylesheet" type="text/css" href="${contextPath}/css/bootstrap_custom.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/common.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/user.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/user_responsive.css">
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
	<section class="section-user">
		<div class="container body-container my-5 py-5">
			<form class="userForm" action="${contextPath}/userCon/modUser.do?userId=${userInfo.userId}" method="post">
				<div class="form-group mb-3">
					<label class="font-weight-bold" for="userId">아이디</label>
					<input type="text" class="form-control form-control-lg" name="userId" id="userId" value="${userInfo.userId}" disabled>
				</div>
				<div class="form-group mb-3">
					<label class="font-weight-bold" for="userPw">비밀번호</label>
					<input type="password" class="form-control form-control-lg" name="userPw" id="userPw" value="${userInfo.userPw}" required>
				</div>
				<div class="form-group mb-3">					
					<label class="font-weight-bold" for="userName">이름</label>
					<input type="text" class="form-control form-control-lg" name="userName" id="userName" value="${userInfo.userName}" required>
				</div>
				<div class="form-group mb-3">					
					<label class="font-weight-bold" for="userPhone">전화번호</label>
					<input type="text" class="form-control form-control-lg" name="userPhone" id="userPhone" value="${userInfo.userPhone}" required>
				</div>
				<div class="form-group mb-3">					
					<label class="font-weight-bold" for="userEmail">이메일</label>
					<input type="text" class="form-control form-control-lg" name="userEmail" id="userEmail" value="${userInfo.userEmail}" required>
				</div>
				<div class="form-group mb-3">					
					<label class="font-weight-bold" for="userZipcode">우편번호</label>
					<input type="text" class="form-control form-control-lg" name="userZipcode" id="userZipcode" value="${userInfo.userZipcode}" required>
				</div>
				<div class="form-group mb-3">					
					<label class="font-weight-bold" for="userAddress1">주소</label>
					<input type="text" class="form-control form-control-lg" name="userAddress1" id="userAddress1" value="${userInfo.userAddress1}" required>
				</div>
				<div class="form-group mb-3">					
					<label class="font-weight-bold" for="userAddress2">상세주소</label>
					<input type="text" class="form-control form-control-lg" name="userAddress2" id="userAddress2" value="${userInfo.userAddress2}" required>
				</div>
				<button type="submit" class="btn btn-xl btn-primary btn-block">수정하기</button>
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
<script src="${contextPath}/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="${contextPath}/plugins/malihu-custom-scrollbar/jquery.mCustomScrollbar.js"></script>
<script src="${contextPath}/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="${contextPath}/js/custom.js"></script>
<script src="${contextPath}/js/user_custom.js"></script>
</body>
</html>








