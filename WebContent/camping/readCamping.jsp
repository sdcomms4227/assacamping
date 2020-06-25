<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="readNo" value="${campingItemMap.campingVO.campingNo}" />
<c:set var="readTitle" value="${campingItemMap.campingVO.campingTitle}" />
<c:set var="readContent" value="${campingItemMap.campingVO.campingContent}" />
<c:set var="readFileName" value="${campingItemMap.campingVO.campingFileName}" />
<c:set var="readName" value="${campingItemMap.campingVO.userId}" />
<c:set var="readDate" value="${campingItemMap.campingVO.campingWriteDate}" />
<c:set var="readCount" value="${campingItemMap.campingVO.campingReadCount}" />
<c:set var="readCategoryName" value="${campingItemMap.categoryName}" />
<!DOCTYPE html>
<html lang="kr">
<head>
<title>ASSA Camping - 나혼자간다</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="ASSA Camping - 나혼자간다">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/plugins/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/plugins/jquery-ui-1.12.1.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/board.css" />
<link rel="stylesheet" type="text/css" href="${contextPath}/css/camping.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/css/camping_responsive.css">
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

	<div class="camping">
		<div class="container">
			<div class="row">
				<div class="col-12">
				
					<!-- 게시판 -->
					<article class="mt-3">
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
									${readTitle}
									
									<c:if test="${readCategoryName!=null}">
										<small class="text-muted">[${readCategoryName}]</small>									
									</c:if>
									
									<div class="h6 mt-3 mb-0 d-lg-none text-right">
										<small class="text-muted">${readName} | <fmt:formatDate value="${readDate}" pattern="yy-MM-dd HH:mm"/> | ${readCount}</small>
									</div>
								</td>
							</tr>
							<tr class="d-none d-lg-table-row">
								<th class="align-middle">작성자</th>
								<td>${readName}</td>
								<th class="align-middle">작성일</th>
								<td><fmt:formatDate value="${readDate}" pattern="yy-MM-dd HH:mm"/></td>
								<th class="align-middle">조회수</th>
								<td>${readCount}</td>
							</tr>
							<tr>
								<td colspan="6" class="py-5"> ${readContent} </td>
							</tr>							
						</table>

						<div class="text-center my-5">
							<button type="button" class="btn btn-secondary" onclick="listCamping()">목록</button>							
							<button type="button" class="btn btn-warning" onclick="modifyCamping()">수정</button>
							<button type="button" class="btn btn-danger" onclick="deleteCamping()">삭제</button>
							<button type="button" class="btn btn-primary" onclick="replyCamping()">답글쓰기</button>
						</div>			
					</article>
					<!-- // 게시판 -->
				
				</div>
			</div>
		</div>
	</div>
	
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
<script src="${contextPath}/js/camping_custom.js"></script>

<script>
function listCamping(){
	var form = document.createElement("form");
	form.action = "${contextPath}/camp/listCamping.do";
	form.method = "post";
	
	var input1 = document.createElement("input");
	input1.type = "hidden";
	input1.name = "section";
	input1.value = ${section};
	form.appendChild(input1);
	
	var input2 = document.createElement("input");
	input2.type = "hidden";
	input2.name = "pageNo";
	input2.value = ${pageNo};
	form.appendChild(input2);
	
	document.getElementsByTagName("body")[0].appendChild(form);
	
	form.submit();
}
function modifyCamping(){
	var form = document.createElement("form");
	form.action = "${contextPath}/camp/modifyCamping.do";
	form.method = "post";
	
	var input1 = document.createElement("input");
	input1.type = "hidden";
	input1.name = "section";
	input1.value = ${section};
	form.appendChild(input1);
	
	var input2 = document.createElement("input");
	input2.type = "hidden";
	input2.name = "pageNo";
	input2.value = ${pageNo};
	form.appendChild(input2);
	
	var input3 = document.createElement("input");
	input3.type = "hidden";
	input3.name = "campingNo";
	input3.value = ${readNo};
	form.appendChild(input3);
	
	document.getElementsByTagName("body")[0].appendChild(form);
	
	form.submit();
}

function deleteCamping(){
	var result = confirm("정말로 삭제하시겠습니까?");
	
	if(result){
		var form = document.createElement("form");
		form.action = "${contextPath}/camp/deleteCamping.do";
		form.method = "post";
		
		var input1 = document.createElement("input");
		input1.type = "hidden";
		input1.name = "section";
		input1.value = ${section};
		form.appendChild(input1);
		
		var input2 = document.createElement("input");
		input2.type = "hidden";
		input2.name = "pageNo";
		input2.value = ${pageNo};
		form.appendChild(input2);
		
		var input3 = document.createElement("input");
		input3.type = "hidden";
		input3.name = "campingNo";
		input3.value = ${readNo};
		form.appendChild(input3);
		
		document.getElementsByTagName("body")[0].appendChild(form);
		
		form.submit();
	}
}

function replyCamping(){
	var form = document.createElement("form");
	form.action = "${contextPath}/camp/replyCamping.do";
	form.method = "post";
	
	var input1 = document.createElement("input");
	input1.type = "hidden";
	input1.name = "section";
	input1.value = ${section};
	form.appendChild(input1);
	
	var input2 = document.createElement("input");
	input2.type = "hidden";
	input2.name = "pageNo";
	input2.value = ${pageNo};
	form.appendChild(input2);
	
	var input3 = document.createElement("input");
	input3.type = "hidden";
	input3.name = "campingNo";
	input3.value = ${readNo};
	form.appendChild(input3);
	
	document.getElementsByTagName("body")[0].appendChild(form);
	
	form.submit();
}
</script>
</body>
</html>