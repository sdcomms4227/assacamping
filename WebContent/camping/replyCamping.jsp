<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="userId" value="hong" />
<c:set var="userName" value="홍길동" />
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
						<form action="${contextPath}/camp/insertCamping.do" method="post">
							<input type="hidden" name="section" value="${section}" />
							<input type="hidden" name="pageNo" value="${pageNo}" />
							<input type="hidden" name="userId" value="${userId}" />
							<table class="table">
								<colgroup>
									<col style="max-width: 15%" />
									<col />
								</colgroup>
								<tr>
									<th class="align-middle">
										<label for="userName" class="m-0">이름</label>
									</th>
									<td>
										<input class="form-control" type="text" name="userName" id="userName" value="${userName}" readonly />
									</td>
								</tr>
								<tr>
									<th class="align-middle">
										<label for="campingCategoryNo" class="m-0">카테고리</label>
									</th>
									<td>
										<select class="form-control" name="campingCategoryNo" id="campingCategoryNo" required>
											<option value="">선택하세요</option>
											<c:forEach var="category" items="${campingCategoryList}">
												<option value="${category.campingCategoryNo}">${category.campingCategoryName}</option>									
											</c:forEach>								
										</select>
									</td>
								</tr>
								<tr>
									<th class="align-middle">
										<label for="campingTitle" class="m-0">제목</label>
									</th>
									<td>
										<input class="form-control" type="text" name="campingTitle" id="campingTitle" value="[답글] ${campingTitle}" required />
									</td>
								</tr>
								<tr>
									<th class="align-middle">
										<label for="campingContent" class="m-0">내용</label>
									</th>
									<td>
			
										<textarea class="form-control" name="campingContent" id="campingContent" cols="40" rows="13" required></textarea>
									</td>
								</tr>
								<!-- <tr>
									<th class="align-middle">
										<label class="m-0">파일첨부</label>
									</th>
									<td>
										<div class="custom-file">
											<input class="custom-file-input" type="file" name="campingFile" id="campingFile" onchange="imgPreview(this)" />
											<label class="custom-file-label" for="campingFile">Choose file</label>
										</div>
									</td>
								</tr> -->
							</table>
							<div class="text-center my-5">
								<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
								<button type="submit" class="btn btn-primary">글쓰기</button>
							</div>
						</form>
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
</body>
</html>