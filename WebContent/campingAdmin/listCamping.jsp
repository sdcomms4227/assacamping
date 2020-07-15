<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<c:set var="campingList" value="${campingListMap.campingList}" />
<c:set var="totalCount" value="${campingListMap.totalCount}" />
<c:set var="beginNo" value="${(pageNo-1) - (pageNo-1)%10 + 1}" />
<c:set var="endNo" value="${beginNo + 9}" />

<div class="row mb-3 align-items-center">
	<div class="col-12 col-lg-3 mb-2 mb-lg-0">
		<h2 class="mb-0">캠핑정보</h2>
	</div>
	<div class="col-12 col-lg-6 mb-2 mb-lg-0 text-center">
		<form action="${contextPath}/campingAdminServlet/listCamping.do" class="form-inline justify-content-center">
			<div class="input-group mb-2 mb-sm-0 mr-sm-2">
				<select class="form-control form-control-sm categorySelect" name="searchCategoryNo" onchange="this.form.submit()">
					<option value="0">전체보기</option>
					<c:forEach var="category" items="${campingCategoryList}">
						<c:choose>
							<c:when test="${category.campingCategoryNo==searchCategoryNo}">
								<option value="${category.campingCategoryNo}" selected>${category.campingCategoryName}</option>
							</c:when>
							<c:otherwise>
								<option value="${category.campingCategoryNo}">${category.campingCategoryName}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</div>
			<div class="input-group">
				<input type="search" name="searchKeyword" value="${searchKeyword}" size="24" maxlength="24" class="form-control form-control-sm" placeholder="제목">
				<div class="input-group-append">
					<button type="submit" class="btn btn-secondary btn-sm">검색</button>
				</div>
			</div>
		</form>
	</div>
	<div class="col-12 col-lg-3 text-right">
		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='${contextPath}/campingAdminServlet/addCamping.do'">게시글 등록</button>
		<button type="button" class="btn btn-secondary btn-sm" onclick="location.href='${contextPath}/campingCategoryServlet/listCampingCategory.do'">카테고리 관리</button>
	</div>
</div>
	
<article class="camping">
	<table class="table table-hover text-center">
		<colgroup class="d-none d-lg-table-column-group">
			<col style="width: 120px" />
			<col style="width: 120px" />
			<col />
			<col style="width: 120px" />
			<col style="width: 120px" />
			<col style="width: 120px" />
			<col style="width: 160px" />
		</colgroup>
		<thead class="thead-light d-none d-lg-table-header-group">
			<tr>
				<th>번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
				<th>관리</th>
			</tr>
		</thead>
		<tbody>			
			<c:choose>
				<c:when test="${totalCount==0}">			
					<tr>
						<td colspan="7">등록된 게시글이 없습니다.</td>
					</tr>
				</c:when>	
				<c:otherwise>
					<c:forEach var="campingMap" items="${campingList}">
						<c:set var="campingVO" value="${campingMap.campingVO}" />
						<c:set var="campingCategoryName" value="${campingMap.campingCategoryName}" />
						<fmt:formatDate var="campingFormattedDate" value="${campingVO.campingDate}" pattern="yyyy-MM-dd HH:mm"/>
						<tr onclick="readCamping(${campingVO.campingNo})" class="cursor-pointer">
							<td class="align-middle">${campingVO.campingNo}</td>
							<td class="align-middle wbka">${campingCategoryName}</td>
							<td class="align-middle text-left">
								<c:if test="${campingVO.campingRe_lev > 0}">
									<img src="${contextPath}/images/re.gif" style="margin-left:${campingVO.campingRe_lev*16}px" class="mr-2" />
								</c:if>
								${campingVO.campingTitle}
								<c:if test="${campingVO.campingFileName!=null}">
									<img class="ml-2" style="width:16px;height:16px" src="${contextPath}/images/download.svg" />
								</c:if>
							</td>
							<td class="align-middle">${campingVO.userId}</td>
							<td class="align-middle">${campingVO.campingCount}</td>
							<td class="align-middle">${campingFormattedDate}</td>
							<td class="align-middle">
								<button type="button" class="btn btn-warning btn-sm" onclick="modifyCamping(${campingVO.campingNo}, event)">수정</button>
								<button type="button" class="btn btn-danger btn-sm" onclick="deleteCamping(${campingVO.campingNo}, event)">삭제</button>
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
						<button type="button" class="page-link" onclick="listCamping(${beginNo-10})">이전</button>
					</li>
				</c:if>
				<c:forEach var="page" begin="${beginNo}" end="${endNo}" step="1">
					<c:if test="${page <= Math.ceil(totalCount/10)}">
						<c:choose>	
							<c:when test="${page==pageNo}">
								<li class="page-item active">
									<button type="button" class="page-link" onclick="listCamping(${page})">${page}</button>						
								</li>
							</c:when>
							<c:otherwise>
								<li class="page-item">
									<button type="button" class="page-link" onclick="listCamping(${page})">${page}</button>							
								</li>
							</c:otherwise>
						</c:choose>
					</c:if>
				</c:forEach>								
				<c:if test="${totalCount > endNo*10}">						
				   	<li class="page-item">
						<button type="button" class="page-link" onclick="listCamping(${beginNo+10})">다음</button>
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
	<input type="hidden" name="searchCategoryNo" value="${searchCategoryNo}" />
</form>

<script>
function listCamping(pageNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/campingAdminServlet/listCamping.do";	
	form.pageNo.value = pageNo;
	form.submit();
}
function readCamping(campingNo){
	var form = document.pagingForm;
	form.action = "${contextPath}/campingAdminServlet/readCamping.do?campingNo=" + campingNo;
	form.submit();
}
function modifyCamping(campingNo, event){
	event.stopPropagation();
	var form = document.pagingForm;
	form.action = "${contextPath}/campingAdminServlet/modifyCamping.do?campingNo=" + campingNo;
	form.submit();
}
function deleteCamping(campingNo, event){
	event.stopPropagation();
	var result = confirm("정말로 삭제하시겠습니까?");	
	if(result){
		var form = document.pagingForm;
		form.action = "${contextPath}/campingAdminServlet/deleteCamping.do?campingNo=" + campingNo;
		form.submit();
	}
}
</script>

<%@ include file="../inc/adminBottom.jsp"%>