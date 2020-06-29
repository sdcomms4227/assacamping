<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
    
<%--컨텍스트 주소 얻기 --%>    
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>   

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style type="text/css">
		.cls1{ text-decoration: none;}
		.cls2{ text-align: center; font-size: 30px;}
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
	<%--BoardController.java서블릿으로 부터 전달 받은 
	    request영역에 boardList속성(키)이름으로 바인딩된 ArryList객체가 저장되어 있지 않다면? --%>
	<c:when test="${requestScope.boardList == null }">
			<tr height="10">
				<td colspan="4">
					<p align="center"><b>등록된 글이 없습니다.</b></p>
				</td>
			</tr>
	</c:when>
	
	<c:when test="${requestScope.boardList != null}">
		<%--ArrayList객체의 크기(검색한 글의 갯수(ArticleVO객체의 갯수))만큼 반복하여
			검색한 글정보(ArticleVO객체)들을 ArrayList배열 내부의 각인덱스 위치로부터 차례대로 꺼내와
			검색한 글목록을 표시합니다.
		 --%>
		<c:forEach var="board" items="${boardList}">
			<tr align="center">
				<%--varStatus의 count속성을 이용해 글번호를 1부터 자동으로 표시함 --%>
				<td width="5%">${board.boardNo}</td>
				<%--ArticleVO객체의 id변수값 얻어 출력 --%>
				<td width="10%">${board.userId}</td>
							
				<td width="35%" align="left">
					<%--왼쪽으로 30px만큼 여백을 준 후 글제목을 표시할 목적으로 여백을 줌 --%>
					<span style="padding-right: 30px"></span>        
							<a class="cls1"  
							 	href="${contextPath}/board/viewArticle.do?boardNo=${board.boardNo}">
							 	${board.boardTitle}
							</a>
				</td>
				<td width="10%"><fmt:formatDate value="${board.boardWriteDate}"/></td>
				<td width="10%">${board.boardReadCount}</td>
			</tr>
		</c:forEach>
	</c:when>
</c:choose>				
		</table>
		
		<%-- 글쓰기 <a>링크를 클릭했을떄.. 글을 작성할수 있는 화면으로 이동시켜줘~ 라는 요청을? 
		     BoardController서블릿으로 하게됨 --%>
		<a class="cls1" href="${contextPath}/board/articleForm.do">
			<p class="cls2">글쓰기</p>
		</a>
</body>
</html>











