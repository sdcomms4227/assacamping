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
<title>주문상세내역 </title>
</head>
<body>
	<h1 align="center">주문상세내역 </h1>
	<form action="${contextPath}/order/*" method="post">
		
		<table border="1" align="center" width="30%">

		<c:choose>
		 <c:when test="${orderInfo != null }">
		 <tr align="center">
			<th >상품명</th>
			 <td >
		     <c:forEach items="${orderInfo}" var="order">
                
                 ${order.productName} <a href="${contextPath}/pro/getOnePro.do?productNo=${order.productNo}">재구매</a> <br>
                 
			 
				 </c:forEach>	
				  </td>
				 </tr>
				 <tr align="center">
				<th>배송지</th>
                <td colspan="2">
                   ${orderInfo[0].userZipcode}<br>
                  ${orderInfo[0].userAddress1}${orderInfo[0].userAddress2 }
                 <br>배송메시지  = ${orderInfo[0].userComment} 
                 
                </td>
                </tr>
                <tr  align="center">
                  <th>배송상태</th>
                  <td>배송상태 = ${orderInfo[0].orderState}</td>
                </tr>
			  </c:when>
			  <c:otherwise>
			    <tr>
			       <td >주문한 상품이 없습니다</td>
			    </tr>
			  </c:otherwise>
			</c:choose>
		</table>
	</form>
	<div align="center">
	<a href="${contextPath}/cartorder/orderDelete.do?orderNo=${orderInfo[0].orderNo}">주문취소</a>
	<a href="${contextPath}/index.jsp">홈</a>
	</div>
	
	
</body>
</html>