<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<c:set var="userId" value="${userVO.userId}" />
<c:set var="userPw" value="${userVO.userPw}" />
<c:set var="userName" value="${userVO.userName}" />
<c:set var="userPhone" value="${userVO.userPhone}" />
<c:set var="userEmail" value="${userVO.userEmail}" />
<c:set var="userZipcode" value="${userVO.userZipcode}" />
<c:set var="userAddress1" value="${userVO.userAddress1}" />
<c:set var="userAddress2" value="${userVO.userAddress2}" />
<c:set var="userDate" value="${userVO.userDate}" />
<c:set var="userUse" value="${userVO.userUse}" />

<div class="row mb-3 align-items-center">
	<div class="col-12">
		<h2 class="mb-0">회원 정보 수정</h2>
	</div>
</div>

<article class="user">
	<form action="${contextPath}/userAdminServlet/updateUser.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="pageNo" value="${pageNo}" />
		<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
		<table class="table">
			<colgroup>
				<col style="width: 120px" />
				<col />
			</colgroup>
			<tr>
				<th class="align-middle">
					<label for="userId" class="m-0">아이디</label>
				</th>
				<td>
					<input class="form-control" type="text" name="userId" id="userId" value="${userId}" required readonly />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="userName" class="m-0">이름</label>
				</th>
				<td>
					<input class="form-control" type="text" name="userName" id="userName" value="${userName}" required />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="userPhone" class="m-0">전화번호</label>
				</th>
				<td>
					<input class="form-control" type="tel" name="userPhone" id="userPhone" value="${userPhone}" placeholder="010-0000-0000" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="userEmail" class="m-0">이메일</label>
				</th>
				<td>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text">@</span>
						</div>
						<input type="email" class="form-control" name="userEmail" id="userEmail" value="${userEmail}" required>
					</div>
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="userZipcode" class="m-0">우편번호</label>
				</th>
				<td>
					<div class="input-group">
						<input type="text" class="form-control" name="userZipcode" id="userZipcode" value="${userZipcode}" required />
						<div class="input-group-append">
							<button class="btn btn-secondary" type="button" onclick="postCode()">우편번호 검색</button>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="userAddress1" class="m-0">주소</label>
				</th>
				<td>
					<input class="form-control" type="text" name="userAddress1" id="userAddress1" value="${userAddress1}" required />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="userAddress2" class="m-0">상세주소</label>
				</th>
				<td>
					<input class="form-control" type="text" name="userAddress2" id="userAddress2" value="${userAddress2}" required />
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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
	$(document).ready(function() {
		bsCustomFileInput.init()
	});
	function postCode() {
		new daum.Postcode({
			oncomplete:function(data) { 				
				$('[name=userZipcode]').val(data.zonecode);
				$('[name=userAddress1]').val(data.address);
				$('[name=userAddress2]').val(data.buildingName);
			}
		}).open();
	}
</script>

<%@ include file="../inc/adminBottom.jsp"%>