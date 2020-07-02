<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<% request.setCharacterEncoding("UTF-8"); %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%--
<c:set var="boardCategoryNo" value="${sessionScope.boardCategoryNo}" />
<c:set var="boardNo" value="${requestScope.boardNo}" />

<c:set var="userId" value="${sessionScope.userId}" />
<c:set var="userName" value="${requestScope.userName}" />
--%>
<c:set var="commentList" value="${requestScope.commentList}" />
 
<c:set var="boardCategoryNo" value="1" />
<c:set var="boardNo" value="1" />
<c:set var="userId" value="${'hong'}" />
<c:set var="userName" value="${'홍길동'}" />

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
		// 페이지 로딩시 댓글 목록 출력 
		$(document).ready(function(){
		    commentList(); 
		});
		
		// 댓글 목록 가져와서 출력
		function commentList(){
			var _url = '${contextPath}/comment/listComment.do'; 
			var _commentListInfo = '{"boardCategoryNo":"'+${boardCategoryNo}+'","boardNo":"'+${boardNo}+'"}';

			$.ajax({
		        url : _url,
		        type : 'post',
		        data : {commentListInfo : _commentListInfo},
		        success : function(data){
		        	var a = '';
		        	if(data == null || data == '') {
		        		a += '<tr id="commentEmpty">';
		        		a += '<td class="py-5 text-center" colspan="3">';
						a += '등록된 댓글이 없습니다.</td>';
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
			            	
			            	a += '<tr id="comment'+no+'">';
							a += '<td class="d-none d-lg-table-cell align-middle">'+name+'</td>';
							a += '<td class="text-left align-middle">';
							a += content;
							if('${userId}' == id){
								a += '<button type="button" class="btn btn-sm btn-danger ml-2" onclick="commentDelete('+no+')">삭제</button>'; 	
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
		        error : function(){
					alert("통신에러가 발생했습니다.");	
				}
		    });
		}

		function commentSubmit(){
			
			var boardCategoryNo = ${boardCategoryNo};
			var boardNo = ${boardNo};
			var userId = ${userId};
			var userName = ${userName};
			var commentContent = document.commentform.commentContent.value; 
			
			if(commentContent.length == 0){
				alert("댓글 내용을 입력해주세요.");
				document.commentform.commentContent.focus();
				return;
			}
			
			var _commentInfo = '{"boardCategoryNo":"'+boardCategoryNo+'","boardNo":"'+boardNo+'","userId":"'+userId+'","userName":"'+userName+'","commentContent":"'+commentContent+'"}';
						
			$.ajax({
				type : "post",
				async : "false",
				url : "${contextPath}/comment/insertComment.do",
				data : {commentInfo : _commentInfo},
				success : function(data, status){
					var jsonInfo = JSON.parse(data);
					
					var ajaxNo = jsonInfo.commentNo;
					var ajaxName = jsonInfo.userName;
					var ajaxContent = jsonInfo.commentContent;
					var ajaxDate = jsonInfo.commentWriteDate;
					
					var str = "";					
					
					str += '<tr id="comment' + ajaxNo + '">';
					str += '	<td class="d-none d-lg-table-cell align-middle">' + ajaxName + '</td>';
					str += '	<td class="text-left align-middle">';
					str += 			ajaxContent;				
					str += '		<button type="button" class="btn btn-sm btn-danger ml-2" onclick="commentDelete(\'' + ajaxNo + '\')">삭제</button>';
					str += '		<small class="d-block d-lg-none text-right mb-1 text-muted">';
					str += 				ajaxName + ' | ' + ajaxDate;
					str += '		</small>';
					str += '	</td>';
					str += '	<td class="d-none d-lg-table-cell text-center align-middle">';
					str += '		<small>' + ajaxDate + '</small>';
					str += '	</td>';
					str += '</tr>';
					
					$(".comment-list-table").append(str);
					
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
		
		function commentDelete(commentNo){
			
			var result = confirm("댓글을 삭제하시겠습니까?");
			
			if(result){	

				var userId = ${userId};
				
				var _commentDeleteInfo = '{"userId":"'+userId+'","commentNo":"'+commentNo+'"}';
							
				$.ajax({
					type : "post",
					async : "false",
					url : "${contextPath}/comment/deleteComment.do",
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
		}
		
	</script>
</body>
</html>