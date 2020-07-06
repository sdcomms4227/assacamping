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
<link rel="stylesheet" href="${contextPath}/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" href="${contextPath}/css/common.css">
<link rel="stylesheet" href="${contextPath}/css/common_responsive.css">
<link rel="stylesheet" href="${contextPath}/css/user.css">
<link rel="stylesheet" href="${contextPath}/css/user_responsive.css">
<script type="text/javascript">
	function idCheck() {
		var id = document.f.userId.value;
		if(id == ""){
			alert("아이디를 입력해주세요.");
			document.f.userId.focus();
			return;
		}
		window.open("idCheck.jsp?userId=" + id,"", "width=400,height=240");
	}
</script>
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
			<form name="f" class="userForm" action="${contextPath}/userCon/addUser.do" method="post" onsubmit="return check();">
				<div class="form-group mb-3">
					<label class="font-weight-bold" for="userId">아이디</label>
					<input type="text" class="form-control form-control-lg" name="userId" id="userId" maxlength="20" required>
				</div>
				<div class="form-group mb-3">
					<button class="font-weight-bold" type="button" onclick="idCheck()">아이디 중복확인</button>
				</div>
				<div class="form-group mb-3">
					<label class="font-weight-bold" for="userPw">비밀번호</label>
					<input type="password" class="form-control form-control-lg" name="userPw" id="userPw" maxlength="20" required>
				</div>
				<div class="form-group mb-3"> 
					<label class="font-weight-bold" for="userPw2">비밀번호 재확인</label>
					<input type="password" class="form-control form-control-lg" name="userPw2" id="userPw2" maxlength="20" required>
				</div>
				<div class="form-group mb-3">					
					<label class="font-weight-bold" for="userName">이름</label>
					<input type="text" class="form-control form-control-lg" name="userName" id="userName" maxlength="20" required>
				</div>
				<div class="form-group mb-3">					
					<label class="font-weight-bold" for="userPhone">전화번호</label>
					<input type="text" class="form-control form-control-lg" name="userPhone" id="userPhone" maxlength="20" required>
				</div>
				<div class="form-group mb-3">					
					<label class="font-weight-bold" for="userEmail">이메일</label>
					<input type="email" class="form-control form-control-lg" name="userEmail" id="userEmail" maxlength="20" required>
				</div>
				<div class="form-group mb-3">					
					<label class="font-weight-bold" for="userZipcode">우편번호</label>
					<input type="text" class="form-control form-control-lg" name="userZipcode" id="userZipcode" maxlength="20" required>
				</div>
				<div class="form-group mb-3">					
					<label class="font-weight-bold" for="userAddress1">주소</label>
					<input type="text" class="form-control form-control-lg" name="userAddress1" id="userAddress1" maxlength="20" required>
				</div>
				<div class="form-group mb-3">					
					<label class="font-weight-bold" for="userAddress2">상세주소</label>
					<input type="text" class="form-control form-control-lg" name="userAddress2" id="userAddress2" maxlength="20" required>
				</div>
				<button type="submit" class="btn btn-xl btn-primary btn-block">가입하기</button>
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