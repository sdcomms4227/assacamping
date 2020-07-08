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
<title>결제내역리스트 </title>
</head>
<body>
	<h1 align="center">결제내역 </h1>
   <form action="${contextPath}/order/*" method="post">
	 <table border="1" align="center" width="30%">
		  <tr>

		        <th>주문번호</th>
		        <th>결제일</td>
		        <th>구매상태</th>
		     </tr>
		<c:choose>
		  <c:when test="${orderNo !=null}" >
		     <c:forEach items="${orderNo}" var="order" >
		      <tr>
		         <td> <a href="${contextPath}/cartorder/orderInfo.do?orderNo=${order.orderNo}">${order.orderNo}</a></td>
		         <td>${order.orderDate}</td>
		         <td>${order.orderState}</td>
		      </tr>                 
		     </c:forEach>
		   </c:when>
		</c:choose>
		
		
		     <%-- <c:choose>
		  <c:when test="${payList !=null}" >
		     <c:forEach items="${payList}" var="payList" >
		    
		           <tr>
		            <td><a href="${contextPath}/cartorder/orderInfo.do?orderNo=${payList.orderNo}"> ${payList.productName}</a></td>
		            <td>${payList.cartQuantity}</td>
		            <td>${payList.orderNo}</td>
		            <td>${payList.orderDate}</td>
		            <td><a href="${contextPath}/pro/getOnePro.do?productNo=${payList.productNo}">재구매</a></td>
		           </tr> 
		         
		  </c:forEach>
		   </c:when>
		</c:choose> --%>
		
		
	</table>	
	
						
		
	</form>
	<h2 align="center">주문해주셔서 감사합니다.</h2>
	<div align="center">
	<a href="${contextPath}/index.jsp">홈</a>
	
	</div>
	
	
</body>
</html>