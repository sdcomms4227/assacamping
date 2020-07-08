<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%request.setCharacterEncoding("UTF-8");
	String userId =(String)request.getAttribute("userId");
	System.out.println("userId3" + userId);
%>
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
<c:choose>
	<c:when test='${msg=="xId"}'>
		<script type="text/javascript">
			window.onload = function(){
				window.alert("회원정보가 존재하지 않습니다.");
			}
		</script>
	</c:when>
</c:choose>
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
							<div class="home_title">FindId</div>
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
			<form name="findId" class="loginform text-center" action="${contextPath}/userCon/findId.do" method="post">
				<div class="form-label-group">
					<input type="text" class="form-control" placeholder="이름을 입력하세요." name="userName" id="userName" maxlength="20" required autofocus />
					<label for="userName">이름</label>
				</div>
				<div class="form-label-group">
					<input type="email" class="form-control" placeholder="이메일을 입력하세요." name="userEmail" id="userEmail" maxlength="20" required />
					<label for="userPw">이메일</label>
				</div>
				<button type="submit" class="btn btn-xl btn-primary btn-block mb-5">아이디 찾기</button>
				<hr />
			</form>
			</c:when>
			<c:otherwise>
				아이디는 <%=userId %> 입니다.
			</c:otherwise>
		</c:choose>
			
		</div>
	</section>
	<!-- 조회되어온 아이디가 잇으면 이프문을 걸어서 폼부분 숨기고 아이디 정보 출력
	 아이디값이 공백이면 경고창출력하고 현재폼페이지를 그대로 출력 -->
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