<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="boardCategoryNo" value="1" />
<c:set var="boardNo" value="1" />
<c:set var="userId" value="${'hong'}" />
<c:set var="userName" value="${'홍길동'}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="container">
        <label for="content">comment</label>
        <p class="m-0">${userName}</p>
        <form name="commentInsertForm">
            <div class="input-group">
               <input type="hidden" name="boardCategoryNo" value="${boardCategoryNo}"/>
               <input type="hidden" name="boardNo" value="${boardNo}"/>
               <input type="hidden" name="userId" value="${userId}"/>
               <input type="hidden" name="userName" value="${userName}"/>
               <input type="text" class="form-control" id="content" name="commentContent" placeholder="내용을 입력하세요.">
               <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
               </span>
              </div>
        </form>
    </div>
    
    <div class="container">
        <div class="commentList"></div>
    </div>

<script>
//var boardCategoryNo = '${sessionScope.boardCategoryNo}';
//var boardNo = '${requestScope.boardNo}'; //게시글 번호
var boardCategoryNo = '1';
var boardNo = '1'; //게시글 번호
 
$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});
 
 
 
//댓글 목록 
function commentList(){
    $.ajax({
        url : '/comment/listComment.do',
        type : 'get',
        data : {'boardCategoryNo':boardCategoryNo, 'boardNo':boardNo},
        success : function(data){
            var a =''; 
            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.commentNo+'">'+'댓글번호 : '+value.commentNo+' / 작성자 : '+value.userName;
                a += '<a onclick="commentUpdate('+value.commentNo+',\''+value.commentContent+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.commentNo+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+value.commentNo+'"> <p> 내용 : '+value.commentContent +'</p>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : '${contextPath}/comment/insertComment.do',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(cno, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+cno+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+cno).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(cno){
    var updateContent = $('[name=content_'+cno+']').val();
    
    $.ajax({
        url : '/comment/updateComment.do',
        type : 'post',
        data : {'content' : updateContent, 'cno' : cno},
        success : function(data){
            if(data == 1) commentList(bno); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(commentNo){
    $.ajax({
        url : '/comment/deleteComment.do?commentNo='+commentNo,
        type : 'post',
        success : function(data){
            if(data == 1) commentList(); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
 
 
</script>


</body>
</html>