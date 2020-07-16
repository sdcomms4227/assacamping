<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="userId" value="${sessionScope.userId}" />
<c:set var="userName" value="${sessionScope.userName}" />
<c:set var="eventNo" value="${event.eventNo}" />
<c:set var="eventTitle" value="${event.eventTitle}" />
<c:set var="eventContent" value="${event.eventContent}" />
<c:set var="eventImageFileName" value="${event.eventImageFileName}" />
<c:set var="eventWriteDate" value="${event.eventWriteDate}" />
<c:set var="eventReadCount" value="${event.eventReadCount}" />
<fmt:formatDate var="eventFormattedWriteDate" value="${eventWriteDate}" pattern="yy-MM-dd"/>

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
<link rel="stylesheet" href="${contextPath}/css/camping.css">
<link rel="stylesheet" href="${contextPath}/css/camping_responsive.css">
<link rel="stylesheet" href="${contextPath}/css/board.css" />
<jsp:include page="../inc/alert.jsp" />
</head>
<body>

<div class="super_container">

	<!-- Header -->
	<jsp:include page="../inc/header.jsp" />

	<!-- Menu -->
	<jsp:include page="../inc/menu.jsp" />
	
	<!-- Home -->	
	<div class="home">
		<div class="home_background parallax-window" data-parallax="scroll" data-image-src="${contextPath}/images/event.jpg" data-speed="0.8"></div>
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="home_container">
						<div class="home_content">
							<div class="home_title">이벤트</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Camping -->
	<article class="camping container">
		<table class="table read-table">
			<colgroup>
				<col style="width: 70px" />
				<col />
				<col style="width: 70px" />
				<col style="width: 210px" />
				<col style="width: 70px" />
				<col style="width: 70px" />
			</colgroup>
			<tr>
				<td colspan="6" class="h4 p-3 readsubject">${eventTitle}</td>
			</tr>
			<tr>
				<td colspan="6" class="py-5">
					<input type="hidden" name="originalFileName" value="${eventImageFileName}" />
					<img src="${contextPath}/files/event/${eventNo}/${eventImageFileName}"/>
					<br>
					<br>
					${fn:replace(eventContent,LF,BR)}
				</td>
			</tr>
			<c:if test="${not empty eventImageFileName && eventImageFileName!='null'}">
				<tr>
					<th class="align-middle">첨부파일</th>
					<td colspan="5">
						<div class="d-flex align-items-center">
 							<p class="ml-2 mb-0">${eventImageFileName}</p>
						</div>
					</td>
				</tr>				
			</c:if>
		</table>
		
		<!-- Comment -->
		<jsp:include page="../comment/comment.jsp" />
		
		<div class="text-center my-5">
			<a href="${contextPath}/eventServlet/listEvent.do">
			<button type="button" class="btn btn-secondary">목록</button></a>
			<c:if test="${userId eq 'admin'}">							
				<a href="${contextPath}/eventServlet/modEvent.do?eventNo=${eventNo}" class="btn btn-warning">관리자 수정</a>
				<a href="${contextPath}/eventServlet/delEvent.do?eventNo=${eventNo}" class="btn btn-danger">관리자 삭제</a>	    
			</c:if>
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
<script src="${contextPath}/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="${contextPath}/plugins/malihu-custom-scrollbar/jquery.mCustomScrollbar.js"></script>
<script src="${contextPath}/plugins/jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<script src="${contextPath}/js/custom.js"></script>
<script src="${contextPath}/js/camping_custom.js"></script>

</body>
</html>