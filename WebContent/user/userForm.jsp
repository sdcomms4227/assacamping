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
							<div class="home_title">회원가입</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- user-->
	<section class="section-user">
		<div class="container body-container my-5 py-5">
			<form name="userForm" class="userForm" action="${contextPath}/userServlet/addUser.do" method="post" onsubmit="return check();">
				<input type="hidden" name="idCheckState" value="0" />
				<div class="form-group mb-3">
					<label class="font-weight-bold" for="userId">아이디</label>
					<div class="input-group">
						<input type="text" class="form-control" name="userId" id="userId" onkeyup="resetCheck()" required />
						<div class="input-group-append">
							<button class="btn btn-secondary" type="button" onclick="idCheck()">아이디 중복확인</button>
						</div>
					</div>
				</div>
				<div class="form-group mb-3">
					<label class="font-weight-bold" for="userPw">비밀번호</label>
					<input type="password" class="form-control" name="userPw" id="userPw" required />
				</div>
				<div class="form-group mb-3"> 
					<label class="font-weight-bold" for="userPw2">비밀번호 재확인</label>
					<input type="password" class="form-control" name="userPw2" id="userPw2" required />
				</div>
				<div class="form-group mb-3">					
					<label class="font-weight-bold" for="userName">이름</label>
					<input type="text" class="form-control" name="userName" id="userName" required />
				</div>
				<div class="form-group mb-3">					
					<label class="font-weight-bold" for="userPhone">전화번호</label>
					<input type="tel" class="form-control" name="userPhone" id="userPhone" placeholder="010-0000-0000" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required />
				</div>
				<div class="form-group mb-3">					
					<label class="font-weight-bold" for="userEmail">이메일</label>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">@</span>
						</div>
						<input type="email" class="form-control" name="userEmail" id="userEmail" required>
					</div>
				</div>
				<div class="form-group mb-3">					
					<label class="font-weight-bold" for="userZipcode">우편번호</label>
					<div class="input-group">
						<input type="text" class="form-control" name="userZipcode" id="userZipcode" required />
						<div class="input-group-append">
							<button class="btn btn-secondary" type="button" onclick="postCode()">우편번호 검색</button>
						</div>
					</div>
				</div>
				<div class="form-group mb-3">					
					<label class="font-weight-bold" for="userAddress1">주소</label>
					<input type="text" class="form-control" name="userAddress1" id="userAddress1" required />
				</div>
				<div class="form-group mb-3">					
					<label class="font-weight-bold" for="userAddress2">상세주소</label>
					<input type="text" class="form-control" name="userAddress2" id="userAddress2" required />
				</div>
				<button type="submit" class="btn btn-lg btn-primary btn-block my-5">가입하기</button>
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function idCheck(){
		var id = document.userForm.userId.value;
		if(id==""){
			alert("아이디를 입력하세요.");
			document.userForm.userId.focus();
			return
		}
		window.open("${contextPath}/userServlet/idCheck.do?userId="+id, "" , "width=500,height=200")
	}
	function check(){
		if (document.userForm.idCheckState.value != 1) {
			confirm("아이디 중복체크를 해주세요.");
			return false;
		}
		if (document.userForm.userPw.value == "") {
            alert("비밀번호를 입력하지 않았습니다.")
            document.userForm.userPw.focus();
            return false;
        }
        if (userForm.userPw.value == userForm.userId.value) {
            alert("아이디와 비밀번호가 같습니다.")
            document.userForm.userPw.focus();
            return false;
        }
        if (document.userForm.userPw.value != document.userForm.userPw2.value) {
            alert("비밀번호가 일치하지 않습니다")
            document.userForm.userPw2.value = ""
            document.userForm.userPw2.focus();
            return false;
        }
	}
	function resetCheck() {
		document.userForm.idCheckState.value = 0;
	}
	function postCode() {
		new daum.Postcode({
			oncomplete:function(data) { 				
				$('[name=userZipcode]').val(data.zonecode);
				$('[name=userAddress1]').val(data.address);
				$('[name=userAddress2]').val(data.buildingName);
			}
		}).open();
	}
</script>
</body>
</html>