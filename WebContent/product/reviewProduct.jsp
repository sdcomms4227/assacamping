<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<title>ASSA Product - 나혼자간다</title>
<meta charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>
<body>


<script>

//페이지 로딩시 리뷰 목록 출력 
$(document).ready(function(){
	console.log(1);
    reviewList(); 
});

// 리뷰 목록 가져와서 보여주기
function reviewList(){
	var _url = '${contextPath}/proreview/listReview.do';
	var _reviewListInfo = '{"productNo":"'+${productNo}+'"}';
	var no = ${productNo};
	console.log(no);
    $.ajax({
        url : _url,
        type : 'post',
        data : {reviewListInfo : _reviewListInfo},
        success : function(data){
        	var a = '';
        	
        	if(data == null || data == '') {
        		a += '<li class=" review clearfix">';
       			a += '<p>등록된 댓글이 없습니다.</p>';
       			a += '</li>';
       			$(".reviews_container").html(a);	
       			return;
       		}
        	
       		var jsonInfo = JSON.parse(data);
       	
        	$.each(jsonInfo, function(index, entry){
	        	$.each(entry, function(key, value){
	            		
	    	    	var no = value.commentNo;
		    	    var name = value.userName;
 			       	var content = value.commentContent;
	        	   	var date = value.commentWriteDate;	
	           		var id = value.userId;
					
					a += '<li class=" review clearfix">';
					a += '<div class="review_image"><img src="${contextPath}/images/review_1.jpg" alt=""></div>';
					a += '<div class="review_content">';
					a += '<div class="review_name"><a href="#">'+name+'</a></div>';
					a += '<div class="review_date">'+date+'</div>'
					a += '<div class="rating rating_4 review_rating" data-rating="4">';
					a += '<i class="fa fa-star"></i>';
					a += '<i class="fa fa-star"></i>';
					a += '<i class="fa fa-star"></i>';
					a += '<i class="fa fa-star"></i>';
					a += '<i class="fa fa-star"></i>';
					a += '</div>';
					a += '<div class="review_text">';
					a += '<p>'+content+'</p>';
					if('${userId}' == id){
						a += '<button type="button" class="btn btn-sm btn-danger ml-2" onclick="commentUpdate('+no+',\''+content+'\')">수정</button>';
						a += '<button type="button" class="btn btn-sm btn-danger ml-2" onclick="commentDelete('+no+')">삭제</button>';
					}
					a += '<button type="button" class="btn btn-sm btn-danger ml-2" onclick="commentReply('+no+')">답변</button>';
					a += '</div>';
					a += '</div>';
					a += '</li>';
					
					$(".reviews_container").html(a);	
           		});
          		});
       },
       error: function(err) {
    	   alert("ajax 통신에러");
       }
    });
}

// 댓글 등록
function reviewSubmit(){
	
	var productNo = ${productNo};
	var userId = '${userId}';
	var userName = '${userName}';
	var reviewContent = document.reviewform.reviewContent.value; 
	
	if(commentContent.length == 0){
		alert("댓글 내용을 입력해주세요.");
		document.commentform.commentContent.focus();
		return;
	}
	
	var _commentInfo = '{"boardCategoryNo":"'+boardCategoryNo+'","boardNo":"'+boardNo+'","userId":"'+userId+'","userName":"'+userName+'","commentContent":"'+commentContent+'"}';
	var _url = '${contextPath}/comment/insertComment.do';			
	$.ajax({
		type : "post",
		async : "false",
		url : _url,
		data : {commentInfo : _commentInfo},
		success : function(data, status){
			
			// 정상적으로 댓글이 등록되었다면 댓글목록을 reload
			commentList();
			
			$("#commentContent").val("");
			if($("#commentEmpty")){
				$("#commentEmpty").remove();
			}
				
		},
		error : function(){
			alert("통신에러가 발생했습니다.");	
		}				
	});
}

// 대댓글 달기 - input 폼 변
function commentReply(commentNo) {
	
	var a = '';
	
	a += '<colgroup class="d-lg-none"><col/><col style="width:112px" /></colgroup><colgroup class="d-none d-lg-table-column-group"><col style="width:80px" /><col /><col style="width:112px" /></colgroup>';
	a += '<tr>';
	a += '<td class="d-none d-lg-table-cell align-middle">';
	a += '<p class="m-0">${userName}</p>';
	a += '</td>';
	a += '<td class="pr-0">';
	a += '<p class="d-block d-lg-none text-left mb-1 text-muted">${userName}</p>';
	a += '<label for="commentContent" class="d-none">답변하세요</label>';
	a += '<input class="form-control" type="text" name="replyContent" id="replyContent" required />';
	a += '</td>';
	a += '<td class="align-bottom">';
	a += '<button type="button" class="btn btn-primary" onclick="commentReplyProc('+commentNo+')">답변하기</button>';
	a += '</td>';
	a += '</tr>';

	$(".comment-form-table").html(a);
}

