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
		<form action="${contextPath}/eve/updateEvent.do" method="post" enctype="multipart/form-data" >
			<input type="hidden" name="eventNo" value="${eventNo}" />	
			<input type="hidden" name="userId" value="${userId}" />
			<input type="hidden" name="originalFileName" value="${eventImageFileName}" />
			<table class="table">
				<colgroup>
					<col style="max-width: 15%" />
					<col />
				</colgroup>
				<tr>
					<th class="align-middle">
						<label for="eventTitle" class="m-0">제목</label>
					</th>
					<td>
						<input class="form-control" type="text" name="eventTitle" id="eventTitle" value="${eventTitle}" required />
					</td>
				</tr>
				<tr>
					<th class="align-middle">
						<label for="eventContent" class="m-0">내용</label>
					</th>
					<td>			
						<textarea class="form-control" name="eventContent" id="eventContent" cols="40" rows="13" required>${eventContent}</textarea>				
					</td>
				</tr>
				<tr>
					<th class="align-middle">
						<label class="m-0">첨부파일</label>
					</th>
					<td>
						<c:if test="${not empty eventImageFileName}">
							<div class="d-flex align-items-center mb-2">
								<c:if test="${eventImageFileType.equals('image')}">
									<div class="preview" style="background-image:url(${contextPath}/files/event/${eventNo}/${eventImageFileName})"></div>
								</c:if>
								<p class="ml-2 mb-0">${eventImageFileName}</p>
							</div>
							<p class="alert alert-danger" style="display:none">파일첨부 시 기존 첨부파일 정보가 삭제됩니다.</p>
						</c:if>
						<div class="custom-file">
							<input class="custom-file-input" type="file" name="imageFileName" id="eventImageFileName" onchange="readURL()" />
							<label class="custom-file-label" for="eventImageFileName">선택된 파일 없음</label>
						</div>
					</td>
				</tr>
			</table>
			<div class="text-center my-5">
				<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
				<button type="submit" class="btn btn-warning">수정하기</button>
			</div>
		</form>
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
<script src="${contextPath}/js/bs-custom-file-input.js"></script>

<script>
	$(document).ready(function() {
		bsCustomFileInput.init()
	});

	function checkFile(obj){
		if($(obj).parent().siblings(".alert")){
			if($(obj).val().length > 0){
				$(obj).parent().siblings(".alert").fadeIn();
			}else{
				$(obj).parent().siblings(".alert").hide();
			}
		}
	}
	
	function showPreview(obj, allowType){
		var $preview  = $(obj).parent().siblings(".preview");

		if($preview.length){
			$preview.remove();
		}
		
		if(obj.files && obj.files[0]){
			var fileType = obj.files[0].type.split("/")[0];
			
			if(fileType=="image"){
				$preview = $("<div class='preview mt-2' />");
				$preview.appendTo($(obj).parent().parent());
				
				var reader = new FileReader();				
				reader.readAsDataURL(obj.files[0]);
				
				reader.onload = function(ProgressEvent){
					$preview.css("background-image", "url(" + ProgressEvent.target.result + ")");
				}
			}else{
				if(allowType=="image"){
					alert("이미지 파일만 첨부하실 수 있습니다.");
					obj.value = "";
				}
			}
		}
	}
</script>
</body>
</html>