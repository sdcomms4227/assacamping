<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<c:set var="productNo" value="${productItemMap.productAdminVO.productNo}" />
<c:set var="productName" value="${productItemMap.productAdminVO.productName}" />
<c:set var="productInformation" value="${productItemMap.productAdminVO.productInformation}" />
<c:set var="productPrice" value="${productItemMap.productAdminVO.productPrice}" />
<c:set var="productImageName" value="${productItemMap.productAdminVO.productImageName}" />
<c:set var="productDate" value="${productItemMap.productAdminVO.productDate}" />
<c:set var="productCategoryNo" value="${productItemMap.productAdminVO.productCategoryNo}" />
<c:set var="productCategoryName" value="${productItemMap.productCategoryName}" />
<c:set var="productQuantity" value="${productItemMap.productAdminVO.productQuantity}" />
<c:set var="productFileType" value="${productItemMap.productFileType}" />
<link rel="stylesheet" type="text/css" href="${contextPath}/css/board.css" />

<div class="row mb-2 align-items-center">
	<div class="col-12">
		<h2>상품 수정</h2>
	</div>
</div>

<div class="row">
	<div class="col-12">
	
		<!-- 게시판 -->
		<article class="mt-3">
			<form action="${contextPath}/proadm/updateProduct.do" method="post" enctype="multipart/form-data" >
				<input type="hidden" name="pageNo" value="${pageNo}" />
				<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
				<input type="hidden" name="searchCategoryNo" value="${searchCategoryNo}" />
				<input type="hidden" name="productNo" value="${productNo}" />
				<table class="table">
					<colgroup>
						<col style="width:120px" />
						<col />
					</colgroup>
					<tr>
						<th class="align-middle">
							<label for="productCategoryNo" class="m-0">카테고리</label>
						</th>
						<td>
							<select class="form-control" name="productCategoryNo" id="productCategoryNo" required>
								<option value="">선택하세요</option>
								<c:forEach var="category" items="${productCategoryList}">											
									<c:choose>
										<c:when test="${category.productCategoryNo == productCategoryNo}">
											<option value="${category.productCategoryNo}" selected>${category.productCategoryName}</option>	
										</c:when>
										<c:otherwise>
											<option value="${category.productCategoryNo}">${category.productCategoryName}</option>	
										</c:otherwise>
									</c:choose>																				
								</c:forEach>	
							</select>
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="productName" class="m-0">상품 이름</label>
						</th>
						<td>
							<input class="form-control" type="text" name="productName" id="productName" value="${productName}" required />
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="productPrice" class="m-0">상품 가격</label>
						</th>
						<td>
							<div class="form-inline">
								<input class="form-control" type="number" name="productPrice" id="productPrice" min="0" max="99999999" value="${productPrice}" required />
							</div>
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="productQuantity" class="m-0">상품 수량</label>
						</th>
						<td>
							<div class="form-inline">
								<input class="form-control d-inline-block" type="number" name="productQuantity" id="productQuantity" min="0" max="9999" value="${productQuantity}" required />
							</div>
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label for="productInformation" class="m-0">상품 상세정보</label>
						</th>
						<td>			
							<textarea class="form-control" name="productInformation" id="productInformation" cols="40" rows="13" required>${productInformation}</textarea>
						</td>
					</tr>
					<tr>
						<th class="align-middle">
							<label class="m-0">상품 이미지</label>
						</th>
						<td>
							<c:if test="${not empty productImageName}">
								<div class="d-flex align-items-center mb-2">
									<input type="hidden" name="oldFileName" value="${productImageName}" />
									<c:if test="${productFileType.equals('image')}">
										<div class="preview" style="background-image:url(${contextPath}/files/product/${productNo}/${productImageName})"></div>
									</c:if>
									<p class="ml-2 mb-0">${productImageName}</p>
								</div>
								<p class="alert alert-danger" style="display:none">파일첨부 시 기존 첨부파일 정보가 삭제됩니다.</p>
							</c:if>
							<div class="custom-file">
								<input class="custom-file-input" type="file" name="productImageName" id="productImageName" onchange="checkFile(this);showPreview(this, 'image')" />
								<label class="custom-file-label" for="productImageName">선택된 파일 없음</label>
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
		<!-- // 게시판 -->
	
	</div>
</div>

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

<%@ include file="../inc/adminBottom.jsp" %>