<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>
<c:set var="productNo" value="${productMap.productVO.productNo}" />
<c:set var="productName" value="${productMap.productVO.productName}" />
<c:set var="productContent" value="${productMap.productVO.productContent}" />
<c:set var="productPrice" value="${productMap.productVO.productPrice}" />
<c:set var="productImageName1" value="${productMap.productVO.productImageName1}" />
<c:set var="productImageName2" value="${productMap.productVO.productImageName2}" />
<c:set var="productImageName3" value="${productMap.productVO.productImageName3}" />
<c:set var="productDate" value="${productMap.productVO.productDate}" />
<c:set var="productQuantity" value="${productMap.productVO.productQuantity}" />
<c:set var="productCategoryNo" value="${productMap.productVO.productCategoryNo}" />
<c:set var="productCategoryName" value="${productMap.productCategoryName}" />

<div class="row mb-3 align-items-center">
	<div class="col-12">
		<h2 class="mb-0">상품 수정</h2>
	</div>
</div>

<article class="product">
	<form action="${contextPath}/productAdminServlet/updateProduct.do" method="post" enctype="multipart/form-data" >
		<input type="hidden" name="pageNo" value="${pageNo}" />
		<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
		<input type="hidden" name="searchCategoryNo" value="${searchCategoryNo}" />
		<input type="hidden" name="productNo" value="${productNo}" />
		<c:if test="${productImageName1!=null}">
			<input type="hidden" name="originalImageName1" value="${productImageName1}" />
		</c:if>
		<c:if test="${productImageName2!=null}">
			<input type="hidden" name="originalImageName2" value="${productImageName2}" />
		</c:if>
		<c:if test="${productImageName3!=null}">
			<input type="hidden" name="originalImageName3" value="${productImageName3}" />
		</c:if>
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
					<label for="productName" class="m-0">상품명</label>
				</th>
				<td>
					<input class="form-control" type="text" name="productName" id="productName" value="${productName}" required />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="productPrice" class="m-0">가격</label>
				</th>
				<td>
					<div class="form-inline">
						<input class="form-control" type="number" name="productPrice" id="productPrice" min="0" max="100000000" step="100" value="${productPrice}" required />
					</div>
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="productQuantity" class="m-0">수량</label>
				</th>
				<td>
					<div class="form-inline">
						<input class="form-control d-inline-block" type="number" name="productQuantity" id="productQuantity" min="0" max="9999" value="${productQuantity}" required />
					</div>
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="productContent" class="m-0">상세정보</label>
				</th>
				<td>			
					<textarea class="form-control" name="productContent" id="productContent" cols="40" rows="13" required>${productContent}</textarea>
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label class="m-0">이미지1</label>
				</th>
				<td>
					<c:if test="${not empty productImageName1}">
						<div class="d-flex align-items-center mb-2">
							<div class="preview" style="background-image:url(${contextPath}/files/product/${productNo}/${productImageName1})"></div>
							<p class="ml-2 mb-0">${campingFileName}</p>
						</div>
						<p class="alert alert-danger" style="display:none">파일첨부 시 기존 첨부파일 정보가 삭제됩니다.</p>
					</c:if>
					<div class="custom-file">
						<input class="custom-file-input" type="file" name="productImageName1" id="productImageName1" onchange="showPreview(this, 'image');checkFile(this)" />
						<label class="custom-file-label" for="productImageName1">선택된 파일 없음</label>
					</div>
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label class="m-0">이미지2</label>
				</th>
				<td>
					<c:if test="${not empty productImageName2}">
						<div class="d-flex align-items-center mb-2">
							<div class="preview" style="background-image:url(${contextPath}/files/product/${productNo}/${productImageName2})"></div>
							<div class="custom-control custom-checkbox ml-2">
								<input type="checkbox" class="custom-control-input" name="deleteFile2" id="deleteFile2">
								<label class="custom-control-label text-danger" for="deleteFile2">첨부된 파일 삭제하기</label>
							</div>
						</div>
						<p class="alert alert-danger" style="display:none">파일첨부 시 기존 첨부파일 정보가 삭제됩니다.</p>
					</c:if>
					<div class="custom-file">
						<input class="custom-file-input" type="file" name="productImageName2" id="productImageName2" onchange="showPreview(this, 'image');checkFile(this)" />
						<label class="custom-file-label" for="productImageName2">선택된 파일 없음</label>
					</div>
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label class="m-0">이미지3</label>
				</th>
				<td>
					<c:if test="${not empty productImageName3}">
						<div class="d-flex align-items-center mb-2">
							<div class="preview" style="background-image:url(${contextPath}/files/product/${productNo}/${productImageName3})"></div>
							<div class="custom-control custom-checkbox ml-2">
								<input type="checkbox" class="custom-control-input" name="deleteFile3" id="deleteFile3">
								<label class="custom-control-label text-danger" for="deleteFile3">첨부된 파일 삭제하기</label>
							</div>
						</div>
						<p class="alert alert-danger" style="display:none">파일첨부 시 기존 첨부파일 정보가 삭제됩니다.</p>
					</c:if>
					<div class="custom-file">
						<input class="custom-file-input" type="file" name="productImageName3" id="productImageName3" onchange="showPreview(this, 'image');checkFile(this)" />
						<label class="custom-file-label" for="productImageName3">선택된 파일 없음</label>
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

<script src="${contextPath}/js/bs-custom-file-input.js"></script>
<script src="${contextPath}/js/lmw-custom-preview.js"></script>

<script>	
	$(document).ready(function() {
		bsCustomFileInput.init()
	});
</script>

<%@ include file="../inc/adminBottom.jsp" %>