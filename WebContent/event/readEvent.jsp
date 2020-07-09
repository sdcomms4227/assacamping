<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="userId" value="${sessionScope.userId}" />
<c:set var="eventNo" value="${event.eventNo}" />
<c:set var="eventTitle" value="${event.eventTitle}" />
<c:set var="eventContent" value="${event.eventContent}" />
<c:set var="eventImageFileName" value="${event.eventImageFileName}" />
<c:set var="eventWriteDate" value="${event.eventWriteDate}" />
<c:set var="eventReadCount" value="${event.eventReadCount}" />

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
				<td colspan="6" class="h4 p-3 readsubject">
					${eventTitle}																	
					<div class="h6 mt-3 mb-0 d-lg-none text-right">
						<small class="text-muted">${userId} | <fmt:formatDate value="${eventWriteDate}" pattern="yy-MM-dd"/> | ${eventReadCount}</small>
					</div>
				</td>
			</tr>
			<tr class="d-none d-lg-table-row">
				<th class="align-middle">제목</th>
				<td>${event.eventTitle}</td>				
				<th class="align-middle">작성일</th>
				<td><fmt:formatDate value="${eventWriteDate}" pattern="yy-MM-dd"/></td>
				<th class="align-middle">조회수</th>
				<td>${eventReadCount}</td>
			</tr>
			<tr>
				<td colspan="6" class="py-5">
				     <input  type= "hidden"   name="originalFileName" value="${eventImageFileName }" />
   						 <img src="${contextPath}/files/event/${event.eventNo}/${eventImageFileName}" align="center"/><br><br>				
						 ${fn:replace(eventContent,LF,BR)}
				</td>
			</tr>
			<c:if test="${not empty eventImageFileName && eventImageFileName!='null'}">
				<tr>
					<th class="align-middle">첨부파일</th>
					<td colspan="5">
						<div class="d-flex align-items-center">
<%-- 								<div class="preview" style="background-image:url(${contextPath}/files/event/${event.eventNo}/${event.eventImageFileName})"></div>
 --%>							
 							<p class="ml-2 mb-0">${eventImageFileName}</p>
						</div>
					</td>
				</tr>				
			</c:if>
		</table>

		<div class="text-center my-5">
			<button type="button" class="btn btn-secondary" onclick="listEvent()">목록</button>
			<c:if test="${userId eq 'admin'}">							
				<button type="button" class="btn btn-warning" onclick="modifyEvent(${eventNo})">수정</button>
				<button type="button" class="btn btn-danger" onclick="deleteEvent(${eventNo})">삭제</button>
		    </c:if>
		</div>			
	</article>
	
	<!-- Newsletter -->
	<jsp:include page="../inc/newsletter.jsp" />
	
	<!-- Footer -->
	<jsp:include page="../inc/footer.jsp" />
	
</div>

<%-- <form method="post" name="pagingForm">
	<input type="hidden" name="pageNo" value="${pageNo}" />
	<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
	<input type="hidden" name="searchCategoryNo" value="${searchCategoryNo}" />
</form> --%>

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

<script>
function listEvent(){
	var form = document.pagingForm;
	form.action = "${contextPath}/eve/listEvent.do";	
	form.submit();
}
function modifyEvent(eventNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/eve/modEvent.do?eventNo=" + eventNo;
	form.submit();
}
function deleteEvent(eventNo){
	var result = confirm("정말로 삭제하시겠습니까?");	
	if(result){
		var form = document.pagingForm;
		form.action = "${contextPath}/camp/delEvent.do?eventNo=" + eventNo;
		form.submit();
	}
}

</script>
</body>
</html>