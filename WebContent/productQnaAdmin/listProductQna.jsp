<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<c:set var="productQnaList" value="${productQnaListMap.productQnaList}" />
<c:set var="totalCount" value="${productQnaListMap.totalCount}" />
<c:set var="beginNo" value="${(pageNo-1) - (pageNo-1)%10 + 1}" />
<c:set var="endNo" value="${beginNo + 9}" />

<form action="${contextPath}/proQnaAdm/listProductQna.do" class="form-block">
	<div class="row mb-3 align-items-center">
		<div class="col-12 col-lg-3 mb-2 mb-lg-0">
			<h2 class="mb-0">상품 문의</h2>		
		</div>
		<div class="col-12 col-lg-6 mb-2 mb-lg-0 text-center">
			<div class="d-inline-block">
				<div class="input-group">
					<input type="search" name="searchKeyword" value="${searchKeyword}" size="24" maxlength="24" class="form-control form-control-sm">
					<div class="input-group-append">
						<button type="submit" class="btn btn-secondary btn-sm">검색</button>
					</div>
				</div>
			</div>
		</div>
		<div class="col-12 col-lg-3 mb-2 mb-lg-0 text-right">
			<div class="custom-control custom-checkbox ml-2">
				<c:choose>
					<c:when test='${answerCheck != null && !answerCheck.equals("")}'>
						<input type="checkbox" class="custom-control-input" name="answerCheck" id="answerCheck" checked onclick="this.form.submit()">
					</c:when>
					<c:otherwise>
						<input type="checkbox" class="custom-control-input" name="answerCheck" id="answerCheck" onclick="this.form.submit()">
					</c:otherwise>
				</c:choose>
				<label class="custom-control-label text-danger" for="answerCheck">답변대기만 보기</label>
			</div>
		</div>
	</div>
</form>

<article class="productQna">
	<table class="table table-hover text-center">
		<colgroup class="d-none d-lg-table-column-group">
			<col style="width: 80px" />
			<col style="width: 80px" />
			<col style="width: 100px" />
			<col style="width: 100px" />
			<col />
			<col style="width: 100px" />
			<col style="width: 100px" />
			<col style="width: 100px" />
			<col style="width: 140px" />
		</colgroup>
		<thead class="thead-light d-none d-lg-table-header-group">
			<tr>
				<th>문의번호</th>
				<th>상품번호</th>
				<th>이미지</th>
				<th>상품명</th>
				<th>문의내용</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>상태</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>			
			<c:choose>
				<c:when test="${totalCount==0}">			
					<tr>
						<td colspan="9">등록된 문의가 없습니다.</td>
					</tr>
				</c:when>	
				<c:otherwise>
					<c:forEach var="productQnaMap" items="${productQnaList}">
						<c:set var="productQnaVO" value="${productQnaMap.productQnaVO}" />
						<c:set var="productVO" value="${productQnaMap.productVO}" />
						<fmt:formatDate var="qnaFmtDate" value="${productQnaVO.qnaDate}" pattern="yyyy-MM-dd HH:mm"/>
						<tr onclick="readProductQna(${productQnaVO.qnaNo})" style="cursor:pointer">
							<td class="align-middle">${productQnaVO.qnaNo}</td>
							<td class="align-middle">${productQnaVO.productNo}</td>
							<td class="align-middle"><img src="${contextPath}/files/product/${productQnaVO.productNo}/${productVO.productImageName1}" alt="${productVO.productName}" style="height: 40px" /></td>
							<td class="align-middle">${productVO.productName}</td>
							<td class="align-middle text-left">${productQnaVO.qnaContent}</td>
							<td class="align-middle">${productQnaVO.userId}</td>
							<td class="align-middle">${qnaFmtDate}</td>
							<td class="align-middle">
								<c:choose>
									<c:when test="${productQnaVO.qnaAnswer!=null}">
										<div class="text-primary">답변완료</div>									
									</c:when>
									<c:otherwise>
										<div class="text-danger">답변대기</div>
									</c:otherwise>
								</c:choose>
							</td>
							<td class="align-middle">
								<button type="button" class="btn btn-warning btn-sm" onclick="answerProductQna(${productQnaVO.qnaNo}, event)">답변</button>
								<button type="button" class="btn btn-danger btn-sm" onclick="deleteProductQna(${productQnaVO.qnaNo}, event)">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	
	<c:if test="${totalCount != null}">
		<div class="row">
			<div class="col-12">
				<ul class="pagination justify-content-center">
				<c:if test="${pageNo > 10}">	
				   	<li class="page-item">
						<button type="button" class="page-link" onclick="listProductQna(${beginNo-10})">이전</button>
					</li>
				</c:if>
				<c:forEach var="page" begin="${beginNo}" end="${endNo}" step="1">
					<c:if test="${page <= Math.ceil(totalCount/10)}">
						<c:choose>	
							<c:when test="${page==pageNo}">
								<li class="page-item active">
									<button type="button" class="page-link" onclick="listProductQna(${page})">${page}</button>						
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<button type="button" class="page-link" onclick="listProductQna(${page})">${page}</button>							
								</li>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>								
				<c:if test="${totalCount > endNo*10}">						
				   	<li class="page-item">
						<button type="button" class="page-link" onclick="listProductQna(${beginNo+10})">다음</button>
					</li>
				</c:if>
				</ul>
			</div>
		</div>
	</c:if>
</article>

<form method="post" name="pagingForm">
	<input type="hidden" name="pageNo" value="${pageNo}" />
	<input type="hidden" name="searchKeyword" value="${searchKeyword}" />
	<input type="hidden" name="answerCheck" value="${answerCheck}" />
</form>

<script>
function listProductQna(pageNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/proQnaAdm/listProductQna.do";	
	form.pageNo.value = pageNo;
	form.submit();
}
function readProductQna(qnaNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/proQnaAdm/readProductQna.do?qnaNo=" + qnaNo;
	form.submit();
}
function answerProductQna(qnaNo, event){
	event.stopPropagation();
	var form = document.pagingForm;
	form.action = "${contextPath}/proQnaAdm/answerProductQna.do?qnaNo=" + qnaNo;
	form.submit();
}
function deleteProductQna(qnaNo, event){
	event.stopPropagation();
	var result = confirm("정말로 삭제하시겠습니까?");	
	if(result){
		var form = document.pagingForm;
		form.action = "${contextPath}/proQnaAdm/deleteProductQna.do?qnaNo=" + qnaNo;
		form.submit();
	}
}
</script>

<%@ include file="../inc/adminBottom.jsp"%>