<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<c:set var="userId" value="${userId}" />
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

<div class="container">
	<form class="checkform py-5" action="${contextPath}/userServlet/idCheck.do" method="post" name="checkform">
		<div class="input-group">
			<div class="input-group-prepend">
				<label for="userId" class="input-group-text">아이디</label>
			</div>
			<input type="text" class="form-control" name="userId" id="userId" value="${userId}" maxlength="20" required>
			<div class="input-group-append">
				<button type="submit" class="btn btn-secondary">중복확인</button>
			</div>
		</div>
	</form>
</div>

<c:if test='${msg=="allow"}'>
	<div class="text-center">
		<button type="button" class="btn btn-primary" onclick="result()">사용하기</button>
	</div>
</c:if>

<script>
	function result() {
		opener.document.userForm.userId.value = document.checkform.userId.value;
		opener.document.userForm.idCheckState.value = 1;
		window.close();
	}
</script>

<c:choose>
	<c:when test='${msg=="char"}'>
		<script>
			window.onload = function() {
				window.alert("아이디를 4~12자까지 입력해주세요.");
			}
		</script>
	</c:when>
	<c:when test='${msg=="used"}'>
		<script>
			window.onload = function() {
				window.alert("사용중인 아이디 입니다.");
			}
		</script>
	</c:when>
	<c:when test='${msg=="allow"}'>
		<script>
			window.onload = function() {
				window.alert("사용가능한 아이디 입니다.");
			}
		</script>
	</c:when>
</c:choose>
	
</body>
</html>