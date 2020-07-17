<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<% request.setCharacterEncoding("UTF-8"); %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="userId" value="${sessionScope.userId}" />
<c:set var="userName" value="${sessionScope.userName}" />

<c:set var="eventNo" value="${sessionScope.eventNo}" />
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>comment</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<article class="mt-5">
		<div class="row">
			<div class="col-12">
				<h3>댓글</h3>
			</div>
		</div>
		
		<table class="table comment-list-table">
			<colgroup>
				<col style="width:80px" />
				<col />
				<col style="width:120px" />
			</colgroup>
		</table>
		
		<form name="commentform">
			<table class="table comment-form-table bg-light">
				
				<c:if test="${userId == null}">
					<tr>
						<td class="py-5 text-center bg-light">로그인 한 사용자만 댓글을 작성할 수 있습니다.</td>
					</tr>
				</c:if>
				
				<c:if test="${userId != null}">
					<colgroup class="d-lg-none">
						<col />
						<col style="width:112px" />
					</colgroup>
					<colgroup class="d-none d-lg-table-column-group">
						<col style="width:80px" />
						<col />
						<col style="width:112px" />
					</colgroup>
					<tr>
						<td class="d-none d-lg-table-cell align-middle">
							<p class="m-0">${userName}</p>
						</td>
						<td class="pr-0">
							<p class="d-block d-lg-none text-left mb-1 text-muted">${userName}</p>
							<label for="commentContent" class="d-none">내용</label>
							<input class="form-control" type="text" name="commentContent" id="commentContent" required />
						</td>
						<td class="align-bottom">
							<button type="button" class="btn btn-primary" onclick="commentSubmit()">댓글쓰기</button>
						</td>
					</tr>
				</c:if>
			</table>
		</form>
	</article>
	
	<script>
		//페이지 로딩시 댓글 목록 출력 
		$(document).ready(function(){
		    commentList(); 
		});
		
		// 댓글 목록 가져와서 보여주기
		function commentList(){
			var _url = '${contextPath}/commentServlet/listComment.do';
			var _commentListInfo = '{"eventNo":"'+${eventNo}+'"}';
			
		    $.ajax({
		        url : _url,
		        type : 'post',
		        data : {commentListInfo : _commentListInfo},
		        success : function(data){
		        	var a = '';
		        	
		        	if(data == null || data == '') {
            			a += '<tr id="replyEmpty">';
            			a += '<td class="py-5 text-center" colspan="3">등록된 댓글이 없습니다.</td>';
            			a += '</tr>';
            			$(".comment-list-table").html(a);
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
			           		var lev = value.commentRe_lev;
			           		
				           	a += '<tr id="comment'+no+'">';
				           	a += '<td class="d-none d-lg-table-cell align-middle">';
				           	
				           	for(var i = 0; i < value.commentRe_lev; i++) {
				           		a += '&nbsp;&nbsp;&nbsp;&nbsp;'; 
				           	}
				           	if(lev > 0) {
				           		a += '<object type="image/svg+xml" data="../images/commentArrow.svg" style="width:15px"></object>&nbsp;';
				           	}
				           	a += name+'</td>';
							a += '<td class="text-left align-middle">';
							a += content;	 
							if('${userId}' == id){
								a += '<button type="button" class="btn btn-sm btn-danger ml-2" onclick="commentUpdate('+no+',\''+content+'\')">수정</button>';
								a += '<button type="button" class="btn btn-sm btn-danger ml-2" onclick="commentDelete('+no+')">삭제</button>';
							}
							if('${userId}' != '') {
								a += '<button type="button" class="btn btn-sm btn-danger ml-2" onclick="commentReply('+no+')">답변</button>';	
							}
							
							a += '</td>';
							a += '<td class="d-none d-lg-table-cell text-center align-middle">';
							a += '<small>'+date+'</small>';
							a += '</td>';	
							a += '</tr>';
							$(".comment-list-table").html(a);	
	            		});
	           		});
		       },
		       error: function(err) {
		    	   alert("댓글목록 통신에러");
		           console.log(err);
		       }
		    });
		}

		// 댓글 등록
		function commentSubmit(){
			
			var eventNo = ${eventNo};
			var userId = '${userId}';
			var userName = '${userName}';
			var commentContent = document.commentform.commentContent.value; 
			
			if(commentContent.length == 0){
				alert("댓글 내용을 입력해주세요.");
				document.commentform.commentContent.focus();
				return;
			}
			
			var _commentInfo = '{"eventNo":"'+eventNo+'","userId":"'+userId+'","userName":"'+userName+'","commentContent":"'+commentContent+'"}';
			var _url = '${contextPath}/commentServlet/insertComment.do';			
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
					alert("댓글등록 통신에러");	
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
			
			var eventNo = ${eventNo};
			var userId = '${userId}';
			var userName = '${userName}';
			var replyContent = document.commentform.replyContent.value; 
			
			if(replyContent.length == 0){
				alert("답변 내용을 입력해주세요.");
				document.commentform.replyContent.focus();
				return;
			}
			
			var _commentReplyInfo = '{"commentNo":"'+commentNo+'","eventNo":"'+eventNo+'","userId":"'+userId+'","userName":"'+userName+'","replyContent":"'+replyContent+'"}';
			var _url = '${contextPath}/commentServlet/replyComment.do';
			
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
					alert("대댓글달기 통신에러");	
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
				var _url = '${contextPath}/commentServlet/updateComment.do';
				
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
						alert("댓글수정 통신에러");	
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
				var _url = '${contextPath}/commentServlet/deleteComment.do'; 		
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
						alert("댓글삭제 통신에러");	
					}				
				});
			}
		}
		
	</script>
</body>
</html>