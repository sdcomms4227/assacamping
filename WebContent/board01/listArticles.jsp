<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
      
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
<c:set var="boardList" value="${boardMap.boardList}"/>
<c:set var="totArticles" value="${boardMap.totArticles}"/>
<c:set var="section" value="${boardMap.section}"/>
<c:set var="pageNum" value="${boardMap.pageNum}"/>  

<%
	request.setCharacterEncoding("UTF-8");
%> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style type="text/css">
		.cls1{ text-decoration: none;}
		.cls2{ text-align: center; font-size: 30px;}
		
		.no-unline{text-decoration: none;}
		/* 선택된 페이지 번호를 밑줄 없이 빨간색으로 표시 */
		.sel-page{text-decoration: none; color: red;}		
	</style>
</head>
<body>
		<table align="center" border="1" with="80%" >
			<tr height="10" align="center" bgcolor="lightgreen">
				<td>글번호</td>
				<td>작성자</td>
				<td>제목</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
	<c:choose>
		<c:when test="${boardList == null }">
			<tr height="10">
				<td colspan="5">
					<p align="center"><b>등록된 글이 없습니다.</b></p>
				</td>
			</tr>
		</c:when>
	
		<c:when test="${boardList != null}">
		
			<c:forEach var="board" items="${boardList}">
				<tr align="center">
					<td width="5%">${board.boardNo}</td>			
					<td width="10%">${board.userId}</td>						
					<td width="35%" align="left">
					<span style="padding-right: 30px"></span>  
					
						<c:choose>
						<c:when test="${board.boardRe_lev > 0}">
							 <c:forEach begin="1" end="${board.boardRe_lev}" step="1">
							 	 <span style="padding-left: 20px"></span>
							 </c:forEach>
							 <%-- 공백 다음에 자식글을 표시 --%>
							 <span style="font-size: 12px;">[답글]</span>
							 	<a class="cls1"  
							 		href="${contextPath}/board/viewArticle.do?boardNo=${board.boardNo}">
							 				${board.boardTitle}  
							 	</a>
						</c:when>
						<c:otherwise>					
								<a class="cls1"  
							 	href="${contextPath}/board/viewArticle.do?boardNo=${board.boardNo}">
							 	${board.boardTitle}
							</a>
						</c:otherwise>
					</c:choose>				
				</td>
				<td width="10%"><fmt:formatDate value="${board.boardWriteDate}"/></td>
				<td width="10%">${board.boardReadCount}</td>
			</tr>
		</c:forEach>
	</c:when>
</c:choose>				
		</table>	
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
					<%--전체 글수가 100개 일때는 ? 첫 번째 section의 10개의 페이지만 표시하면 됩니다. --%>
					<c:when test="${totArticles ==100}">
						<c:forEach var="page" begin="1" end="10" step="1">
							<a href="#">${page}</a>
						</c:forEach>										
					</c:when>			
					<%--전체 글 수가 100개보다 적을때 페이징을 표시함 --%>
					<c:when test="${totArticles < 100 }">
													 <%-- 글수가 100개 되지 않으므로  표시되는 페이지는 10개가 되지 않고, 전체 글수를 10으로 나누어 구한 몫에 1을 더한 페이지까지 표시됩니다.--%>
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
		<a class="cls1" href="${contextPath}/board/articleForm.do">
		<p class="cls2">글쓰기</p>
		</a>				
</body>
</html>











