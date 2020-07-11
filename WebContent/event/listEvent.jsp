<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<c:set var="eventList" value="${eventMap.eventList}"/>
<c:set var="totEvents" value="${eventMap.totEvents}"/>
<c:set var="section" value="${eventMap.section}"/>
<c:set var="pageNum" value="${eventMap.pageNum}"/>  
<c:set var="search" value="${eventMap.search}"/>

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
<link rel="stylesheet" href="${contextPath}/css/event.css">
<link rel="stylesheet" href="${contextPath}/css/event_responsive.css">
<link rel="stylesheet" href="${contextPath}/css/board.css" />
<jsp:include page="../inc/alert.jsp" />


	<style type="text/css">
		.cls1{ text-decoration: none;}
		.cls2{ text-align: center; font-size: 30px;}
		.cls3{ text-align: right; font-size: 25px;}
		.no-unline{text-decoration: none;}
		/* 선택된 페이지 번호를 밑줄 없이 빨간색으로 표시 */
		.sel-page{text-decoration: none; color: red;}		
	</style>
	
	
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
								<div class="home_title">Woman</div>
								<div class="breadcrumbs">
									<ul>
										<li><a href="index.html">Home</a></li>
										<li>Woman</li>
										<li>Accessories</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Event -->
		<article class="event container">
			<div class="row">
				<c:choose>
					<c:when test="${eventList == null }">
						<div class="col-md-4">
							<p align="center">
								<b>등록된 글이 없습니다.</b>
							</p>
						</div>
					</c:when>
					<c:when test="${eventList != null}">
						<c:forEach var="event" items="${eventList}">
							<div class="col-md-4">	
								<a href="${contextPath}/eventServlet/readEvent.do?eventNo=${event.eventNo}" class="thumbnail">
									<img src="${contextPath}/files/event/${event.eventNo}/${event.eventImageFileName}" style="width: 250px; height: 180px">
									<br />${event.eventTitle}
								</a>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
			<div class="cls2">
				<c:if test="${totEvents != null}">
					<c:choose>
						<c:when test="${totEvents > 100}">
							<c:forEach var="page" begin="1" end="10" step="1">
								<c:if test="${section > 1 && page=1}">
									<a href="${contextPath}/eventServlet/listEvent.do?section=${section-1}&pageNum=${(section-1)*10+1}&search=${search}"> &nbsp;이전</a>
								</c:if>
								<a href="${contextPath}/eventServlet/listEvent.do?section=${section}&pageNum=${page}&search=${search}">${(section-1)*10}</a>
								<c:if test="${page==10}">
									<a href="${contextPath}/eventServlet/listEvent.do?section=${section+1}&pageNum=${section*10+1}&search=${search}&search=${search}"> &nbsp;다음</a>
								</c:if>
							</c:forEach>
						</c:when>
						<c:when test="${totEvents ==100}">
							<c:forEach var="page" begin="1" end="10" step="1">
								<a href="#">${page}</a>
							</c:forEach>
						</c:when>
						<c:when test="${totEvents < 100 }">
							<c:forEach var="page" begin="1" end="${totEvents/10+1}" step="1">
								<c:choose>
									<c:when test="${page==pageNum}">
										<a class="sel-page" href="${contextPath}/eventServlet/listEvent.do?section=${section}&pageNum=${page}&search=${search}"> ${page} </a>
									</c:when>
									<c:otherwise>
										<a class="no-unline" href="${contextPath}/eventServlet/listEvent.do?section=${section}&pageNum=${page}&search=${search}"> ${page} </a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</c:when>
					</c:choose>
				</c:if>
			</div>
			<div class="row my-5">
				<div class="col-12 col-lg-8">
					<form action="${contextPath}/eventServlet/listEvent.do" class="form-inline justify-content-center justify-content-lg-start">
						<div class="input-group">
							<input type="hidden" name="section" value="${section}">
							<input type="hidden" name="pageNum" value="${pageNum}">
							<input type="search" name="search" value="${search}" size="24" maxlength="24" class="form-control">
							<div class="input-group-append">
								<button type="submit" class="btn btn-secondary">검색</button>
							</div>
						</div>
					</form>
				</div>
				<div class="col-12 col-lg-4 mt-3 mt-lg-0">
					<div class="form-group text-center text-lg-right">				
						<a class="btn btn-secondary" href="${contextPath}/eventServlet/listEvent.do">전체보기</a>			
						<c:if test="${userId eq 'admin'}">
							<a class="btn btn-primary" href="${contextPath}/eventServlet/eventForm.do">관리자 : 글쓰기</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</article>
	
	<!-- Newsletter -->
	<jsp:include page="../inc/newsletter.jsp" />
	
	<!-- Footer -->
	<jsp:include page="../inc/footer.jsp" />
	
</div>

<script src="${contextPath}/js/jquery-3.2.1.min.js"></script>
<script src="${contextPath}/js/popper.js"></script>
<script src="${contextPath}/js/bootstrap.min.js"></script>
<script src="${contextPath}/plugins/easing/easing.js"></script>
<script src="${contextPath}/plugins/parallax-js-master/parallax.min.js"></script>
<script src="${contextPath}/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="${contextPath}/js/custom.js"></script>
<script src="${contextPath}/js/event_custom.js"></script>
</body>
</html>