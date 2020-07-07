<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String uri = request.getRequestURI();
	String pageCode = uri.substring(uri.lastIndexOf("/") + 1, uri.lastIndexOf("."));
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="kr">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="ASSA Camping - 관리자모드">
	<meta name="format-detection" content="no">
	<meta name="format-detection" content="telephone=no, email=no, address=no">
	<title>ASSA Camping - 관리자모드</title>
	<link rel="stylesheet" type="text/css" href="${contextPath}/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="${contextPath}/css/admin.css">
	<script src="${contextPath}/js/jquery-3.2.1.min.js"></script>
	<script src="${contextPath}/js/popper.js"></script>
	<script src="${contextPath}/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
</head>
<body>
<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
	<a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3 text-truncate" href="#">ASSA Camping - 관리자모드</a>
	<button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse" data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<input class="form-control form-control-dark w-100" type="text" placeholder="Search" aria-label="Search">
	<ul class="navbar-nav px-3">
		<li class="nav-item text-nowrap"><a class="nav-link" href="${contextPath}">Sign out</a></li>
	</ul>
</nav>
<div class="container-fluid">
	<div class="row">
		<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
			<div class="sidebar-sticky pt-3">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link <%if(pageCode.equals("admin")) out.print("active");%>" href="${contextPath}/admin/admin.jsp"> <span data-feather="home"></span> Dashboard <span class="sr-only">(current)</span> </a></li>
				</ul>
				<hr />
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link <%if(pageCode.equals("adminUserList")) out.print("active");%>" href="${contextPath}/admin/adminUserList.jsp"> <span data-feather="users"></span> 회원 관리 </a></li>
					<li class="nav-item"><a class="nav-link <%if(pageCode.equals("adminOrderList")) out.print("active");%>" href="${contextPath}/cartorder/adminOrderList.do"> <span data-feather="file"></span> 주문 관리 </a></li>
					<li class="nav-item"><a class="nav-link <%if(pageCode.equals("adminProductList")) out.print("active");%>" href="${contextPath}/proadm/listProduct.do"> <span data-feather="shopping-cart"></span> 상품 관리 </a></li>
				</ul>
				<hr />
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link <%if(pageCode.equals("adminQnaList")) out.print("active");%>" href="${contextPath}/admin/adminQnaList.jsp"> <span data-feather="file-text"></span> 상품 문의 </a></li>
					<li class="nav-item"><a class="nav-link <%if(pageCode.equals("adminReviewList")) out.print("active");%>" href="${contextPath}/admin/adminReviewList.jsp"> <span data-feather="file-text"></span> 상품 후기 </a></li>
				</ul>
				<hr />
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link <%if(pageCode.equals("adminFaqList")) out.print("active");%>" href="${contextPath}/admin/adminFaqList.jsp"> <span data-feather="file-text"></span> 자주하는 질문 </a></li>
					<li class="nav-item"><a class="nav-link <%if(pageCode.equals("adminCampingList")) out.print("active");%>" href="${contextPath}/admin/adminCampingList.jsp"> <span data-feather="file-text"></span> 캠핑정보 </a></li>
					<li class="nav-item"><a class="nav-link <%if(pageCode.equals("adminEventList")) out.print("active");%>" href="${contextPath}/admin/adminEventList.jsp"> <span data-feather="file-text"></span> 이벤트 </a></li>
				</ul>
				<hr />
			</div>
		</nav>

		<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4 pt-3">