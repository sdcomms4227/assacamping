<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="eventList" value="${eventMap.eventList}"/>
<c:set var="totEvents" value="${eventMap.totEvents}"/>
<c:set var="section" value="${eventMap.section}"/>
<c:set var="pageNum" value="${eventMap.pageNum}"/>  
<c:set var="search" value="${eventMap.search}"/>
<c:set var="userId" value="${sessionScope.userId}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>이벤트 게시판</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

	<style type="text/css">
		.cls1{ text-decoration: none;}
		.cls2{ text-align: center; font-size: 30px;}
		.cls3{ text-align: right; font-size: 25px;}
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
		<c:when test="${eventList == null }">
		      <div class="col-md-4">
					<p align="center"><b>등록된 글이 없습니다.</b></p>
			   </div>		
		</c:when> 
		<c:when test="${eventList != null}">
			<c:forEach var="event" items="${eventList}">
				<div class="col-md-4">
	        		<a href="${contextPath}/eve/readEvent.do?eventNo=${event.eventNo}" class="thumbnail">
	        			<img src="${contextPath}/files/event/${event.eventNo}/${event.eventImageFileName}"  style="width:250px;height:180px">
	        		      <p align="center">${event.eventTitle}</p>	
	        		</a>
	        	</div>	
			</c:forEach>						
		</c:when>						
	</c:choose>
	</div>	
	  <div class="cls2">
			<c:if test="${totEvents != null}">
				<c:choose>
					<c:when test="${totEvents > 100}">					
						<c:forEach var="page" begin="1" end="10" step="1">
							<c:if test="${section > 1 && page=1}">
								<a href="${contextPath}/eve/listEvent.do?section=${section-1}&pageNum=${(section-1)*10+1}&search=${search}">
								&nbsp;이전</a>
							</c:if>								
							<a href="${contextPath}/eve/listEvent.do?section=${section}&pageNum=${page}&search=${search}">${(section-1)*10}</a>					
							<c:if test="${page==10}">
								<a href="${contextPath}/eve/listEvent.do?section=${section+1}&pageNum=${section*10+1}&search=${search}&search=${search}">
								&nbsp;다음</a>
							</c:if>												
						</c:forEach>		
					</c:when>
					<c:when test="${totEvents ==100}">
						<c:forEach var="page" begin="1" end="10" step="1">
							<a href="#">${page}</a>
						</c:forEach>										
					</c:when>			
					<c:when test="${totEvents < 100 }">
						<c:forEach var="page" begin="1" end="${totEvents/10+1}" step="1">
							<c:choose>
					   <c:when test="${page==pageNum}">		       
							  <a class="sel-page" href="${contextPath}/eve/listEvent.do?section=${section}&pageNum=${page}&search=${search}">
							  ${page}
							  </a>
						</c:when>	
						<c:otherwise>	  	     
							  <a class="no-unline" href="${contextPath}/eve/listEvent.do?section=${section}&pageNum=${page}&search=${search}">
							  ${page}
							  </a>	
						</c:otherwise>
							</c:choose>												
						</c:forEach>					
					</c:when>
				</c:choose>			
			</c:if>			
		</div>
		<form action="${contextPath}/eve/listEvent.do">
		  <input type="hidden" name="section" value="${section}" >
		  <input type="hidden" name="pageNum" value="${pageNum}" >
		  <input type="text" name="search" value="${search}" >		  		  
		  <button type="submit">검색</button>
		  <a href="${contextPath}/eve/listEvent.do"><button type="button">목록보기</button></a>
		</form>  
		<%-- ID가 admin일 경우만 글쓰기 가능 --%>
		<c:if test="${userId eq 'admin'}">
			<a class="cls1" href="${contextPath}/eve/eventForm.do">
			<p class="cls3">글쓰기</p>
			</a>
		</c:if>	
</div>
</body>
</html>