// 대댓글 달기
function commentReplyProc(commentNo) {
	
	var boardCategoryNo = ${boardCategoryNo};
	var boardNo = ${boardNo};
	var userId = '${userId}';
	var userName = '${userName}';
	var replyContent = document.commentform.replyContent.value; 
	
	if(replyContent.length == 0){
		alert("답변 내용을 입력해주세요.");
		document.commentform.replyContent.focus();
		return;
	}
	
	var _commentReplyInfo = '{"commentNo":"'+commentNo+'","boardCategoryNo":"'+boardCategoryNo+'","boardNo":"'+boardNo+'","userId":"'+userId+'","userName":"'+userName+'","replyContent":"'+replyContent+'"}';
	var _url = '${contextPath}/comment/replyComment.do';
	
	$.ajax({
		type : "post",
		async : "false",
		url : _url,
		data : {commentReplyInfo : _commentReplyInfo},
		success : function(data, status){
			
			// 정상적으로 댓글이 등록되었다면 댓글목록을 reload
			commentList();
			
			$("#replyContent").val("");
			if($("#commentEmpty")){
				$("#commentEmpty").remove();
			}
				
		},
		error : function(){
			alert("통신에러가 발생했습니다.");	
		}				
	});
}

// 댓글 수정 - 댓글 내용 출력을 input 폼으로 변경
function commentUpdate(commentNo, originalContent) {
	
	var a = '';
	
	a += '<colgroup class="d-lg-none"><col/><col style="width:112px" /></colgroup><colgroup class="d-none d-lg-table-column-group"><col style="width:80px" /><col /><col style="width:112px" /></colgroup>';
	a += '<tr>';
	a += '<td class="d-none d-lg-table-cell align-middle">';
	a += '<p class="m-0">${userName}</p>';
	a += '</td>';
	a += '<td class="pr-0">';
	a += '<p class="d-block d-lg-none text-left mb-1 text-muted">${userName}</p>';
	a += '<label for="commentContent" class="d-none">수정하세요</label>';
	a += '<input class="form-control" type="text" name="updateContent" id="updateContent" value='+originalContent+' required />';
	a += '</td>';
	a += '<td class="align-bottom">';
	a += '<button type="button" class="btn btn-primary" onclick="commentUpdateProc('+commentNo+')">수정하기</button>';
	a += '</td>';
	a += '</tr>';

	$(".comment-form-table").html(a);
}

// 댓글 수정
function commentUpdateProc(commentNo) {
	var result = confirm("댓글을 수정하시겠습니까?");
	var updateContent = document.commentform.updateContent.value;
	
	if(result) {
		var userId = '${userId}';
		var _commentUpdateInfo = '{"userId":"'+userId+'","commentNo":"'+commentNo+'","updateContent":"'+updateContent+'"}';
		var _url = '${contextPath}/comment/updateComment.do';
		
		$.ajax({
			type : "post",
			async : "false",
			url : _url,
			data : {commentUpdateInfo : _commentUpdateInfo},
			success : function(data, status) {

				var a = '';
										
				a += '<colgroup class="d-lg-none"><col/><col style="width:112px" /></colgroup><colgroup class="d-none d-lg-table-column-group"><col style="width:80px" /><col /><col style="width:112px" /></colgroup>';
				a += '<tr>';
				a += '<td class="d-none d-lg-table-cell align-middle">';
				a += '<p class="m-0">${userName}</p>';
				a += '</td>';
				a += '<td class="pr-0">';
				a += '<p class="d-block d-lg-none text-left mb-1 text-muted">${userName}</p>';
				a += '<label for="commentContent" class="d-none">내용</label>';
				a += '<input class="form-control" type="text" name="commentContent" id="commentContent" required />';
				a += '</td>';
				a += '<td class="align-bottom">';
				a += '<button type="button" class="btn btn-primary" onclick="commentSubmit()">댓글쓰기</button>';
				a += '</td>';
				a += '</tr>';
				
				$(".comment-form-table").html(a);
				commentList();
			},
			error : function(){
				alert("통신에러가 발생했습니다.");	
			}
		});
	}
}

// 댓글 삭제
function commentDelete(commentNo){
	
	var result = confirm("댓글을 삭제하시겠습니까?");
	
	if(result){	

		var userId = '${userId}';
		var _commentDeleteInfo = '{"userId":"'+userId+'","commentNo":"'+commentNo+'"}';
		var _url = '${contextPath}/comment/deleteComment.do'; 		
		$.ajax({
			type : "post",
			async : "false",
			url : _url,
			data : {commentDeleteInfo : _commentDeleteInfo},
			success : function(data, status){
				if(data == "success"){
					var str = "<td class='alert alert-danger text-center' colspan='3'>댓글이 삭제되었습니다.</td>";						
					$("#comment" + commentNo).html(str).fadeOut(1000, function(){
						$(this).remove();
						if($(".comment-list-table").find("tr").length == 0){
							
							var emptyStr = "";
							
							emptyStr += '<tr id="commentEmpty">';
							emptyStr += '	<td class="py-5 text-center" colspan="3">등록된 댓글이 없습니다.</td>';
							emptyStr += '</tr>';
							
							$(".comment-list-table").append(emptyStr);
						}
					});
				}else{
					alert("댓글이 정상적으로 삭제되지 않았습니다.");
				}
			},
			error : function(){
				alert("통신에러가 발생했습니다.");	
			}				
		});
	}
} // review

</script>
</body>
</html>