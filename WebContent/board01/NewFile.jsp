<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<% request.setCharacterEncoding("UTF-8"); %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>

  <title>이벤트</title>

  <meta charset="utf-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

</head>

<body>

<


<div class="container">

  <h2>이미지 게시판</h2>

  <div class="row">

    <div class="col-md-4">
  <a href="city1.jpg" class="thumbnail">
        <p>이벤트1</p>
        <img src="images/event_1.jpg" alt="city1" style="width:200px;height:150px">
      </a>
    </div>

    <div class="col-md-4">
  <a href="city2.jpg" class="thumbnail">
        <p>이벤트2</p>
        <img src="images/event_2.jpg"  alt="city1" style="width:200px;height:150px">
      </a>
    </div>

    <div class="col-md-4">
  <a href="city3.jpg" class="thumbnail">
        <p>이벤트3</p>
        <img src="images/event_3.jpg"  alt="city1" style="width:200;height:150px">
      </a>
    </div>

    <div class="col-md-4">
  <a href="city1.jpg" class="thumbnail">
        <p>이벤트1</p>
        <img src="images/event_1.jpg" alt="city1" style="width:200;height:150px">
      </a>
    </div>

    <div class="col-md-4">
  <a href="city2.jpg" class="thumbnail">
        <p>이벤트2</p>
        <img src="images/event_2.jpg"  alt="city1" style="width:200px;height:150px">
      </a>
    </div>

    <div class="col-md-4">
  <a href="city3.jpg" class="thumbnail">
        <p>이벤트3</p>
        <img src="images/event_3.jpg"  alt="city1" style="width:200px;height:150px">
      </a>
    </div>
    <div class="col-md-4">
  <a href="city1.jpg" class="thumbnail">
        <p>이벤트1</p>
        <img src="images/event_1.jpg" alt="city1" style="width:200px;height:150px">
      </a>
    </div>

    <div class="col-md-4">
  <a href="city2.jpg" class="thumbnail">
        <p>이벤트2</p>
        <img src="images/event_2.jpg"  alt="city1" style="width:200px;height:150px">
      </a>
    </div>

    <div class="col-md-4">
  <a href="city3.jpg" class="thumbnail">
        <p>이벤트3</p>
        <img src="images/event_3.jpg"  alt="city1" style="width:200px;height:150px">
      </a>
    </div>


  </div>

</div>

</body>

</html>
