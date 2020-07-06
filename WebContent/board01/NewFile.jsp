<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="boardList" value="${boardMap.boardList}"/>
<c:set var="totArticles" value="${boardMap.totArticles}"/>
<c:set var="section" value="${boardMap.section}"/>
<c:set var="pageNum" value="${boardMap.pageNum}"/>  
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

  <h2>이벤트 게시판</h2>

  <div class="row">

 	 <c:choose>

		<c:when test="${boardList == null }">
		      <div class="col-md-4">
					<p align="center"><b>등록된 글이 없습니다.</b></p>
			   </div>		
		</c:when> 
		<c:when test="${boardList != null}">
			<div class="col-md-4">
			<c:forEach var="board" items="${boardList}">
        	  <a href="${contextPath}/board/viewArticle.do?boardNo=${board.boardNo}" class="thumbnail"></a>	       				
        			<img src=""${contextPath}/images/${board.boardImageFileName}.jpg" alt="city1" style="width:200px;height:150px">
        				<p align="center">${board.boardTitle}</p>
					   </c:forEach>						
						</c:when>						
					</c:choose>
											
						
<!--     <div class="col-md-4">
  <a href="city1.jpg" class="thumbnail">
        <p>이벤트1</p>
        <img src="../images/event_1.jpg" alt="city1" style="width:200px;height:150px">
      </a>
	</div>
	
    <div class="col-md-4">
  <a href="city2.jpg" class="thumbnail">
        <p>이벤트2</p>
        <img src="../images/event_2.jpg"  alt="city1" style="width:200px;height:150px">
      </a>
    </div>

    <div class="col-md-4">
  <a href="city3.jpg" class="thumbnail">
        <p>이벤트3</p>
        <img src="../images/event_3.jpg"  alt="city1" style="width:200px;height:150px">
      </a>
    </div>

    <div class="col-md-4">
  <a href="city1.jpg" class="thumbnail">
        <p>이벤트1</p>
        <img src="../images/event_1.jpg" alt="city1" style="width:200px;height:150px">
      </a>
    </div>

    <div class="col-md-4">
  <a href="city2.jpg" class="thumbnail">
        <p>이벤트2</p>
        <img src="../images/event_2.jpg"  alt="city1" style="width:200px;height:150px">
      </a>
    </div>

    <div class="col-md-4">
  <a href="city3.jpg" class="thumbnail">
        <p>이벤트3</p>
        <img src="../images/event_3.jpg"  alt="city1" style="width:200px;height:150px">
      </a>
    </div>
    <div class="col-md-4">
  <a href="city1.jpg" class="thumbnail">
        <p>이벤트1</p>
        <img src="../images/event_1.jpg" alt="city1" style="width:200px;height:150px">
      </a>
    </div>

    <div class="col-md-4">
  <a href="city2.jpg" class="thumbnail">
        <p>이벤트2</p>
        <img src="../images/event_2.jpg"  alt="city1" style="width:200px;height:150px">
      </a>
    </div>

    <div class="col-md-4">
  <a href="city3.jpg" class="thumbnail">
        <p>이벤트3</p>
        <img src="../images/event_3.jpg"  alt="city1" style="width:200px;height:150px">
      </a>
    </div> -->


  </div>

</div>

</body>

</html>
