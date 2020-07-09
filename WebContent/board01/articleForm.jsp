<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
      
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<c:set var="userId" value="${sessionScope.userId}"/>
 
<%
	request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 화면</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script type="text/javascript">
	
		function readURL(input){

			if(input.files && input.files[0]){
				
				$("#tdImg").html("<img id='preview' src='#' width=200 height=200 />");
				
				var reader = new FileReader();				
				reader.readAsDataURL(input.files[0]);
				reader.onload = function(ProgressEvent){
					$('#preview').attr('src',ProgressEvent.target.result);					
				}				
			}			
		}
	
		 function backToList(obj){			 
			 obj.action = "${contextPath}/board/listArticles.do";
			 obj.submit(); 
		 }
		
	</script>
</head>
<body>
		<h1 style="text-align: center;">새글 쓰기</h1>
 		<form action="${contextPath}/board/addArticle.do"
 			  name="articleForm"
 			  method="post"
 			  enctype="multipart/form-data">
 			  
 			  <table border=0 align=center >
 			  	<tr>
 			  		<td align="right">작성자 :</td>
 			  		<td colspan="2"><input type="text" maxlength="500" name="userId" value="${userId}" disabled/></td>
 			  	</tr> 			  
 			  	<tr>
 			  		<td align="right">글제목 : </td>
 			  		<td colspan="2"><input type="text" maxlength="500" name="boardTitle" required/></td>
 			  	</tr>
 			  	<tr>
 			  		<td align="right" valign="top"><br>글 내용:</td>
 			  		<td colspan="2">
 			  			<textarea name="boardContent"  rows="10" cols="65" maxlength="4000" required></textarea>
 			  		</td>
 			  	</tr>
 			  	<tr>
 			  		<td align="right">이미지 파일 첨부 :</td>
 			  		<td><input type="file" name="boardImageFileName" onchange="readURL(this);" required></td>
 			  		<td id="tdImg"></td>
 			  	</tr>
 			  	<tr>
 			  		<td align="right"></td>
 			  		<td colspan="2">
 			  			<input type="submit" value="글쓰기"/>
 			  			<input type="button" value="글목록보기" onclick="backToList(this.form);" />
 			  		</td>
 			  	</tr>			  
 			  </table>
 		</form>
</body>
</html>










