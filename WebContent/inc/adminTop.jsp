<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>
<c:set var="userId" value="${sessionScope.userId}" />
<c:set var="alertMsg" value="${alertMsg}" />
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="ASSA Camping - 관리자모드">
<meta name="format-detection" content="no">
<meta name="format-detection" content="telephone=no, email=no, address=no">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ASSA Camping - 관리자모드</title>
<link rel="stylesheet" href="${contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${contextPath}/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="${contextPath}/css/admin.css">
<link rel="stylesheet" href="${contextPath}/css/board.css" />
<script src="${contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${contextPath}/js/popper.js"></script>
<script src="${contextPath}/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
<c:if test='${userId != "admin"}'>
	<script>
		alert("관리자만 접근할 수 있습니다.");
		location.href = "${contextPath}/userServlet/logout.do";
	</script>
</c:if>
<c:if test="${alertMsg!=null}">
	<script>
		alert("${alertMsg}");
	</script>
	<c:remove var="alertMsg" />
</c:if>
</head>
<body>
<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
	<a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3 text-truncate" href="${contextPath}">ASSA Camping - 관리자모드</a>
	<button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse" data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<ul class="navbar-nav px-3">
		<li class="nav-item text-nowrap"><a class="nav-link" href="${contextPath}/userServlet/logout.do">Sign out</a></li>
	</ul>
</nav>
<div class="container-fluid">
	<div class="row">
		<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
			<div class="sidebar-sticky pt-3">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="${contextPath}/adminServlet/admin.do"> <span data-feather="home"></span> 대시보드 <span class="sr-only">(current)</span> </a></li>
				</ul>
				<hr />
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="${contextPath}/userAdminServlet/listUser.do"> <span data-feather="users"></span> 회원 관리 </a></li>
					<li class="nav-item"><a class="nav-link" href="${contextPath}/orderAdminServlet/listOrder.do"> <span data-feather="file"></span> 주문 관리 </a></li>
					<li class="nav-item"><a class="nav-link" href="${contextPath}/productAdminServlet/listProduct.do"> <span data-feather="shopping-cart"></span> 상품 관리 </a></li>
				</ul>
				<hr />
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="${contextPath}/qnaAdminServlet/listQna.do"> <span data-feather="file-text"></span> 상품 문의 </a></li>
					<li class="nav-item"><a class="nav-link" href="${contextPath}/reviewAdminServlet/listReview.do"> <span data-feather="file-text"></span> 상품 후기 </a></li>
				</ul>
				<hr />
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link" href="${contextPath}/faqAdminServlet/listFaq.do"> <span data-feather="file-text"></span> 자주 하는 질문 </a></li>
					<li class="nav-item"><a class="nav-link" href="${contextPath}/campingAdminServlet/listCamping.do"> <span data-feather="file-text"></span> 캠핑정보 </a></li>
					<li class="nav-item"><a class="nav-link" href="${contextPath}/eventAdminServlet/listEvent.do"> <span data-feather="file-text"></span> 이벤트 </a></li>
				</ul>
				<hr />
			</div>
		</nav>

		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pt-3">