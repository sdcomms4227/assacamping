<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>

<div class="row mb-3 align-items-center">
	<div class="col-12">
		<h2 class="mb-0">회원 등록</h2>
	</div>
</div>

<article class="user">
	<form action="${contextPath}/usradm/insertUser.do" method="post" enctype="multipart/form-data">
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
					<input class="form-control" type="text" name="userId" id="userId" required />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="userPw" class="m-0">비밀번호</label>
				</th>
				<td>
					<input class="form-control" type="text" name="userPw" id="userPw" required />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="userPw2" class="m-0">비밀번호 재확인</label>
				</th>
				<td>
					<input class="form-control" type="text" name="userPw2" id="userPw2" required />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="userName" class="m-0">이름</label>
				</th>
				<td>
					<input class="form-control" type="text" name="userName" id="userName" required />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="userPhone" class="m-0">전화번호</label>
				</th>
				<td>
					<input class="form-control" type="text" name="userPhone" id="userPhone" required />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="userEmail" class="m-0">이메일</label>
				</th>
				<td>
					<input class="form-control" type="text" name="userEmail" id="userEmail" required />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="userZipcode" class="m-0">우편번호</label>
				</th>
				<td>
					<input class="form-control" type="text" name="userZipcode" id="userZipcode" required />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="userAddress1" class="m-0">주소</label>
				</th>
				<td>
					<input class="form-control" type="text" name="userAddress1" id="userAddress1" required />
				</td>
			</tr>
			<tr>
				<th class="align-middle">
					<label for="userAddress2" class="m-0">상세주소</label>
				</th>
				<td>
					<input class="form-control" type="text" name="userAddress2" id="userAddress2" required />
				</td>
			</tr>
		</table>
		<div class="text-center my-5">
			<button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
			<button type="submit" class="btn btn-primary">등록하기</button>
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

<%@ include file="../inc/adminBottom.jsp"%>