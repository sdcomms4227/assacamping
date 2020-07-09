<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="userId" value="${sessionScope.userId}" />
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
	    obj.action="${contextPath}/eve/listEvent.do";
	    obj.submit();
     }
 
	 function fn_enable(obj){
		 document.getElementById("i_title").disabled=false;
		 document.getElementById("i_content").disabled=false;
		 document.getElementById("i_imageFileName").disabled=false;
		 document.getElementById("tr_btn_modify").style.display="block";
		 document.getElementById("tr_btn").style.display="none";
	 }
	 							
	 function fn_modify_event(obj){
		 obj.action="${contextPath}/eve/modEvent.do";
		 obj.submit();
	 }
	 
	 function fn_remove_event(url,eventNo){		 
		 var form = document.createElement("form");
		 form.setAttribute("method", "post");
		 form.setAttribute("action", url);		 
		 
	     var eventNOInput = document.createElement("input");
	     eventNOInput.setAttribute("type","hidden");
	     eventNOInput.setAttribute("name","eventNo");
	     eventNOInput.setAttribute("value",eventNo);
	     
	     form.appendChild(eventNOInput);	          
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
  <form name="frmEvent" method="post"  
        action="${contextPath}"  enctype="multipart/form-data">
  <table  border="0"  align="center">
  <tr>
   <td width="150" align="center" bgcolor="#FF9933">
      글번호
   </td>
   <td >
    <input type="text"  value="${event.eventNo}"  disabled />
    <%--글 수정시 글번호를 컨트롤러로 전송 하기 위해 미리 hidden태그를 이용해 글번호를 저장 합니다. --%>
    <input type="hidden" name="eventNo" value="${event.eventNo}"  />
   </td>
  </tr>
  <tr>
   <td width="150" align="center" bgcolor="#FF9933">
      아이디
   </td>
   <td >
    <input type=text name="userId"value="${userId}" name="writer"  disabled />
   </td>
  </tr>
  <tr>
   <td width="150" align="center" bgcolor="#FF9933">
      제목 
   </td>
   <td>
    <input type=text value="${event.eventTitle}"  name="eventTitle"  id="i_title" disabled />
   </td>   
  </tr>
    <tr>
   <td width="150" align="center" bgcolor="#FF9933">
      조회수 
   </td>
   <td>
    <input type=text value="${event.eventReadCount}"  name="eventReadCount"  id="i_title" disabled />
   </td>   
  </tr>
  <tr>
   <td width="150" align="center" bgcolor="#FF9933">
      내용
   </td>
   <td>
    <textarea rows="20" cols="60"  name="eventContent"  id="i_content"  disabled />
	${event.eventContent}
	</textarea>
   </td>  
  </tr>
 
<c:if test="${not empty event.eventImageFileName && event.eventImageFileName!='null' }">  
<tr>
   <td width="150" align="center" bgcolor="#FF9933" rowspan="2">
      이미지
   </td>
   <td>
     <input  type= "hidden"   name="originalFileName" value="${event.eventImageFileName }" />
    <img src="${contextPath}/files/event/${event.eventNo}/${event.eventImageFileName}" id="preview"/><br>
       
   </td>   
  </tr>  
  <tr>
    <td>
       <%-- 수정된 이미지 파일 이름을 전송 --%>
       <input  type="file"  name="imageFileName" 
	    id="i_imageFileName"  disabled   onchange="readURL(this);"   />
    </td>
  </tr>
 </c:if>
  <tr>
	   <td width=20% align=center bgcolor=#FF9933>
	      등록일자
	   </td>
	   <td>
	    <input type=text value="<fmt:formatDate value="${event.eventWriteDate}" />" disabled />
	   </td>   
  </tr>
  <tr   id="tr_btn_modify"  >
	   <td colspan="2"   align="center" >
	       <input type=button value="수정반영하기"   onClick="fn_modify_event(frmEvent)"  >
         <input type=button value="취소"  onClick="backToList(frmEvent)">
	   </td>   
  </tr>
    
  <tr  id="tr_btn" >
   <td colspan=2 align=center>
	    <input type=button value="수정하기" onClick="fn_enable(this.form)">
	    <input type=button value="삭제하기" 
		onClick="fn_remove_event('${contextPath}/eve/removeEvent.do',${event.eventNo})" >    
	    <input type=button value="리스트로 돌아가기"  
		onClick="backToList(this.form)">
   </td>   
  </tr>
 </table>
 </form>
</body>
</html>