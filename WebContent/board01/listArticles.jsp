<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="boardList" value="${boardMap.boardList}"/>
<c:set var="totArticles" value="${boardMap.totArticles}"/>
<c:set var="section" value="${boardMap.section}"/>
<c:set var="pageNum" value="${boardMap.pageNum}"/>  
<c:set var="userId" value="${sessionScope.userId}"/>
<!DOCTYPE html>
<html lang="ko">
<head>

  <title>이벤트</title>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

	<style type="text/css">
		.cls1{ text-decoration: none;}
		.cls2{ text-align: center; font-size: 30px;}
		
		.no-unline{text-decoration: none;}
		/* 선택된 페이지 번호를 밑줄 없이 빨간색으로 표시 */
		.sel-page{text-decoration: none; color: red;}		
	</style>
</head>

<body>


<div class="container">

  <h2 align="center">이벤트 게시판</h2>
  <br><br>

  <div class="row">

 	 <c:choose>

		<c:when test="${boardList == null }">
		      <div class="col-md-4">
					<p align="center"><b>등록된 글이 없습니다.</b></p>
			   </div>		
		</c:when> 
		<c:when test="${boardList != null}">
			<c:forEach var="board" items="${boardList}">
				<div class="col-md-4">
	        		<a href="${contextPath}/board/viewArticle.do?boardNo=${board.boardNo}" class="thumbnail">
	        			<img src="${contextPath}/files/event/${board.boardNo}/${board.boardImageFileName}"  style="width:250px;height:180px">
	        		      <p align="center">${board.boardTitle}</p>	
	        		</a>
	        	</div>	
			</c:forEach>						
		</c:when>						
	</c:choose>

	  <div class="cls2">
			<c:if test="${totArticles != null}">
				<c:choose>
					<%--전체 글수가 100보다 클때(검색한 글개수가 100초과인 경우) 페이징번호 표시  --%>
					<c:when test="${totArticles > 100}">
						
						<c:forEach var="page" begin="1" end="10" step="1">
							<%--섹션값 2부터는 앞 섹션으로 이동할 수 있는 pre문구를 표시 --%>
							<c:if test="${section > 1 && page=1}">
								<a href="${contextPath}/board/listArticles.do?section=${section-1}&pageNum=${(section-1)*10+1}">
								&nbsp;pre</a>
							</c:if>	
							
							<a href="${contextPath}/board/listArticles.do?section=${section}&pageNum=${page}">${(section-1)*10}</a>
														
							<%-- 페이지 번호 10 오른쪽에는 다음 섹션으로 이동할 수 있는 next를 표시 --%>
							<c:if test="${page==10}">
								<a href="${contextPath}/board/listArticles.do?section=${section+1}&pageNum=${section*10+1}">
								&nbsp;next</a>
							</c:if>												
						</c:forEach>		
					</c:when>
					<%--전체 글수가 100개 일때  --%>
					<c:when test="${totArticles ==100}">
						<c:forEach var="page" begin="1" end="10" step="1">
							<a href="#">${page}</a>
						</c:forEach>										
					</c:when>			
					<%--전체 글 수가 100개보다 적을때 페이징을 표시함 --%>
					<c:when test="${totArticles < 100 }">
						<c:forEach var="page" begin="1" end="${totArticles/10+1}" step="1">
							<c:choose>
					   <c:when test="${page==pageNum}">		       
							  <a class="sel-page" href="${contextPath}/board/listArticles.do?section=${section}&pageNum=${page}">
							  ${page}
							  </a>
						</c:when>	
						<c:otherwise>	  	     
							  <a class="no-unline" href="${contextPath}/board/listArticles.do?section=${section}&pageNum=${page}">
							  ${page}
							  </a>	
						</c:otherwise>
							</c:choose>												
						</c:forEach>					
					</c:when>
				</c:choose>			
			</c:if>			
		</div>
		<%-- ID가 admin일 경우만 글쓰기 가능 --%>
		<c:if test="${userId eq 'admin'}">
			<a class="cls1" href="${contextPath}/board/articleForm.do">
			<p class="cls2">글쓰기</p>
			</a>
		</c:if>															
    </div>
</div>

</body>

</html>
