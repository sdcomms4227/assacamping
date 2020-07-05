<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역확인</title>
</head>
<body>
	<h1 align="center">주문내역확인 </h1>
	<form action="${contextPath}/order/*" method="post">
		
		<table border="1" align="center" width="30%">
			
		<c:choose>
		 <c:when test="${orderlist != null }">
		     <c:forEach items="${orderlist}" var="order">
						<tr align="center">
							<th>상품명</th>
							<td><a href="cartorder/orderDetail.do?productNo=${order.productNo}">${order.productName}</a></td>
							<td>${order.userName}</td>
							<td>${order. cartQuantity}</td>
							
						</tr>
				 </c:forEach>	
				
			  </c:when>
			</c:choose>
						<tr>
						<c:choose>
						   <c:when test="${orderlist != null }">
		                      <c:forEach items="${orderlist}" var="order" begin="0" end="0">
							<th>총가격</th>
							<td colspan="3"><fmt:formatNumber type="number" maxFractionDigits="3" value="${order.productPayment}" /></td>
							</c:forEach>
							</c:when>
					  </c:choose>
					 
						</tr>
						

		</table>
	</form>
	<h2 align="center">주문해주셔서 감사합니다.</h2>
	<div align="center">
	<a href="${contextPath}/index.jsp">홈</a>
	<a href="${contextPath}/ }">마이페이지</a>
	</div>
	
	
</body>
</html>