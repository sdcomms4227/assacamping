<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<head>
   <meta charset="UTF-8">
   <title>글보기</title>
   <style>
     #tr_btn_modify{
       display:none;
     }
   
   </style>
   <script  src="http://code.jquery.com/jquery-latest.min.js"></script> 
   <script type="text/javascript" >
     function backToList(obj){
	    obj.action="${contextPath}/board1/listArticles.do";
	    obj.submit();
     }
 
	 function fn_enable(obj){
		 document.getElementById("i_title").disabled=false;
		 document.getElementById("i_content").disabled=false;
		 document.getElementById("i_imageFileName").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
	 }
	 							
	 function fn_modify_article(obj){
		 obj.action="${contextPath}/board1/modArticle.do";
		 obj.submit();
	 }
	 
	 function fn_remove_article(url,articleNO){		 
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);		 
		 
	     var articleNOInput = document.createElement("input");
	     articleNOInput.setAttribute("type","hidden");
	     articleNOInput.setAttribute("name","articleNO");
	     articleNOInput.setAttribute("value",boardNo);

	     
	     form.appendChild(articleNOInput);	     
     
	     document.body.appendChild(form);	     

		 form.submit();
	 
	 }
	 
	 //수정할 이미지 파일을 다시 선택 했을때 미리 보기 이미지 보여 주는 곳
	 function readURL(input) {
	     if (input.files && input.files[0]) {
	         var reader = new FileReader();
	         reader.onload = function (e) {
	             $('#preview').attr('src', e.target.result);
	         }
	         reader.readAsDataURL(input.files[0]);
	     }
	 }  
 </script>
</head>
<body>
  <form name="frmArticle" method="post"  
        action="${contextPath}"  enctype="multipart/form-data">
  <table  border="0"  align="center">
  <tr>
   <td width="150" align="center" bgcolor="#FF9933">
      글번호
   </td>
   <td >
    <input type="text"  value="${board.boardNo}"  disabled />
    <%--글 수정시 글번호를 컨트롤러로 전송 하기 위해 미리 hidden태그를 이용해 글번호를 저장 합니다. --%>
    <input type="hidden" name="articleNO" value="${board.boardNo}"  />
   </td>
  </tr>
  <tr>
   <td width="150" align="center" bgcolor="#FF9933">
      작성자 아이디
   </td>
   <td >
    <input type=text value="${board.userId}" name="writer"  disabled />
   </td>
  </tr>
  <tr>
   <td width="150" align="center" bgcolor="#FF9933">
      제목 
   </td>
   <td>
    <input type=text value="${board.boardTitle}"  name="title"  id="i_title" disabled />
   </td>   
  </tr>
  <tr>
   <td width="150" align="center" bgcolor="#FF9933">
      내용
   </td>
   <td>
    <textarea rows="20" cols="60"  name="content"  id="i_content"  disabled />
	${board.boardContent}
	</textarea>
   </td>  
  </tr>
 
<c:if test="${not empty board.boardImageFileName && board.boardImageFileName!='null' }">  
<tr>
   <td width="150" align="center" bgcolor="#FF9933" rowspan="2">
      이미지
   </td>
   <td>
   	<%-- 이미지 수정에 대비해  미리 원래 이미지 파일 이름을 <hidden>태그에 저장합니다. --%>
     <input  type= "hidden"   name="originalFileName" value="${board.boardImageFileName }" />
    <img src="${contextPath}/download.do?boardNo=${board.boardNo}&boardImageFileName=${board.boardImageFileName}" id="preview"/><br>
       
   </td>   
  </tr>  
  <tr>
    <td>
       <%-- 수정된 이미지 파일 이름을 전송 합니다. --%>
       <input  type="file"  name="imageFileName" 
	    id="i_imageFileName"   disabled   onchange="readURL(this);"   />
    </td>
  </tr>
 </c:if>
  <tr>
	   <td width=20% align=center bgcolor=#FF9933>
	      등록일자
	   </td>
	   <td>
	    <input type=text value="<fmt:formatDate value="${board.boardWriteDate}" />" disabled />
	   </td>   
  </tr>
  <tr   id="tr_btn_modify"  >
	   <td colspan="2"   align="center" >
	   		<%--
	   			수정 반영하기 버튼을 클릭하면  함수를 호출시  <form>태그의 name속성값 frmArticle을 전달 하여
	   			<form>태그를 이용하여  BoardController서블릿으로 수정요청을 함
	   			수정요청 주소 :  /board/modArticle.do
	   		 --%>
	       <input type=button value="수정반영하기"   onClick="fn_modify_article(frmArticle)"  >
         <input type=button value="취소"  onClick="backToList(frmArticle)">
	   </td>   
  </tr>
    
  <tr  id="tr_btn"    >
   <td colspan=2 align=center>
	    <input type=button value="수정하기" onClick="fn_enable(this.form)">
	    <input type=button value="삭제하기" 
		onClick="fn_remove_article('${contextPath}/board1/removeArticle.do',${board.boardNo})">
	    <input type=button value="리스트로 돌아가기"  
		onClick="backToList(this.form)">
	    <input type=button value="답글쓰기"  
		onClick="fn_reply_form('${contextPath}/board1/replyForm.do', ${board.boardNo})">
   </td>
  </tr>
 </table>
 </form>
</body>
</html>