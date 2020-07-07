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
		
		
			
		<c:choose>
		 <c:when test="${orderNo != null  }">
		     <c:forEach items="${orderNo}"  var="order" >
						<c:set var="pay" value="${payList[0]}"/>
				
					   <table border="1" align="center" width="30%">
					   <tr>
					   <td>
					      <a href="${contextPath}/cartorder/orderInfo.do?orderNo=${order.orderNo}"> ${pay.productName}</a><br>
					       ${pay.productPayment }
					       ${pay.productDelivery}
					       ${pay.orderDate}
					       ${order.orderNo}
					       ${order.orderState}
				           
					   </td>
					   </tr>
					   </table>
					</c:forEach> 
			  </c:when>
			</c:choose>
						
		
	</form>
	<h2 align="center">주문해주셔서 감사합니다.</h2>
	<div align="center">
	<a href="${contextPath}/index.jsp">홈</a>
	
	</div>
	
	
</body>
</html>