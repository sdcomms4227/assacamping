<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp" %>

<div class="row mb-3 align-items-center">
	<div class="col-12">
		<h2 class="mb-0">상품 등록</h2>
	</div>
</div>

<article class="product">
	<form action="${contextPath}/productAdminServlet/insertProduct.do" method="post" enctype="multipart/form-data">
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
							<option value="${category.productCategoryNo}">${category.productCategoryName}</option>									
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="productName" class="m-0">이름</label>
				</th>
				<td>
					<input class="form-control" type="text" name="productName" id="productName" required />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="productPrice" class="m-0">가격</label>
				</th>
				<td>
					<div class="form-inline">
						<input class="form-control" type="number" name="productPrice" id="productPrice" min="0" max="100000000" step="100" value="0" required />
					</div>
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="productQuantity" class="m-0">수량</label>
				</th>
				<td>
					<div class="form-inline">
						<input class="form-control d-inline-block" type="number" name="productQuantity" id="productQuantity" min="0" max="9999" value="0" required />
					</div>
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="productContent" class="m-0">상세정보</label>
				</th>
				<td>			
					<textarea class="form-control" name="productContent" id="productContent" cols="40" rows="13" required></textarea>
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label class="m-0">이미지1</label>
				</th>
				<td>
					<div class="custom-file">
						<input class="custom-file-input" type="file" name="productImageName1" id="productImageName1" onchange="showPreview(this, 'image')" required />
						<label class="custom-file-label" for="productImageName1">선택된 파일 없음</label>
					</div>
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label class="m-0">이미지2</label>
				</th>
				<td>
					<div class="custom-file">
						<input class="custom-file-input" type="file" name="productImageName2" id="productImageName2" onchange="showPreview(this, 'image')" />
						<label class="custom-file-label" for="productImageName2">선택된 파일 없음</label>
					</div>
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label class="m-0">이미지3</label>
				</th>
				<td>
					<div class="custom-file">
						<input class="custom-file-input" type="file" name="productImageName3" id="productImageName3" onchange="showPreview(this, 'image')" />
						<label class="custom-file-label" for="productImageName3">선택된 파일 없음</label>
					</div>
				</td>
			</tr>
		</table>
		<div class="text-center my-5">
			<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
			<button type="submit" class="btn btn-primary">상품 등록하기</button>
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